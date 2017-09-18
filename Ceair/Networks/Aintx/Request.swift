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
    
    init(url: URL, httpHeaders: [String: String]? = nil) {
        self.urlRequest = URLRequest(url: url)
    }
    
}
