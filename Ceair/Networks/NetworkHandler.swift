//
//  NetworkHandler.swift
//  Ceair
//
//  Created by Tong Tian on 9/12/17.
//  Copyright © 2017 Bizersoft. All rights reserved.
//

import Foundation

typealias RequestInfo = [String: Any]
typealias ResponseInfo = (Data?, Error?) -> Void

struct NetworkHandler {
    
    static let GetRequest = [Networks.Method: "GET", Networks.Host: URLs.Host]
    static let PostRequest = [Networks.Method: "POST", Networks.Host: URLs.Host]
    
    static func performHttpRequest(requestInfo: RequestInfo, completion: ResponseInfo) {
        guard let method = requestInfo["method"] as? String else { return }
        
        switch method {
        case "GET":
            Aintx.standard.request(endPoint: "", method: .get, parameters: nil, completion: { (result) in
                
            })
        case "POST":
            Aintx.standard.request(endPoint: "", method: .post, parameters: nil, completion: { (result) in
                
            })
        default:
            fatalError("Unexpected HTTP Method: \(method)")
        }
    }
    
}
