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
    
    func testBack() {
        sut.back()
        XCTAssert(coordinator.isBackCalled)
    }

    func testShowFilter() {
        sut.showFilter(with: 1)
        
        XCTAssert(coordinator.isShowFilterCalled)
        XCTAssertEqual(coordinator.tag, 1)
        
        sut.showFilter(with: 2)
        XCTAssertEqual(coordinator.tag, 2)
    }
    
    func testShowRoute() {
        sut.showRoute(at: 0)
        
        XCTAssert(coordinator.isShowRouteCalled)
    }
    
}
