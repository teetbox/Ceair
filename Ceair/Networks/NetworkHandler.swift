//
//  NetworkHandler.swift
//  Ceair
//
//  Created by Tong Tian on 9/12/17.
//  Copyright © 2017 Bizersoft. All rights reserved.
//

import Foundation

typealias RequestInfo = [String: Any]
typealias ResponseHandler = ([String: Any]) -> Void

struct NetworkHandler {
    
    static let GetRequest = [Networks.Method: Networks.MethodType.Get, Networks.Session: Networks.SessionType.Standard, Networks.Host: URLs.Host]
    static let PostRequest = [Networks.Method: Networks.MethodType.Post, Networks.Session: Networks.SessionType.Standard, Networks.Host: URLs.Host]
    
    static func performHttpRequest(requestInfo: RequestInfo, completion: @escaping ResponseHandler) {
        var responseInfo = [String: Any]()

        guard let methodValue = requestInfo[Networks.Method] as? String else {
            responseInfo[Networks.Response.Error] = NetworkError.requestError(.missingRequestInfo(Networks.Method))
            completion(responseInfo)
            return
        }
        guard let method = HttpMethod(rawValue: methodValue) else {
            responseInfo[Networks.Response.Error] = NetworkError.requestError(.unsupportedMethod(methodValue))
            completion(responseInfo)
            return
        }
        guard let sessionValue = requestInfo[Networks.Session] as? String else {
            responseInfo[Networks.Response.Error] = NetworkError.requestError(.missingRequestInfo(Networks.Session))
            completion(responseInfo)
            return
        }
        guard let session = SessionType(rawValue: sessionValue) else {
            responseInfo[Networks.Response.Error] = NetworkError.requestError(.unsupportedSession(sessionValue))
            completion(responseInfo)
            return
        }
        guard let host = requestInfo[Networks.Host] as? String else {
            responseInfo[Networks.Response.Error] = NetworkError.requestError(.missingRequestInfo(Networks.Host))
            completion(responseInfo)
            return
        }
        guard let endPoint = requestInfo[Networks.EndPoint] as? String else {
            responseInfo[Networks.Response.Error] = NetworkError.requestError(.missingRequestInfo(Networks.EndPoint))
            completion(responseInfo)
            return
        }
        
        performAintxRequest(urlString: host + endPoint, method: method, session: session, requestInfo: requestInfo, completion: completion)
    }
    
    private static func performAintxRequest(urlString: String, method: HttpMethod, session: SessionType, requestInfo: RequestInfo, completion: @escaping ResponseHandler) {
        var responseInfo = [String: Any]()
        
        let parameters = requestInfo[Networks.Params] as? Parameters
        
        switch session {
        case .standard:
            Aintx.standard.request(urlString: urlString, method: method, parameters: parameters) { (response) in
                if let error = response.error {
                    responseInfo[Networks.Response.Error] = NetworkError.responseError(.serverNotResponse(error))
                }
                
                responseInfo[Networks.Response.Data] = response.data
                completion(responseInfo)
            }
            
        case .ephemeral:
            Aintx.ephemeral.request(urlString: urlString, completion: { (response) in })
            
        case .background:
            guard let backgroundIdentifier = requestInfo[Networks.SessionType.BackgroundIdentifier] as? String else {
                responseInfo[Networks.Response.Error] = NetworkError.requestError(.missingRequestInfo(Networks.SessionType.BackgroundIdentifier))
                completion(responseInfo)
                return
            }
            
            let bgAintx = Aintx.background(identifier: backgroundIdentifier)
            bgAintx.request(urlString: urlString, completion: { (response) in })
        }
    }
    
}
