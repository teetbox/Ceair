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

enum RequestType: String {
    case data
    case upload
    case downLoad
    case stream
}

typealias Parameters = [String: Any]

// MARK: -

struct Aintx {
    
    let urlString: String
    var httpRequest: HttpRequest?
    
    init(url: String) {
        self.init(url: url, session: .standard)
    }
    
    init(url: String, session: SessionType) {
        urlString = url
        
    }
    
    private init() {
        urlString = URLS.Domain
    }
    
    // MARK: - Methods
    
    func setupHttpRequest(path: String, method: HttpMethod = .get) -> HttpRequest {
        let url = URL(string: urlString + path)!
        var request = URLRequest(url: url)
        
        request.httpMethod = method.rawValue
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        return HttpRequest(path: path, session: URLSession.shared, urlRequest: request)
    }

}
