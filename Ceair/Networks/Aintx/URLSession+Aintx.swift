//
//  URLSession+Aintx.swift
//  Ceair
//
//  Created by Tong Tian on 9/12/17.
//  Copyright © 2017 Bizersoft. All rights reserved.
//

import Foundation

extension URLSession {

    func performDataTask(with request: URLRequest, completion: @escaping (Response) -> Void) {
        let task = dataTask(with: request) { (data, response, error) in
            let response = Response(data: data, response: response, error: error)
            
            DispatchQueue.main.async {
                completion(response)
            }
        }
        task.resume()
    }
    
}
