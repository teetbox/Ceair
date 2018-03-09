//
//  AnalyticsTests.swift
//  CeairTests
//
//  Created by Matt Tian on 09/03/2018.
//  Copyright © 2018 Bizersoft. All rights reserved.
//

import XCTest
@testable import Ceair

class AnalyticsTests: XCTestCase {
    
    var sut: AnalyticsManager!
    
    override func setUp() {
        super.setUp()
        
        let fileEngine = FileAnalyticsEngine()
        sut = AnalyticsManager(engine: fileEngine)
    }
    
    func testLogEvent() {
        sut.log(.loginAttempted)
    }
    
}
