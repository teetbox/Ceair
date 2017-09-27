//
//  HttpRequest.swift
//  Ceair
//
//  Created by Tong Tian on 9/20/17.
//  Copyright © 2017 Bizersoft. All rights reserved.
//

import Foundation

protocol HttpRequest {
    var urlRequest: URLRequest? { get set }
    var error: HttpError? { get set  }
    
    func fire(completion: @escaping (HttpResponse) -> Void)
}

struct HttpDataRequest: HttpRequest {
    
    let base: String
    let path: String
    let session: URLSession
    
    var querys: Dictionary<String, String>?
    var params: Dictionary<String, Any>?
    
    var urlRequest: URLRequest?
    var error: HttpError?
    
    init(base: String, path: String, querys: Dictionary<String, String>?, params: Parameters?, session: URLSession) {
        self.base = base
        self.path = path
        self.session = session
        
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
            completion(HttpResponse(data: data, response: response, error: error))
        }.resume()
    }
    
}

struct HttpUploadRequest: HttpRequest {
    
    let base: String
    let path: String
    let session: URLSession

    var querys: Dictionary<String, String>?
    var params: Dictionary<String, Any>?
    
    var urlRequest: URLRequest?
    var error: HttpError?
    
    init(base: String, path: String, querys: Dictionary<String, String>?, params: Parameters?, session: URLSession) {
        self.base = base
        self.path = path
        self.session = session
    }
    
    func fire(completion: @escaping (HttpResponse) -> Void) {
        
    }
    
}

struct FakeRequest: HttpRequest {
    
    var base: String?
    var path: String?
    var httpMethod: HttpMethod?
    var requestType: RequestType?
    var querys: Dictionary<String, String>?
    var params: Dictionary<String, Any>?
    var session: URLSession?
    
    var urlRequest: URLRequest?
    var error: HttpError?
    
    init(base: String, path: String, method: HttpMethod, type: RequestType, querys: Dictionary<String, String>? = nil, params: Parameters? = nil, session: URLSession) {
        self.base = base
        self.path = path
        self.httpMethod = method
        self.requestType = type
        self.querys = querys
        self.params = params
        self.session = session
    }
    
    func fire(completion: @escaping (HttpResponse) -> Void) {
        
    }
    
}
