//
//  DiscoveryTabViewModelTests.swift
//  CeairTests
//
//  Created by Matt Tian on 02/01/2018.
//  Copyright © 2018 Bizersoft. All rights reserved.
//

import XCTest
@testable import Ceair

class DiscoveryTabViewModelTests: XCTestCase {
    
    var sut: DiscoveryTabViewModel!
    var dataModel: MockDiscoveryTabDataModel!
    var coordinator: MockDiscoveryCoordinator!
    
    override func setUp() {
        super.setUp()
        
        dataModel = MockDiscoveryTabDataModel()
        coordinator = MockDiscoveryCoordinator()
        sut = DiscoveryTabViewModel(dataModel: dataModel)
        sut.coordinator = coordinator
    }
    
    func testDidSelectDestination() {
        sut.didSelectDestination()
        
        XCTAssert(coordinator.isDidSelectDestinationCalled)
    }
    
}
