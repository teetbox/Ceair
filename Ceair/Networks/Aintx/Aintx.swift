//
//  Aintx.swift
//  Ceair
//
//  Created by Tong Tian on 8/31/17.
//  Copyright © 2017 Bizersoft. All rights reserved.
//

import Foundation

enum HttpMethod: String {
    case get = "GET"
    case post = "POST"
}

enum RequestType: String {
    case data = "data"
    case upload = "upload"
    case downLoad = "download"
    case stream = "stream"
}

typealias Parameters = [String: Any]

// MARK: -

class Aintx {
    
    // MARK: - Methods
    
    class func dataRequest(urlString: String, method: HttpMethod, requestInfo: RequestInfo, completion: @escaping (Response) -> Void) {
        guard let sessionType = requestInfo[NETWORKS.SessionKey] as? SessionType else {
            let error = NetworkError.requestError(.missingRequestInfo(NETWORKS.SessionKey))
            let response = Response(error: error)
            completion(response)
            return
        }
        
        let session = SessionManager.shared.getSession(with: sessionType)
        
        do {
            let url = try URLEncording.encord(urlString: urlString, method: method, parameters: requestInfo[NETWORKS.Parameters] as? Parameters)
            
            var request = URLRequest(url: url)
            request.httpMethod = method.rawValue
            request.setValue(NETWORKS.ContentTypeValue.Json, forHTTPHeaderField: NETWORKS.ContentTypeKey)
            request.setValue(NETWORKS.AcceptValue.Json, forHTTPHeaderField: NETWORKS.AcceptKey)
            
            session.dataTask(with: request, completionHandler: { (data, response, error) in
                let response = Response(data: data, response: response, error: error)
                
                DispatchQueue.main.async {
                    completion(response)
                }
            }).resume()
        } catch {
            completion(Response(error: error))
        }
        
    }
    
    class func uploadRequest(urlString: String, method: HttpMethod, requestInfo: RequestInfo, completion: @escaping (Response) -> Void) {
        
    }
    
    class func downloadRequest(urlString: String, method: HttpMethod, requestInfo: RequestInfo, completion: @escaping (Response) -> Void) {
        
    }
    
    class func streamRequest(urlString: String, method: HttpMethod, requestInfo: RequestInfo, completion: @escaping (Response) -> Void) {
        
    }

}
