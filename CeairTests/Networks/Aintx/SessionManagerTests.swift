//
//  SessionManagerTests.swift
//  CeairTests
//
//  Created by Tong Tian on 9/18/17.
//  Copyright © 2017 Bizersoft. All rights reserved.
//

import XCTest
@testable import Ceair

class SessionManagerTests: XCTestCase {
    
    func testGetSessionForStandard() {
        let sessionType = SessionType.standard
        let session = SessionManager.shared.getSession(for: sessionType)
        XCTAssertEqual(session, URLSession.shared)
    }
    
    func testGetSessionForEphemeral() {
        let sessionType = SessionType.ephemeral
        let session = SessionManager.shared.getSession(for: sessionType)
        XCTAssertNotNil(session)
        XCTAssertNil(session.configuration.identifier)
        XCTAssertNotEqual(session, URLSession.shared)
    }
    
    func testGetSessionForBackground() {
        let bgIndentifier_1 = "background-1"
        let bgIndentifier_2 = "background-2"
        
        let sessionType = SessionType.background(bgIndentifier_1)
        let session = SessionManager.shared.getSession(for: sessionType)
        XCTAssertEqual(session.configuration.identifier, bgIndentifier_1)
        
        let sessionType2 = SessionType.background(bgIndentifier_2)
        let session2 = SessionManager.shared.getSession(for: sessionType2)
        XCTAssertEqual(session2.configuration.identifier, bgIndentifier_2)
        
        let allBackgroundSessions = SessionManager.shared.allBackgroundSessions
        XCTAssertEqual(allBackgroundSessions.count, 2) 
    }
    
}
