//
//  Response.swift
//  Ceair
//
//  Created by Tong Tian on 9/12/17.
//  Copyright © 2017 Bizersoft. All rights reserved.
//

import Foundation

struct Response2 {
    
    let data: Data?
    let urlResponse: URLResponse?
    let networkError: NetworkError?
    let error: Error?
    var jsonData: Parameters?
    
    init(data: Data? = nil, response: URLResponse? = nil, error: Error? = nil) {
        self.data = data
        self.urlResponse = response
        self.networkError = error as? NetworkError
        self.error = error
    }

}
