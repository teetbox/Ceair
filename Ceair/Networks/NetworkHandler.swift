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
    
    static let GetRequest = [NETWORKS.Method: NETWORKS.MethodType.Get, NETWORKS.Session: NETWORKS.SessionType.Standard, NETWORKS.Host: URLS.Host]
    static let PostRequest = [NETWORKS.Method: NETWORKS.MethodType.Post, NETWORKS.Session: NETWORKS.SessionType.Standard, NETWORKS.Host: URLS.Host]
    
    static func performHttpRequest(requestInfo: RequestInfo, completion: @escaping ResponseHandler) {
        var responseInfo = [String: Any]()

        guard let methodValue = requestInfo[NETWORKS.Method] as? String else {
            responseInfo[NETWORKS.Error] = NetworkError.requestError(.missingRequestInfo(NETWORKS.Method))
            completion(responseInfo)
            return
        }
        guard let method = HttpMethod(rawValue: methodValue) else {
            responseInfo[NETWORKS.Error] = NetworkError.requestError(.unsupportedMethod(methodValue))
            completion(responseInfo)
            return
        }
        guard let sessionValue = requestInfo[NETWORKS.Session] as? String else {
            responseInfo[NETWORKS.Error] = NetworkError.requestError(.missingRequestInfo(NETWORKS.Session))
            completion(responseInfo)
            return
        }
        guard let session = SessionType(rawValue: sessionValue) else {
            responseInfo[NETWORKS.Error] = NetworkError.requestError(.unsupportedSession(sessionValue))
            completion(responseInfo)
            return
        }
        guard let host = requestInfo[NETWORKS.Host] as? String else {
            responseInfo[NETWORKS.Error] = NetworkError.requestError(.missingRequestInfo(NETWORKS.Host))
            completion(responseInfo)
            return
        }
        guard let endPoint = requestInfo[NETWORKS.EndPoint] as? String else {
            responseInfo[NETWORKS.Error] = NetworkError.requestError(.missingRequestInfo(NETWORKS.EndPoint))
            completion(responseInfo)
            return
        }
        
        performAintxRequest(urlString: host + endPoint, method: method, session: session, requestInfo: requestInfo, completion: completion)
    }
    
    private static func performAintxRequest(urlString: String, method: HttpMethod, session: SessionType, requestInfo: RequestInfo, completion: @escaping ResponseHandler) {
        var responseInfo = [String: Any]()
        
        let parameters = requestInfo[NETWORKS.Params] as? Parameters
        
        switch session {
        case .standard:
            Aintx.standard.request(urlString: urlString, method: method, parameters: parameters) { (response) in
                if let error = response.error {
                    responseInfo[NETWORKS.Error] = NetworkError.responseError(.serverNotResponse(error))
                }
                
                responseInfo[NETWORKS.Response.Data] = response.data
                completion(responseInfo)
            }
            
        case .ephemeral:
            Aintx.ephemeral.request(urlString: urlString, completion: { (response) in })
            
        case .background:
            guard let backgroundIdentifier = requestInfo[NETWORKS.SessionType.BackgroundIdentifier] as? String else {
                responseInfo[NETWORKS.Error] = NetworkError.requestError(.missingRequestInfo(NETWORKS.SessionType.BackgroundIdentifier))
                completion(responseInfo)
                return
            }
            
            let bgAintx = Aintx.background(identifier: backgroundIdentifier)
            bgAintx.request(urlString: urlString, completion: { (response) in })
        }
    }
    
}
