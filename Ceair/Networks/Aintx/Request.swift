//
//  Request.swift
//  Ceair
//
//  Created by Tong Tian on 9/15/17.
//  Copyright © 2017 Bizersoft. All rights reserved.
//

import Foundation

protocol TaskRequest {
    func fire(at session: URLSession)
}

class DataTask: URLSessionDataTask, TaskRequest {
    
    
    
    func fire(at session: URLSession) {
        performDataRequest(at: session)
    }
    
    private func performDataRequest(at session: URLSession) {
        session.da
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
}

struct UploadRequest: TaskRequest {
    
    func fire() {
        performUploadRequest()
    }
    
    private func performUploadRequest() {
        
    }
    
}

struct DownloadRequest: TaskRequest {
    
    func fire() {
        performDownloadRequest()
    }
    
    private func performDownloadRequest() {
        
    }
    
}

struct StreamRequest: TaskRequest {
    
    func fire() {
        performStreamRequest()
    }
    
    private func performStreamRequest() {
        
    }
    
}

