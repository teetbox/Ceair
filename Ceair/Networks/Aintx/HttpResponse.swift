//
//  HttpResponse.swift
//  Ceair
//
//  Created by Tong Tian on 9/12/17.
//  Copyright © 2017 Bizersoft. All rights reserved.
//

import Foundation

struct HttpResponse {
    
    let data: Data?
    let response: URLResponse?
    let error: Error?
    
    var httpError: HttpError?
    var jsonData: Parameters?
    
    init(data: Data?, response: URLResponse?, error: Error?) {
        self.data = data
        self.response = response
        self.error = error
        
        print(response)
        print(error)
    }

}
