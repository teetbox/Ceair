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

enum ResponseType {
    case json
    case data
    case image
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
    var responseType: ResponseType = .json
    
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
    func go(_ path: String, queryString: [String: String]? = nil, parameters: [String: Any]? = nil, completion: @escaping (HttpResponse) -> Void) {
        go(path, method: httpMethod, requestType: requestType, responseType: responseType, queryString: queryString, parameters: parameters ,completion: completion)
    }
    
    /* ✅ */
    func go(_ path: String, method: HttpMethod, queryString: Dictionary<String, String>? = nil, parameters: Parameters? = nil, completion: @escaping (HttpResponse) -> Void) {
        go(path, method: method, requestType: requestType, responseType: responseType, queryString: queryString, parameters: parameters ,completion: completion)
    }
    
    /* ✅ */
    func go(_ path: String, requestType: RequestType, queryString: Dictionary<String, String>? = nil, parameters: Parameters? = nil, completion: @escaping (HttpResponse) -> Void) {
        go(path, method: httpMethod, requestType: requestType, responseType: responseType, queryString: queryString, parameters: parameters ,completion: completion)
    }
    
    /* ✅ */
    func go(_ path: String, responseType: ResponseType, queryString: Dictionary<String, String>? = nil, parameters: Parameters? = nil, completion: @escaping (HttpResponse) -> Void) {
        go(path, method: httpMethod, requestType: requestType, responseType: responseType, queryString: queryString, parameters: parameters ,completion: completion)
    }
    
    /* ✅ */
    func go(_ path: String, method: HttpMethod, requestType: RequestType, queryString: Dictionary<String, String>? = nil, parameters: Parameters? = nil, completion: @escaping (HttpResponse) -> Void) {
        go(path, method: method, requestType: requestType, responseType: responseType, queryString: queryString, parameters: parameters ,completion: completion)
    }
    
    /* ✅ */
    func go(_ path: String, method: HttpMethod, responseType: ResponseType, queryString: Dictionary<String, String>? = nil, parameters: Parameters? = nil, completion: @escaping (HttpResponse) -> Void) {
        go(path, method: method, requestType: requestType, responseType: responseType, queryString: queryString, parameters: parameters ,completion: completion)
    }
    
    /* ✅ */
    func go(_ path: String, requestType: RequestType, responseType: ResponseType, queryString: Dictionary<String, String>? = nil, parameters: Parameters? = nil, completion: @escaping (HttpResponse) -> Void) {
        go(path, method: httpMethod, requestType: requestType, responseType: responseType, queryString: queryString, parameters: parameters ,completion: completion)
    }
    
    /* ✅ */
    func go(_ path: String, method: HttpMethod, requestType: RequestType, responseType: ResponseType, queryString: Dictionary<String, String>? = nil, parameters: Parameters? = nil, completion: @escaping (HttpResponse) -> Void) {
        if (isFake) {
            let fakeResponse = HttpResponse(path: path, method: method, requestType: requestType, responseType: responseType, queryString: queryString, parameters: parameters)
            completion(fakeResponse)
            return
        }
        
        let request = createHttpRequest(path: path, method: method, requestType: requestType, responseType: responseType)
        request.fire(completion: completion)
    }
    
    func go(_ request: HttpRequest, completion: @escaping (HttpResponse) -> Void) {
        request.fire(completion: completion)
    }
    
    /* ✅ */
    func createHttpRequest(path: String, queryString: Dictionary<String, String>? = nil, parameters: Parameters? = nil) -> HttpRequest {
        return createHttpRequest(path: path, method: httpMethod, requestType: requestType, responseType: responseType, queryString: queryString, parameters: parameters)
    }
    
    /* ✅ */
    func createHttpRequest(path: String, method: HttpMethod, queryString: Dictionary<String, String>? = nil, parameters: Parameters? = nil) -> HttpRequest {
        return createHttpRequest(path: path, method: method, requestType: requestType, responseType: responseType, queryString: queryString, parameters: parameters)
    }
    
    /* ✅ */
    func createHttpRequest(path: String, requestType: RequestType, queryString: Dictionary<String, String>? = nil, parameters: Parameters? = nil) -> HttpRequest {
        return createHttpRequest(path: path, method: httpMethod, requestType: requestType, responseType: responseType, queryString: queryString, parameters: parameters)
    }
    
    /* ✅ */
    func createHttpRequest(path: String, method: HttpMethod, requestType: RequestType, responseType: ResponseType, queryString: Dictionary<String, String>? = nil, parameters: Parameters? = nil) -> HttpRequest {
        let httpRequest: HttpRequest
        
        if (isFake) {
            httpRequest = FakeRequest(base: base, path: path, method: method, requestType: requestType, responseType: responseType, queryString: queryString, parameters: parameters, session: session)
            return httpRequest
        }
        
        switch requestType {
        case .data:
            httpRequest = HttpDataRequest(base: base, path: path, responseType: responseType, queryString: nil, parameters: nil, session: session)
        default:
            httpRequest = HttpDataRequest(base: base, path: path, responseType: responseType, queryString: nil, parameters: nil, session: session)
        }
        
        return httpRequest
    }

}
