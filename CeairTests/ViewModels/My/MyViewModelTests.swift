//
//  MyViewModelTests.swift
//  CeairTests
//
//  Created by Matt Tian on 08/03/2018.
//  Copyright © 2018 Bizersoft. All rights reserved.
//

import XCTest
@testable import Ceair

class MyViewModelTests: XCTestCase {
    
    var sut: MyViewModel!
    var analyticsEngine: AnalyticsEngineMock!
    
    override func setUp() {
        analyticsEngine = AnalyticsEngineMock()
        sut = MyViewModel(analytics: AnalyticsManager(engine: analyticsEngine))
    }
    
    func testFetchData() {
        sut.fetchData()
        
        XCTAssertEqual(analyticsEngine.stubName, "myScreenViewed")
        XCTAssertEqual(analyticsEngine.stubMetadata?.isEmpty, true)
    }
    
}
