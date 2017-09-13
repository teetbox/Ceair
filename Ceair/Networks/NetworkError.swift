//
//  NetworkError.swift
//  Ceair
//
//  Created by Tong Tian on 9/13/17.
//  Copyright © 2017 Bizersoft. All rights reserved.
//

import Foundation

enum NetworkError: Error {
    
    case requestError(RequestFailedReason)
    case responseError(ResponseFailedReason)
    
    enum RequestFailedReason {
        case missingRequestInfo(String)
        case unsupportedMethod(String)
        case unsupportedSession(String)
        case invaliedURL(String)
    }
    
    enum ResponseFailedReason {
        case responseError(Error)
        case httpBadStatus
        case serverNotResponse
    }
    
}

extension NetworkError: LocalizedError {
    var localizedDescription: String {
        switch self {
        case .requestError(let reason):
            return reason.localizedDescription
        case .responseError:
            return "Blank Error"
        }
    }
}

extension NetworkError.RequestFailedReason {
    var localizedDescription: String {
        switch self {
        case .missingRequestInfo(let requestInfo):
            return "Request Failed: Missing requestInfo \'\(requestInfo)\'"
        case .unsupportedMethod(let method):
            return "Request Failed: Unexpected http method \'\(method)\'"
        case .invaliedURL(let urlString):
            return "Request Failed: Invalid url string \'\(urlString)\'"
        case .unsupportedSession(let sesson):
            return "Request Failed: Unsupported session type \'\(sesson)\'"
        }
    }
}
