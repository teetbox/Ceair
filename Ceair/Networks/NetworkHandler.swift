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
    
    static let GetRequestInfo = [NETWORKS.BaseURL: URLS.Base,
                             NETWORKS.MethodKey: NETWORKS.MethodValue.Get,
                             NETWORKS.RequestKey: NETWORKS.RequestValue.Data,
                             NETWORKS.SessionKey: NETWORKS.SessionValue.Standard]
    
    static let PostRequestInfo = [NETWORKS.BaseURL: URLS.Base,
                              NETWORKS.MethodKey: NETWORKS.MethodValue.Post,
                              NETWORKS.RequestKey: NETWORKS.RequestValue.Data,
                              NETWORKS.SessionKey: NETWORKS.SessionValue.Standard]
    
    static func performHttpRequest(requestInfo: RequestInfo, completion: @escaping ResponseHandler) {
        var responseInfo = ResponseInfo()

        guard let host = requestInfo[NETWORKS.BaseURL] as? String else {
            responseInfo[NETWORKS.Error] = NetworkError.requestError(.missingRequestInfo(NETWORKS.BaseURL))
            completion(responseInfo)
            return
        }
        
        guard let endPoint = requestInfo[NETWORKS.Path] as? String else {
            responseInfo[NETWORKS.Error] = NetworkError.requestError(.missingRequestInfo(NETWORKS.Path))
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
        
        goAintx(requestInfo: requestInfo, completion: completion)
    }
    
    private static func goAintx(requestInfo: RequestInfo, completion: @escaping (ResponseInfo) -> Void) {
        let aintx = Aintx(baseURL: "http://httpbin.org")
        let request = Request(path: "/get")
        
        aintx.request = request
        aintx.go()
    }
    
    private static func performAintxRequest(path: String, method: String, request: String, session: String, requestInfo: RequestInfo, completion: @escaping ResponseHandler) {
        var responseInfo = ResponseInfo()
        
        guard let httpMethod = HttpMethod(rawValue: method) else {
            responseInfo[NETWORKS.Error] = NetworkError.requestError(.unsupportedMethod(method))
            completion(responseInfo)
            return
        }
        
        guard let requestType = RequestType(rawValue: request) else {
            responseInfo[NETWORKS.Error] = NetworkError.requestError(.unsupportedRequest(request))
            completion(responseInfo)
            return
        }
        
        var requestInfo = requestInfo
        do {
            let sessionType = try SessionType(rawValue: session, identifier: responseInfo[NETWORKS.SessionValue.Identifier] as? String)
            requestInfo[NETWORKS.SessionKey] = sessionType
        } catch {
            responseInfo[NETWORKS.Error] = NetworkError.requestError(.throwableError(error))
            completion(responseInfo)
            return
        }
        
        switch requestType {
        case .data:
            Aintx.dataRequest(path: path, method: httpMethod, requestInfo: requestInfo) { response in
                responseInfo = parseResponse(response)
                completion(responseInfo)
            }
            
        case .upload:
            Aintx.uploadRequest(path: path, method: httpMethod, requestInfo: requestInfo) { response in
                responseInfo = parseResponse(response)
                completion(responseInfo)
            }
            
        case .downLoad:
            Aintx.downloadRequest(path: path, method: httpMethod, requestInfo: requestInfo) { response in
                responseInfo = parseResponse(response)
                completion(responseInfo)
            }
            
        case .stream:
            Aintx.streamRequest(path: path, method: httpMethod, requestInfo: requestInfo) { response in
                responseInfo = parseResponse(response)
                completion(responseInfo)
            }
        }
        
    }
    
    private static func parseResponse(_ response: Response) -> ResponseInfo {
        var responseInfo = ResponseInfo()
        
        responseInfo[NETWORKS.Error] = response.error
        responseInfo[NETWORKS.Response.Data] = response.data
        responseInfo[NETWORKS.Response.Status] = response.urlResponse
        
        return responseInfo
    }
    
}
