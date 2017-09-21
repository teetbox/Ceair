//
//  HttpRequest.swift
//  Ceair
//
//  Created by Tong Tian on 9/20/17.
//  Copyright © 2017 Bizersoft. All rights reserved.
//

import Foundation

enum RequestType: String {
    case data
    case upload
    case downLoad
    case stream
}

struct HttpRequest {
    
    let path: String
    var request: URLRequest
    let session: URLSession
    var type: RequestType
    
    init(path: String, request: URLRequest, session: URLSession, type: RequestType = .data) {
        self.path = path
        self.session = session
        self.request = request
        self.type = type
    }
    
    func fire(compeltion: @escaping (HttpResponse) -> Void) {
        session.dataTask(with: request) { (data, response, error) in
            let httpResponse = HttpResponse(data: data, response: response, error: error)
            compeltion(httpResponse)
        }.resume()
    }
    
}
