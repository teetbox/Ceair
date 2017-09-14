//
//  Networks.swift
//  Ceair
//
//  Created by Tong Tian on 9/13/17.
//  Copyright © 2017 Bizersoft. All rights reserved.
//

import Foundation

struct NETWORKS {
    
    static let Method = "method"
    struct MethodType {
        static let Get = "GET"
        static let Post = "POST"
        static let Delete = "DELETE"
        static let Update = "UPDATE"
    }
    
    static let Session = "session"
    struct SessionType {
        static let Standard = "standard"
        static let Ephemeral = "ephemeral"
        static let Background = "background"
        static let BackgroundIdentifier = "backgroundIdentifier"
    }
    
    static let Host = "host"
    static let EndPoint = "endPoint"
    static let QueryString = "queryString"
    static let Params = "params"
    
    struct Response {
        static let Status = "status"
        static let Data = "data"
    }
    
    static let Error = "error"
    
}
