//
//  Aintx.swift
//  Ceair
//
//  Created by Tong Tian on 8/31/17.
//  Copyright © 2017 Bizersoft. All rights reserved.
//

import Foundation

enum HttpMethod: String {
    case get = "GET"
    case post = "POST"
}

typealias Parameters = [String: Any]

class Aintx {
    
    static let shared = Aintx()
    
    private init() {}
    
    let session = HttpSession(session: URLSession.shared)
    
    func request(endPoint: String, method: HttpMethod = .get, parameters: Parameters? = nil, completion: @escaping (HttpResponse) -> Void) {

        guard let url = composeURL(endPoint: endPoint, method: method, parameters: parameters) else {
            return
        }
        
        performDataRequest(url: url, method: method, parameters: parameters, completion: completion)
    }
    
    func composeURL(endPoint: String, method: HttpMethod, parameters: Parameters?) -> URL? {
        return nil
    }
    
    private func performDataRequest(url: URL, method: HttpMethod, parameters: Parameters?, completion: @escaping (HttpResponse) -> Void) {
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        session.performDataTask(with: request, completion: completion)
    }

}

class HttpSession {
    
    let session: URLSession
    
    init(session: URLSession) {
        self.session = session
    }
    
    func performDataTask(with request: URLRequest, completion: @escaping (HttpResponse) -> Void) {
        let task = session.dataTask(with: request) { (data, response, error) in
            let httpResponse = HttpResponse(data: data, response: response, error: error)
            
            DispatchQueue.main.async {
                completion(httpResponse)
            }
        }
        task.resume()
    }
}

struct HttpResponse {
    let data: Data?
    let response: URLResponse?
    let error: Error?
    
    var parameters: Parameters?
    
    init(data: Data?, response: URLResponse?, error: Error?) {
        self.data = data
        self.response = response
        self.error = error
    }
}
