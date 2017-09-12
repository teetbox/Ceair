//
//  URLSession+Aintx.swift
//  Ceair
//
//  Created by Tong Tian on 9/12/17.
//  Copyright © 2017 Bizersoft. All rights reserved.
//

import Foundation

extension URLSession {

    func performDataTask(with request: URLRequest, completion: @escaping (Result) -> Void) {
        let task = dataTask(with: request) { (data, response, error) in
            let httpResponse = Response(data: data, response: response, error: error)
            
            let result = Result.success(httpResponse)
            
            DispatchQueue.main.async {
                completion(result)
            }
        }
        task.resume()
    }
    
}
