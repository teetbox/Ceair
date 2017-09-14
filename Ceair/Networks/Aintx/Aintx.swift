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

enum SessionType: String {
    case standard = "standard"
    case ephemeral = "ephemeral"
    case background = "background"
}

enum RequestType: String {
    case data = "Data"
    case upload = "Upload"
    case downLoad = "Download"
    case image = "Image"
}

typealias Parameters = [String: Any]

// MARK: -

class Aintx {
    
    let session: URLSession
    
    static let standard: Aintx = {
        let session = URLSession(configuration: URLSessionConfiguration.default)
        return Aintx(session: session)
    }()
    
    static let ephemeral: Aintx = {
        let session = URLSession(configuration: URLSessionConfiguration.ephemeral)
        return Aintx(session: session)
    }()
    
    class func background(identifier: String) -> Aintx {
        let session = URLSession(configuration: URLSessionConfiguration.background(withIdentifier: identifier))
        return Aintx(session: session)
    }
    
    private init(session: URLSession) {
        self.session = session
    }
    
    // MARK: - Methods
    
    func request(urlString: String, method: HttpMethod = .get, parameters: Parameters? = nil, completion: @escaping (Response) -> Void) {
        guard let url = composeURL(urlString: urlString, method: method, parameters: parameters) else {
            return
        }
        performDataRequest(url: url, method: method, parameters: parameters, completion: completion)
    }
    
    private func composeURL(urlString: String, method: HttpMethod, parameters: Parameters?) -> URL? {
        guard method == .get, let params = parameters else {
            return URL(string: URLS.Host + urlString)
        }
        var url = urlString
        url += queryString(with: params)
        return URL(string: url)
    }
    
    private func queryString(with params: Parameters) -> String {
        var queryString = "?"
        
        for (key, value) in params {
            queryString += "\(key)=\(value)&"
        }
        
        return queryString
    }
    
    private func performDataRequest(url: URL, method: HttpMethod, parameters: Parameters?, completion: @escaping (Response) -> Void) {
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        
        session.performDataTask(with: request, completion: completion)
    }

}
