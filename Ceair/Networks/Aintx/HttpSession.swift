//
//  HttpSession.swift
//  Ceair
//
//  Created by Tong Tian on 9/12/17.
//  Copyright © 2017 Bizersoft. All rights reserved.
//

import Foundation

struct HttpSession {
    
    let session: URLSession
    
    init(session: URLSession) {
        self.session = session
    }
    
    func performDataTask(with request: URLRequest, completion: @escaping (HttpResponse) -> Void) {
        let task = session.dataTask(with: request) { (data, response, error) in
            let httpResponse = HttpResponse(data: data, response: response, error: error)
            
            DispatchQueue.main.async {
                completion(httpResponse)
            }
        }
        task.resume()
    }
    
}
