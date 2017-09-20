//
//  Request.swift
//  Ceair
//
//  Created by Tong Tian on 9/18/17.
//  Copyright © 2017 Bizersoft. All rights reserved.
//

import Foundation

struct Request {
    
    var urlRequest: URLRequest
    
    var httpHeader: Dictionary<String, String>?
    var httpBody: Dictionary<String, Any>?
    
    var isFake = false
    
    init(url: URL, httpHeaders: [String: String]? = nil) {
        self.urlRequest = URLRequest(url: url)
    }
    
    init(path: String) {
        self.urlRequest = URLRequest(url: URL(string: path)!)
    }
    
}
