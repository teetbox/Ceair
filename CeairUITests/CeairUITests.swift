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
        
        XCTAssertTrue(app.isDisplayingDiscovery)
        XCTAssertTrue(app.isDisplayingLoading)
        XCTAssertFalse(app.isDisplayingCity)
        
        print(Date())
        _ = app.otherElements[DISPLAY.CityView].waitForExistence(timeout: 10)
        print(Date())
        XCTAssertTrue(app.isDisplayingCity)
    }
    
    func _testViewMyTab() {
        app.launch()
        
        XCTAssertTrue(app.isDisplayingMy)
    }
    
    func _testLogMyTab() {
        app.launch()
        
        XCTAssertTrue(app.isLogged(for: .myScreenViewed))
    }
    
}
