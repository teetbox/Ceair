//
//  SessionManager.swift
//  Ceair
//
//  Created by Tong Tian on 9/15/17.
//  Copyright © 2017 Bizersoft. All rights reserved.
//

import Foundation

class SessionManager {
    
    static func getSession(with config: SessionConfig) -> URLSession {
        switch config {
        case .default:
            return URLSession.shared
        case .ephemeral:
            return URLSession(configuration: .ephemeral)
        case .background(let identifier):
            return URLSession(configuration: .background(withIdentifier: identifier))
        }
    }

}
