//
//  SessionManager.swift
//  Ceair
//
//  Created by Tong Tian on 9/15/17.
//  Copyright © 2017 Bizersoft. All rights reserved.
//

import Foundation

enum SessionType {
    case standard
    case ephemeral
    case background(String)
}

extension SessionType {
    
    public init(rawValue: String, identifier: String?) throws {
        switch rawValue {
        case NETWORKS.SessionValue.Standard:
            self = .standard
        case NETWORKS.SessionValue.Ephemeral:
            self = .ephemeral
        case NETWORKS.SessionValue.Background:
            guard identifier != nil else {
                throw NetworkError.requestError(.missingRequestInfo(NETWORKS.SessionValue.Identifier))
            }
            self = .background(identifier!)
        default:
            throw NetworkError.requestError(.unsupportedSession(rawValue))
        }
    }
}

class SessionManager {
    
    static let shared = SessionManager()
    
    private init() {}
    
    private var standard: URLSession {
        return URLSession.shared
    }
    
    private var ephemeral: URLSession {
        return URLSession(configuration: .ephemeral)
    }
    
    private var backgrounds = [String: URLSession]()
    
    var allBackgrounds: [String: URLSession] {
        return backgrounds
    }
    
    func getSession(for sessionType: SessionType) -> URLSession {
        switch sessionType {
        case .standard:
            return standard
        case .ephemeral:
            return ephemeral
        case .background(let identifier):
            if backgrounds[identifier] == nil {
                backgrounds[identifier] = URLSession(configuration: .background(withIdentifier: identifier))
            }
            return backgrounds[identifier]!
        }
    }
    
}
