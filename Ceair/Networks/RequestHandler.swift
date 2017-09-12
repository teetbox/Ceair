//
//  RequestHandler.swift
//  Ceair
//
//  Created by Tong Tian on 9/12/17.
//  Copyright © 2017 Bizersoft. All rights reserved.
//

import Foundation

typealias RequestInfo = [String: Any]
typealias ResponseInfo = (Data?, Error?) -> Void

struct RequestHandler {
    
    static func performLogin(requestInfo: RequestInfo, completion: ResponseInfo) {
        
    }
    
}
