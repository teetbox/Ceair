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
    
    static let GetRequest = [NETWORKS.Host: URLS.Host,
                             NETWORKS.MethodKey: NETWORKS.MethodValue.Get,
                             NETWORKS.SessionKey: NETWORKS.SessionValue.Standard,
                             NETWORKS.RequestKey: NETWORKS.RequestValue.Data]
    
    static let PostRequest = [NETWORKS.Host: URLS.Host,
                              NETWORKS.MethodKey: NETWORKS.MethodValue.Post,
                              NETWORKS.SessionKey: NETWORKS.SessionValue.Standard,
                              NETWORKS.RequestKey: NETWORKS.RequestValue.Data]
    
    static func performHttpRequest(requestInfo: RequestInfo, completion: @escaping ResponseHandler) {
        var responseInfo = ResponseInfo()

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

        guard let _ = requestInfo[NETWORKS.MethodKey] as? String else {
            responseInfo[NETWORKS.Error] = NetworkError.requestError(.missingRequestInfo(NETWORKS.MethodKey))
            completion(responseInfo)
            return
        }
        
        guard let sessionType = requestInfo[NETWORKS.SessionKey] as? String else {
            responseInfo[NETWORKS.Error] = NetworkError.requestError(.missingRequestInfo(NETWORKS.SessionKey))
            completion(responseInfo)
            return
        }
        
        guard let requestType = requestInfo[NETWORKS.RequestKey] as? String else {
            responseInfo[NETWORKS.Error] = NetworkError.requestError(.missingRequestInfo(NETWORKS.RequestKey))
            completion(responseInfo)
            return
        }
        
        performAintxRequest(url: host + endPoint, sessionType: sessionType, requestType: requestType, requestInfo: requestInfo, completion: completion)
    }
    
    private static func performAintxRequest(url: String, sessionType: String, requestType: String, requestInfo: RequestInfo, completion: @escaping ResponseHandler) {
        var responseInfo = ResponseInfo()
        
        guard let request = RequestType(rawValue: requestType) else {
            responseInfo[NETWORKS.Error] = NetworkError.requestError(.unsupportedRequest(requestType))
            completion(responseInfo)
            return
        }
        
        var requestInfo = requestInfo
        do {
            let session = try SessionType(rawValue: sessionType, identifier: responseInfo[NETWORKS.SessionValue.Identifier] as? String)
            requestInfo[NETWORKS.SessionKey] = session
        } catch {
            responseInfo[NETWORKS.Error] = NetworkError.requestError(.throwableError(error))
            completion(responseInfo)
            return
        }
        
        switch request {
        case .data:
            Aintx.dataRequest(urlString: url, requestInfo: requestInfo) { response in
                responseInfo = parseResponse(response)
                completion(responseInfo)
            }
            
        case .upload:
            Aintx.uploadRequest(urlString: url, requestInfo: requestInfo) { response in
                responseInfo = parseResponse(response)
                completion(responseInfo)
            }
            
        case .downLoad:
            Aintx.downloadRequest(urlString: url, requestInfo: requestInfo) { response in
                responseInfo = parseResponse(response)
                completion(responseInfo)
            }
            
        case .stream:
            Aintx.streamRequest(urlString: url, requestInfo: requestInfo) { response in
                responseInfo = parseResponse(response)
                completion(responseInfo)
            }
        }
        
    }
    
    private static func parseResponse(_ response: Response) -> ResponseInfo {
        var responseInfo = ResponseInfo()
        
        responseInfo[NETWORKS.Error] = response.error
        responseInfo[NETWORKS.Response.Data] = response.data
        responseInfo[NETWORKS.Response.Status] = response.response
        
        return responseInfo
    }
    
}
