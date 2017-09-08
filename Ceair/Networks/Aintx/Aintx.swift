//
//  Aintx.swift
//  Ceair
//
//  Created by Tong Tian on 8/31/17.
//  Copyright © 2017 Bizersoft. All rights reserved.
//

import Foundation

class Aintx {
    
    private static let session = URLSession.shared
    
    static func performGetRequest(_ url: String, params: NSDictionary?, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) {
        
        let requestURL = URL(string: url)!
        let task = session.dataTask(with: requestURL, completionHandler: completionHandler)
        task.resume()
    }
    
    static func performPostRequest() {
        
    }
    
}
