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

enum RequestType {
    case data
    case downLoad
    case upload
    case stream
}

typealias Parameters = [String: Any]

// MARK: -

struct Aintx {
    
    let base: String
    let session: URLSession
    let config: SessionConfig
    
    var httpMethod: HttpMethod = .get
    var requestType: RequestType = .data
    
    var isFake = false
    var fakeResponse: HttpResponse?
    
    /* ✅ */
    init(base: String, config: SessionConfig = .default) {
        self.base = base
        self.config = config
        self.session = SessionManager.getSession(with: config)
    }
    
    // MARK: - Methods
    
    /* ✅ */
    func go(_ path: String, querys: Dictionary<String, String>? = nil, params: Parameters? = nil, completion: @escaping (HttpResponse) -> Void) {
        go(path, method: httpMethod, type: requestType, querys: querys, params: params ,completion: completion)
    }
    
    /* ✅ */
    func go(_ path: String, method: HttpMethod, querys: Dictionary<String, String>? = nil, params: Parameters? = nil, completion: @escaping (HttpResponse) -> Void) {
        go(path, method: httpMethod, type: requestType, querys: querys, params: params ,completion: completion)
    }
    
    /* ✅ */
    func go(_ path: String, type: RequestType, querys: Dictionary<String, String>? = nil, params: Parameters? = nil, completion: @escaping (HttpResponse) -> Void) {
        go(path, method: httpMethod, type: requestType, querys: querys, params: params ,completion: completion)
    }
    
    /* ✅ */
    func go(_ path: String, method: HttpMethod, type: RequestType, querys: Dictionary<String, String>? = nil, params: Parameters? = nil, completion: @escaping (HttpResponse) -> Void) {
        if (isFake) {
            let fakeResponse = HttpResponse(path: path, method: method, type: type, querys: querys, params: params)
            completion(fakeResponse)
            return
        }
        
        let request = createHttpRequest(path: path, method: method, type: type)
        request.fire(completion: completion)
    }
    
    func go(_ request: HttpRequest, completion: @escaping (HttpResponse) -> Void) {
        request.fire(completion: completion)
    }
    
    /* ✅ */
    func createHttpRequest(path: String, querys: Dictionary<String, String>? = nil, params: Parameters? = nil) -> HttpRequest {
        return createHttpRequest(path: path, method: httpMethod, type: requestType, querys: querys, params: params)
    }
    
    /* ✅ */
    func createHttpRequest(path: String, method: HttpMethod, querys: Dictionary<String, String>? = nil, params: Parameters? = nil) -> HttpRequest {
        return createHttpRequest(path: path, method: method, type: requestType, querys: querys, params: params)
    }
    
    /* ✅ */
    func createHttpRequest(path: String, type: RequestType, querys: Dictionary<String, String>? = nil, params: Parameters? = nil) -> HttpRequest {
        return createHttpRequest(path: path, method: httpMethod, type: type, querys: querys, params: params)
    }
    
    /* ✅ */
    func createHttpRequest(path: String, method: HttpMethod, type: RequestType, querys: Dictionary<String, String>? = nil, params: Parameters? = nil) -> HttpRequest {
        let httpRequest: HttpRequest
        
        if (isFake) {
            httpRequest = FakeRequest(base: base, path: path, method: method, type: type, querys: querys, params: params, session: session)
            return httpRequest
        }
        
        switch type {
        case .data:
            httpRequest = HttpDataRequest(base: base, path: path, querys: nil, params: nil, session: session)
        default:
            httpRequest = HttpDataRequest(base: base, path: path, querys: nil, params: nil, session: session)
        }
        
        return httpRequest
    }

}
