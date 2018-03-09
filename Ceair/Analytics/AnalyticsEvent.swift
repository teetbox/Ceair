//
//  AnalyticsEvent.swift
//  Ceair
//
//  Created by Matt Tian on 02/03/2018.
//  Copyright © 2018 Bizersoft. All rights reserved.
//

import Foundation

enum AnalyticsEvent {
    case myScreenViewed
    case discoveryThemeRequested
    case discoveryCityRequested
    case loginScreenViewed
    case loginAttempted
    case loginFailed(reason: LoginFailureReason)
    case loginSucceeded
    case messageListViewed
    case messageSelected(index: Int)
    case messageDeleted(index: Int, read: Bool)
    
    enum LoginFailureReason {
        case unknownUsername
        case invalidPassword
    }
}

extension AnalyticsEvent {
    var name: String {
        switch self {
        case .myScreenViewed,
             .discoveryThemeRequested,
             .discoveryCityRequested,
             .loginScreenViewed,
             .loginAttempted,
             .loginSucceeded,
             .messageListViewed:
            return String(describing: self)
        case .loginFailed:
            return "loginFailed"
        case .messageSelected:
            return "messageSelected"
        case .messageDeleted:
            return "messageDeleted"
        }
    }
    
    var metadata: [String: String] {
        switch self {
        case .myScreenViewed,
             .discoveryThemeRequested,
             .discoveryCityRequested,
             .loginScreenViewed,
             .loginAttempted,
             .loginSucceeded,
             .messageListViewed:
            return [:]
        case .loginFailed(let reason):
            return ["reason": String(describing: reason)]
        case .messageSelected(let index):
            return ["index": "\(index)"]
        case .messageDeleted(let index, let read):
            return ["index": "\(index)", "read": "\(read)"]
        }
    }
}
