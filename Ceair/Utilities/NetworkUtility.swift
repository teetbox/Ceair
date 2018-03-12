//
//  NetworkUtility.swift
//  Ceair
//
//  Created by Matt Tian on 12/03/2018.
//  Copyright © 2018 Bizersoft. All rights reserved.
//

import Foundation
import CEHTTP

class NetworkUtility {
    
    let DEFAULT_REQUEST_TIMEOUT: TimeInterval = 30.0
    let DEFAULT_RESOURCE_TIMEOUT: TimeInterval = 60.0
    
    var http: CEHttp
    
    init(baseURL: String, sessionConfig: SessionConfig) {
        http = CEHttp(base: baseURL, config: sessionConfig)
        http.timeoutForRequest = DEFAULT_REQUEST_TIMEOUT
        http.timeoutForResource = DEFAULT_RESOURCE_TIMEOUT
    }
    
    convenience init(baseURL: String) {
        self.init(baseURL: baseURL, sessionConfig: .standard)
    }
    
}
