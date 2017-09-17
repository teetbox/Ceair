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
    
    class func dataRequest(urlString: String, requestInfo: RequestInfo, completion: @escaping (Response) -> Void) {
        guard let sessionType = requestInfo[NETWORKS.SessionKey] as? SessionType else {
            let error = NetworkError.requestError(.missingRequestInfo(NETWORKS.SessionKey))
            let response = Response(data: nil, response: nil, error: error)
            completion(response)
            return
        }
        
        let session = SessionManager.shared.getSession(with: sessionType)
        
        let request = URLRequest(url: URL(string: urlString)!)
        
        let dataTask = session.dataTask(with: request)
        dataTask.resume()
    }
    
    class func uploadRequest(urlString: String, requestInfo: RequestInfo, completion: @escaping (Response) -> Void) {
        
    }
    
    class func downloadRequest(urlString: String, requestInfo: RequestInfo, completion: @escaping (Response) -> Void) {
        
    }
    
    class func streamRequest(urlString: String, requestInfo: RequestInfo, completion: @escaping (Response) -> Void) {
        
    }
    
    private func performDataRequest(url: URL, method: HttpMethod, parameters: Parameters?, completion: @escaping (Response) -> Void) {
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
    }

}
