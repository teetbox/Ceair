//
//  Networks.swift
//  Ceair
//
//  Created by Tong Tian on 9/13/17.
//  Copyright © 2017 Bizersoft. All rights reserved.
//

import Foundation

struct NETWORKS {
    
    static let MethodKey = "methodType"
    struct MethodValue {
        static let Get = "GET"
        static let Post = "POST"
        static let Delete = "DELETE"
        static let Update = "UPDATE"
    }
    
    static let SessionKey = "sessionType"
    struct SessionValue {
        static let Standard = "standard"
        static let Ephemeral = "ephemeral"
        static let Background = "background"
        static let Identifier = "identifier"
    }
    
    static let RequestKey = "requestType"
    struct RequestValue {
        static let Data = "data"
        static let Upload = "upload"
        static let Download = "download"
        static let Stream = "stream"
    }
    
    static let ContentTypeKey = "Content-Type"
    struct ContentTypeValue {
        static let Json = "application/json"
    }
    
    static let AcceptKey = "Accept"
    struct AcceptValue {
        static let Json = "application/json"
    }
    
    static let BaseURL = "baseURL"
    static let Path = "path"
    static let QueryString = "queryString"
    static let Parameters = "parameters"
    
    struct Response {
        static let Status = "status"
        static let Data = "data"
    }
    
    static let Error = "error"
    
}
