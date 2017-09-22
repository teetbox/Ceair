//
//  HttpRequest.swift
//  Ceair
//
//  Created by Tong Tian on 9/20/17.
//  Copyright © 2017 Bizersoft. All rights reserved.
//

import Foundation

protocol HttpRequest {
    var path: String { get }
    var session: URLSession { get }
    var queryString: String? { get }
    var parameters: Parameters? { get }
    
    var urlRequest: URLRequest?  { get }
    
    init(base: String, path: String, queryString: String?, parameters: Parameters?, session: URLSession)
    
    func fire(completion: @escaping (HttpResponse) -> Void)
}

struct DataRequest: HttpRequest {
    
    let base: String
    let path: String
    let session: URLSession
    var urlRequest: URLRequest?
    var queryString: String?
    
    var parameters: Parameters?
    
    init(base: String, path: String, queryString: String?, parameters: Parameters?, session: URLSession) {
        self.base = base
        self.path = path
        self.session = session
        
        urlRequest = URLRequest(url: URL(string: base + path)!)
        urlRequest!.httpMethod = "GET"
        urlRequest!.setValue("application/json", forHTTPHeaderField: "Content-Type")
    }
    
    func fire(completion: @escaping (HttpResponse) -> Void) {
        session.dataTask(with: urlRequest!) { (data, response, error) in
            completion(HttpResponse(data: data, response: response, error: error))
        }.resume()
    }
    
}
