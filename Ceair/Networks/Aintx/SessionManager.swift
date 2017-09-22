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

struct SessionManager {
    
    let session: URLSession
    
    init(sessionType: SessionType) {
        switch sessionType {
        case .standard:
            session = URLSession.shared
        case .ephemeral:
            session = URLSession(configuration: .ephemeral)
        case .background(let identifier):
            session = URLSession(configuration: .background(withIdentifier: identifier))
        }
    }

}
