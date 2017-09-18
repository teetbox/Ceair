//
//  URLSession+Aintx.swift
//  Ceair
//
//  Created by Tong Tian on 9/18/17.
//  Copyright © 2017 Bizersoft. All rights reserved.
//

import Foundation

extension URLSession {
    
    func performDataTask(with request: Request, completion: @escaping (Response) -> Void) {
        dataTask(with: request.urlRequest) { (data, response, error) in
            let response = Response(data: data, response: response, error: error)
            completion(response)
        }.resume()
    }
    
}
