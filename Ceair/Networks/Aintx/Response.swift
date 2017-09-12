//
//  Response.swift
//  Ceair
//
//  Created by Tong Tian on 9/12/17.
//  Copyright © 2017 Bizersoft. All rights reserved.
//

import Foundation

struct Response {
    
    let data: Data?
    let response: URLResponse?
    let error: Error?
    var jsonData: Parameters?
    
    init(data: Data?, response: URLResponse?, error: Error?) {
        self.data = data
        self.response = response
        self.error = error
    }

}
