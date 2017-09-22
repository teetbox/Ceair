//
//  NetworkHandler.swift
//  Ceair
//
//  Created by Tong Tian on 9/12/17.
//  Copyright © 2017 Bizersoft. All rights reserved.
//

import Foundation

typealias RequestInfo = [String: Any]
typealias ResponseInfo = [String: Any]
typealias ResponseHandler = ([String: Any]) -> Void

struct NetworkHandler {
    
    static let GetRequestInfo = [NETWORKS.Domain: URLS.Domain,
                             NETWORKS.MethodKey: NETWORKS.MethodValue.Get,
                             NETWORKS.RequestKey: NETWORKS.RequestValue.Data,
                             NETWORKS.SessionKey: NETWORKS.SessionValue.Standard]
    
    static let PostRequestInfo = [NETWORKS.Domain: URLS.Domain,
                              NETWORKS.MethodKey: NETWORKS.MethodValue.Post,
                              NETWORKS.RequestKey: NETWORKS.RequestValue.Data,
                              NETWORKS.SessionKey: NETWORKS.SessionValue.Standard]
    
}
