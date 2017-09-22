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

enum SessionConfig {
    case `default`
    case ephemeral
    case background(String)
}

typealias Parameters = [String: Any]

// MARK: -

struct Aintx {
    
    let baseURL: String
    let sessionConfig: SessionConfig
    var httpRequest: HttpRequest?
    
    var httpMethod: HttpMethod = .get
    var requestType: RequestType = .data
    
    var isFake = false
    var fakeResponse: HttpResponse?
    
    init(url: String, config: SessionConfig = .default) {
        self.baseURL = url
        self.sessionConfig = config
    }
    
    // MARK: - Methods
    
    func go(_ path: String, method: HttpMethod = .get, session: SessionType = .standard, completion: (HttpResponse) -> Void) {
        let httpResponse = HttpResponse()
        completion(httpResponse)
    }
    
    func setupHttpRequest(path: String, method: HttpMethod = .get) -> HttpRequest {
        let url = URL(string: baseURL + path)!
        var request = URLRequest(url: url)
        
        request.httpMethod = method.rawValue
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        return HttpRequest(path: path, request: request, session: URLSession.shared)
    }

}
