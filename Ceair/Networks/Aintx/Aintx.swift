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
    
    let baseURL: String
    
    var session: SessionType = .standard
    var httpRequest: HttpRequest?
    
    
    var path: String = ""
    var method: HttpMethod = .get
    
    var urlSession: URLSession = .shared
    
    var request: Request?

    init(baseURL: String) {
        self.baseURL = baseURL
    }
    
    private init() {
        baseURL = URLS.Base
    }
    
    func setupHttpRequest(path: String, method: HttpMethod = .get) -> HttpRequest {
        let url = URL(string: baseURL + path)!
        var request = URLRequest(url: url)
        
        request.httpMethod = method.rawValue
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        return HttpRequest(path: path, session: urlSession, urlRequest: request)
    }
    
    func go(completion: @escaping (Response2) -> Void) {

    }
    
    // MARK: - Methods
    
    class func dataRequest(path: String, method: HttpMethod = .get, session: SessionType = .standard, requestInfo: RequestInfo, completion: @escaping (Response2) -> Void) {
        let sessionType = requestInfo[NETWORKS.SessionKey] as? SessionType ?? .standard
        let session = SessionManager.shared.getSession(for: sessionType)
        
        do {
            let url = try URLEncording.encord(urlString: path, method: method, parameters: requestInfo[NETWORKS.Parameters] as? Parameters)
            
            let request = Request(url: url)
            
            session.performDataTask(with: request) { (response) in
                DispatchQueue.main.async {
                    completion(response)
                }
            }
        } catch {
            completion(Response2(error: error))
        }
        
    }
    
    class func uploadRequest(path: String, method: HttpMethod, requestInfo: RequestInfo, completion: @escaping (Response2) -> Void) {
        
    }
    
    class func downloadRequest(path: String, method: HttpMethod, requestInfo: RequestInfo, completion: @escaping (Response2) -> Void) {
        
    }
    
    class func streamRequest(path: String, method: HttpMethod, requestInfo: RequestInfo, completion: @escaping (Response2) -> Void) {
        
    }

}
