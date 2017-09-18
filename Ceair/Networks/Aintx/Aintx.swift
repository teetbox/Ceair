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
    case data
    case upload
    case downLoad
    case stream
}

typealias Parameters = [String: Any]

// MARK: -

class Aintx {
    
    private init() {}
    
    // MARK: - Methods
    
    class func dataRequest(urlString: String, method: HttpMethod, requestInfo: RequestInfo, completion: @escaping (Response) -> Void) {
        guard let sessionType = requestInfo[NETWORKS.SessionKey] as? SessionType else {
            let error = NetworkError.requestError(.missingRequestInfo(NETWORKS.SessionKey))
            let response = Response(error: error)
            completion(response)
            return
        }
        
        let session = SessionManager.shared.getSession(for: sessionType)
        
        do {
            let url = try URLEncording.encord(urlString: urlString, method: method, parameters: requestInfo[NETWORKS.Parameters] as? Parameters)
            
            let request = Request(url: url)
            
            session.performDataTask(with: request) { (response) in
                DispatchQueue.main.async {
                    completion(response)
                }
            }
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
