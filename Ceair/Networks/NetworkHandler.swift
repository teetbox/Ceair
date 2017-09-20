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
    
    static func performHttpRequest(requestInfo: RequestInfo, completion: @escaping ResponseHandler) {
        var responseInfo = ResponseInfo()

        guard let host = requestInfo[NETWORKS.Domain] as? String else {
            responseInfo[NETWORKS.Error] = NetworkError.requestError(.missingRequestInfo(NETWORKS.Domain))
            completion(responseInfo)
            return
        }
        
        guard let endPoint = requestInfo[NETWORKS.Endpoint] as? String else {
            responseInfo[NETWORKS.Error] = NetworkError.requestError(.missingRequestInfo(NETWORKS.Endpoint))
            completion(responseInfo)
            return
        }

        guard let method = requestInfo[NETWORKS.MethodKey] as? String else {
            responseInfo[NETWORKS.Error] = NetworkError.requestError(.missingRequestInfo(NETWORKS.MethodKey))
            completion(responseInfo)
            return
        }
        
        guard let request = requestInfo[NETWORKS.RequestKey] as? String else {
            responseInfo[NETWORKS.Error] = NetworkError.requestError(.missingRequestInfo(NETWORKS.RequestKey))
            completion(responseInfo)
            return
        }
        
        guard let session = requestInfo[NETWORKS.SessionKey] as? String else {
            responseInfo[NETWORKS.Error] = NetworkError.requestError(.missingRequestInfo(NETWORKS.SessionKey))
            completion(responseInfo)
            return
        }
        
        performAintxRequest(path: host + endPoint, method: method, request: request, session: session, requestInfo: requestInfo, completion: completion)
    }
    
    private static func performAintxRequest(path: String, method: String, request: String, session: String, requestInfo: RequestInfo, completion: @escaping ResponseHandler) {
        var responseInfo = ResponseInfo()
        
        var requestInfo = requestInfo
        do {
            let sessionType = try SessionType(rawValue: session, identifier: responseInfo[NETWORKS.SessionValue.Identifier] as? String)
            requestInfo[NETWORKS.SessionKey] = sessionType
        } catch {
            responseInfo[NETWORKS.Error] = NetworkError.requestError(.throwableError(error))
            completion(responseInfo)
            return
        }
        
    }
    
    private static func parseResponse(_ response: Response2) -> ResponseInfo {
        var responseInfo = ResponseInfo()
        
        responseInfo[NETWORKS.Error] = response.error
        responseInfo[NETWORKS.Response.Data] = response.data
        responseInfo[NETWORKS.Response.Status] = response.urlResponse
        
        return responseInfo
    }
    
}
