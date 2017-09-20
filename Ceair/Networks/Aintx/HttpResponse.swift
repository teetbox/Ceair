//
//  HttpResponse.swift
//  Ceair
//
//  Created by Tong Tian on 9/20/17.
//  Copyright © 2017 Bizersoft. All rights reserved.
//

import Foundation

protocol Response {
    var data: Data? { get }
    var response: URLResponse? { get }
    var error: Error? { get }
}

struct HttpResponse: Response {
    
    let data: Data?
    let response: URLResponse?
    let error: Error?
    
    var jsonData: Dictionary<String, String>? {
        return toJSON()
    }
    
    init(data: Data?, response: URLResponse?, error: Error?) {
        self.data = data
        self.response = response
        self.error = error
    }
    
    func toJSON() -> Dictionary<String, String>? {
        return try! JSONSerialization.jsonObject(with: data!, options: []) as? Dictionary<String, String>
    }
    
}

struct DecodableResponse<T: Decodable>: Response {
    
    let data: Data?
    let response: URLResponse?
    let error: Error?
    
    var entity: T?
    
    init(data: Data?, response: URLResponse?, error: Error?) {
        self.data = data
        self.response = response
        self.error = error
    }
    
}

