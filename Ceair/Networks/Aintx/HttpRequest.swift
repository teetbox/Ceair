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
    
    var queryString: String?
    var parameters: Parameters?
    
    var urlRequest: URLRequest?
    var error: HttpError?
    
    init(base: String, path: String, queryString: String?, parameters: Parameters?, session: URLSession) {
        self.base = base
        self.path = path
        self.session = session
        
        guard let url = URL(string: base + path) else {
            error = HttpError.invalidURL(base + path)
            return
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

    var queryString: String?
    var parameters: Parameters?
    
    var urlRequest: URLRequest?
    var error: HttpError?
    
    init(base: String, path: String, queryString: String?, parameters: Parameters?, session: URLSession) {
        self.base = base
        self.path = path
        self.session = session
    }
    
    func fire(completion: @escaping (HttpResponse) -> Void) {
        
    }
    
}
