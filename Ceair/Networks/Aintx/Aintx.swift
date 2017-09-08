//
//  Aintx.swift
//  Ceair
//
//  Created by Tong Tian on 8/31/17.
//  Copyright © 2017 Bizersoft. All rights reserved.
//

import Foundation

enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case delete = "DELETE"
}

typealias Parameters = [String: Any]

class Aintx {
    
    static let shared = Aintx()
    
    private init() {}
    
    let session = HTTPSession(session: URLSession.shared)
    
    func request(endPoint: String, method: HTTPMethod = .get, parameters: Parameters? = nil, completion: @escaping (HTTPResponse) -> Void) {
        
        guard let url = URL(string: endPoint) else {
            return
        }
        
        performDataRequest(url: url, method: method, completion: completion)
    }
    
    private func performDataRequest(url: URL, method: HTTPMethod, completion: @escaping (HTTPResponse) -> Void) {
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        session.performDataTask(with: request, completion: completion)
    }
    
}

class HTTPSession {
    
    let session: URLSession
    
    init(session: URLSession) {
        self.session = session
    }
    
    func performDataTask(with request: URLRequest, completion: @escaping (HTTPResponse) -> Void) {
        let task = session.dataTask(with: request) { (data, response, error) in
            let httpResponse = HTTPResponse(data: data, response: response, error: error)
            
            DispatchQueue.main.async {
                completion(httpResponse)
            }
        }
        task.resume()
    }
}

struct HTTPResponse {
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
