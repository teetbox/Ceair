//
//  HttpRequest.swift
//  Ceair
//
//  Created by Tong Tian on 9/20/17.
//  Copyright © 2017 Bizersoft. All rights reserved.
//

import Foundation

struct HttpRequest {
    
    let path: String
    let session: URLSession
    var urlRequest: URLRequest
    
    func fire(compeltion: @escaping (HttpResponse) -> Void) {
        session.dataTask(with: urlRequest) { (data, response, error) in
            let httpResponse = HttpResponse(data: data, response: response, error: error)
            compeltion(httpResponse)
        }.resume()
    }
    
}
