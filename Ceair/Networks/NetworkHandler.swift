//
//  NetworkHandler.swift
//  Ceair
//
//  Created by Tong Tian on 9/12/17.
//  Copyright © 2017 Bizersoft. All rights reserved.
//

import Foundation

typealias RequestInfo = [String: Any]
typealias ResponseInfo = (Data?, NetworkError?) -> Void

struct NetworkHandler {
    
    static let GetRequest = [Networks.Method: Networks.MethodType.Get, Networks.Session: Networks.SessionType.Standard, Networks.Host: URLs.Host]
    static let PostRequest = [Networks.Method: Networks.MethodType.Post, Networks.Session: Networks.SessionType.Standard, Networks.Host: URLs.Host]
    
    static func performHttpRequest(requestInfo: RequestInfo, completion: @escaping ResponseInfo) {
        guard let methodValue = requestInfo[Networks.Method] as? String else {
            let responseError = NetworkError.requestError(.missingRequestInfo(Networks.Method))
            completion(nil, responseError)
            return
        }
        guard let method = HttpMethod(rawValue: methodValue) else {
            let responseError = NetworkError.requestError(.unsupportedMethod(methodValue))
            completion(nil, responseError)
            return
        }
        guard let sessionValue = requestInfo[Networks.Session] as? String else {
            let responseError = NetworkError.requestError(.missingRequestInfo(Networks.Session))
            completion(nil, responseError)
            return
        }
        guard let session = SessionType(rawValue: sessionValue) else {
            let responseError = NetworkError.requestError(.unsupportedSession(sessionValue))
            completion(nil, responseError)
            return
        }
        guard let host = requestInfo[Networks.Host] as? String else {
            let responseError = NetworkError.requestError(.missingRequestInfo(Networks.Host))
            completion(nil, responseError)
            return
        }
        guard let endPoint = requestInfo[Networks.EndPoint] as? String else {
            let responseError = NetworkError.requestError(.missingRequestInfo(Networks.EndPoint))
            completion(nil, responseError)
            return
        }
        
        let parameters = requestInfo[Networks.Params] as? Parameters
        
        switch session {
        case .standard:
            Aintx.standard.request(urlString: host + endPoint, method: method, parameters: parameters) { (response) in
                completion(response.data, nil)
            }
        
        case .ephemeral:
            Aintx.ephemeral.request(urlString: host + endPoint, completion: { (response) in })
        
        case .background:
            guard let backgroundIdentifier = requestInfo[Networks.BackgroundIdentifier] as? String else {
                let responseError = NetworkError.requestError(.missingRequestInfo(Networks.BackgroundIdentifier))
                completion(nil, responseError)
                return
            }
            let bgAintx = Aintx.background(identifier: backgroundIdentifier)
            bgAintx.request(urlString: host + endPoint, completion: { (response) in })
        }
    }
    
}
