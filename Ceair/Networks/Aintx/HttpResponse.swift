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
    
    var json: [String: Any]? {
        return parseJSON()
    }
    
    init(data: Data? = nil, response: URLResponse? = nil, error: Error? = nil) {
        self.data = data
        self.response = response
        self.error = error
    }
    
    private func parseJSON() -> [String: Any]? {
        guard data != nil else { return nil }
        
        if let json = try? JSONSerialization.jsonObject(with: data!) as? [String: Any] {
            return json
        }
        return nil
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

