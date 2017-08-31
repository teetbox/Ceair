//
//  FlightTabViewModelTests.swift
//  CeairTests
//
//  Created by Tong Tian on 9/1/17.
//  Copyright © 2017 Bizersoft. All rights reserved.
//

import XCTest
@testable import Ceair

class FlightTabViewModelTests: XCTestCase {
    
    var viewModel: FlightTabViewModel!
    var dataModel: MockFlightTabDataModel!
    
    override func setUp() {
        super.setUp()
        
        dataModel = MockFlightTabDataModel()
        viewModel = FlightTabViewModel(dataModel: dataModel)
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testExample() {

    }
    
}
