//
//  CeairUITests.swift
//  CeairUITests
//
//  Created by Matt Tian on 08/03/2018.
//  Copyright © 2018 Bizersoft. All rights reserved.
//

import XCTest

class CeairUITests: XCTestCase {
    
    var app: XCUIApplication!
        
    override func setUp() {
        super.setUp()
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
 
        app = XCUIApplication()
        app.launchArguments.append("--uitesting")
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testTapOnMyTab() {
        app.launch()
        
        XCTAssertTrue(app.isDisplayingLoading)
    }
    
}
