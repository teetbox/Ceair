//
//  HttpRequest.swift
//  Ceair
//
//  Created by Tong Tian on 9/20/17.
//  Copyright © 2017 Bizersoft. All rights reserved.
//

import Foundation

protocol HttpRequest {
    var responseType: ResponseType { get set }
    
    var urlRequest: URLRequest? { get set }
    var error: HttpError? { get set  }
    
    func fire(completion: @escaping (HttpResponse) -> Void)
}

struct HttpDataRequest: HttpRequest {
    
    let base: String
    let path: String
    let session: URLSession
    var responseType: ResponseType
    
    var queryString: Dictionary<String, String>?
    var parameters: Dictionary<String, Any>?
    
    var urlRequest: URLRequest?
    var error: HttpError?
    
    init(base: String, path: String, responseType: ResponseType = .json, queryString: Dictionary<String, String>?, parameters: Parameters?, session: URLSession) {
        self.base = base
        self.path = path
        self.session = session
        self.responseType = responseType
        
        guard let url = URL(string: base + path) else {
            error = HttpError.invalidURL(base + path)
            return
        }
        
        do {
            let _ = try URLEncording.encord(urlString: base + path, method: .get, parameters: nil)
        } catch {
            self.error = error as? HttpError
        }
        
        urlRequest = URLRequest(url: url)
        urlRequest?.httpMethod = "GET"
        urlRequest?.setValue("application/json", forHTTPHeaderField: "Content-Type")
    }
    
    func fire(completion: @escaping (HttpResponse) -> Void) {
        guard error == nil else {
            completion(HttpResponse(error: error))
            return
        }
        
        session.dataTask(with: urlRequest!) { (data, response, error) in
            let httpResponse = HttpResponse(data: data, response: response, error: error)
            completion(httpResponse)
        }.resume()
    }
    
}

struct HttpUploadRequest: HttpRequest {
    
    let base: String
    let path: String
    let session: URLSession
    var responseType: ResponseType

    var queryString: Dictionary<String, String>?
    var parameters: Dictionary<String, Any>?
    
    var urlRequest: URLRequest?
    var error: HttpError?
    
    init(base: String, path: String, responseType: ResponseType = .json, queryString: Dictionary<String, String>?, parameters: Parameters?, session: URLSession) {
        self.base = base
        self.path = path
        self.session = session
        self.responseType = responseType
    }
    
    func fire(completion: @escaping (HttpResponse) -> Void) {
        
    }
    
}

struct FakeRequest: HttpRequest {
    
    var base: String?
    var path: String?
    var httpMethod: HttpMethod?
    var requestType: RequestType?
    var responseType: ResponseType
    var queryString: Dictionary<String, String>?
    var parameters: Dictionary<String, Any>?
    var session: URLSession?
    
    var urlRequest: URLRequest?
    var error: HttpError?
    
    init(base: String, path: String, method: HttpMethod, requestType: RequestType, responseType: ResponseType, queryString: Dictionary<String, String>? = nil, parameters: Parameters? = nil, session: URLSession) {
        self.base = base
        self.path = path
        self.httpMethod = method
        self.requestType = requestType
        self.responseType = responseType
        self.queryString = queryString
        self.parameters = parameters
        self.session = session
    }
    
    func fire(completion: @escaping (HttpResponse) -> Void) {
        
    }
    
}
