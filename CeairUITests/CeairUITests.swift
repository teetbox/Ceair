//
//  CeairUITests.swift
//  CeairUITests
//
//  Created by Matt Tian on 08/03/2018.
//  Copyright © 2018 Bizersoft. All rights reserved.
//

import XCTest
@testable import Ceair

class CeairUITests: XCTestCase {
    
    var app: XCUIApplication!
        
    override func setUp() {
        super.setUp()
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
 
        app = XCUIApplication()
        app.launchArguments.append("--uitesting")
    }
    
    func testDisplayDiscoveryView() {
        app.launch()
        
        XCTAssert(app.isDisplayingDiscovery)
        XCTAssert(app.isDisplayingLoading)
        XCTAssert(app.isLogged(for: .discoveryThemeRequested))
        XCTAssert(app.isLogged(for: .discoveryCityRequested))
        
        XCTAssertFalse(app.isDisplayingDiscoveryCity)
        
        print(Date())
        _ = app.otherElements[DISPLAY.Discovery.CityView].waitForExistence(timeout: 10)
        print(Date())
        XCTAssert(app.isDisplayingDiscoveryCity)
        
    }
    
    func _testViewMyTab() {
        app.launch()
        
        XCTAssert(app.isDisplayingMy)
    }
    
    func _testLogMyTab() {
        app.launch()
        
        XCTAssert(app.isLogged(for: .myScreenViewed))
    }
    
}
