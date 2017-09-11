//
//  HttpEncording.swift
//  Ceair
//
//  Created by Tong Tian on 9/11/17.
//  Copyright © 2017 Bizersoft. All rights reserved.
//

import Foundation

protocol HttpEncording {
    
    func encord(_ urlRequest: URLRequest, with parameters: Parameters?) throws -> URLRequest
    
}

struct HttpURLEncording: HttpEncording {
    
    func encord(_ urlRequest: URLRequest, with parameters: Parameters?) throws -> URLRequest {
        
        
        return urlRequest
    }
    
}
