//
//  Aintx.swift
//  Ceair
//
//  Created by Tong Tian on 8/31/17.
//  Copyright © 2017 Bizersoft. All rights reserved.
//

import Foundation

enum SessionConfig {
    case `default`
    case ephemeral
    case background(String)
}

enum HttpMethod: String {
    case get = "GET"
    case post = "POST"
    case delete = "DELETE"
}

enum RequestType: String {
    case data
    case upload
    case downLoad
    case stream
}

typealias Parameters = [String: Any]

// MARK: -

struct Aintx {
    
    let baseURL: String
    let session: URLSession
    let config: SessionConfig
    
    var httpMethod: HttpMethod = .get
    var requestType: RequestType = .data
    
    var isFake = false
    var fakeResponse: HttpResponse?
    
    init(url: String, config: SessionConfig = .default) {
        self.baseURL = url
        self.config = config
        self.session = SessionManager.getSession(with: config)
    }
    
    // MARK: - Methods
    
    func go(_ path: String, completion: @escaping (HttpResponse) -> Void) {
        go(path, method: httpMethod, completion: completion)
    }
    
    func go(_ path: String, method: HttpMethod = .get, completion: @escaping (HttpResponse) -> Void) {
        let request = createHttpRequest(path: path)
        
        request.fire(completion: completion)
    }
    
    func go(_ request: HttpRequest, completion: @escaping (HttpResponse) -> Void) {
        request.fire(completion: completion)
    }
    
    func createHttpRequest(path: String, method: HttpMethod = .get, type: RequestType = .data, queryString: String? = nil, parameters: Parameters? = nil) -> HttpRequest {
        let httpRequest: HttpRequest
        
        switch type {
        case .data:
            httpRequest = DataRequest(base: baseURL, path: path, queryString: nil, parameters: nil, session: session)
        default:
            httpRequest = DataRequest(base: baseURL, path: path, queryString: nil, parameters: nil, session: session)
        }
        
        return httpRequest
    }
    
    private func setupHttpRequest(path: String, method: HttpMethod = .get) {
        let url = URL(string: baseURL + path)!
        var request = URLRequest(url: url)
        
        request.httpMethod = method.rawValue
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    }

}
