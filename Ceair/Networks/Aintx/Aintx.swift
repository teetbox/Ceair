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
    
    private func composeURL(endPoint: String, method: HttpMethod, parameters: Parameters?) -> URL? {
        guard method == .get, let params = parameters else {
            return URL(string: URLs.Host + endPoint)
        }
        
        let urlString = URLs.Host + endPoint + queryString(with: params)
        return URL(string: urlString)
    }
    
    private func queryString(with params: Parameters) -> String {
        var queryString = "?"
        
        for (key, value) in params {
            queryString += "\(key)=\(value)&"
        }
        
        return queryString
    }
    
    private func performDataRequest(url: URL, method: HttpMethod, parameters: Parameters?, completion: @escaping (HttpResponse) -> Void) {
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        
        session.performDataTask(with: request, completion: completion)
    }

}
