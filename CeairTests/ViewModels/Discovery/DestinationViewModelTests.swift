//
//  DestinationViewModelTests.swift
//  CeairTests
//
//  Created by Matt Tian on 03/01/2018.
//  Copyright © 2018 Bizersoft. All rights reserved.
//

import XCTest
@testable import Ceair

class DestinationViewModelTests: XCTestCase {
    
    var sut: DestinationViewModel!
    var dataModel: MockDestinationDataModel!
    var coordinator: MockDestinationCoordinator!
    
    override func setUp() {
        super.setUp()
        
        dataModel = MockDestinationDataModel()
        coordinator = MockDestinationCoordinator()
        sut = DestinationViewModel(dataModel: dataModel)
        sut.coordinator = coordinator
    }

    func testShowFilter() {
        sut.showFilter()
        
        XCTAssert(coordinator.isShowFilterCalled)
    }
    
}
