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
        case unsupportedRequest(String)
        case invaliedURL(String)
        case throwableError(Error)
    }
    
    enum ResponseFailedReason {
        case httpBadStatus
        case serverNotResponse(Error)
        case encordingFailed
    }
    
}

extension NetworkError: LocalizedError {
    var localizedDescription: String {
        switch self {
        case .requestError(let reason):
            return reason.localizedDescription
        case .responseError(let reason):
            return reason.localizedDescription
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
        case .unsupportedSession(let sesson):
            return "Request Failed: Unsupported session type \'\(sesson)\'"
        case .unsupportedRequest(let request):
            return "Request Failed: Unsupported request type \'\(request)\'"
        case .invaliedURL(let urlString):
            return "Request Failed: Invalid url string \'\(urlString)\'"
        case .throwableError(let error):
            return error.localizedDescription
        }
    }
}

extension NetworkError.ResponseFailedReason {
    var localizedDescription: String {
        switch self {
        case .httpBadStatus:
            return "Response Failed: Bad status"
        case .encordingFailed:
            return "Response Failed: Encoding error"
        case .serverNotResponse(let error):
            return error.localizedDescription
        }
    }
}
