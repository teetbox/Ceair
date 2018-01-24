//
//  RouteViewModelTests.swift
//  CeairTests
//
//  Created by Matt Tian on 24/01/2018.
//  Copyright © 2018 Bizersoft. All rights reserved.
//

import XCTest
@testable import Ceair

class RouteViewModelTests: XCTestCase {
    
    var sut: RouteViewModel!
    var coordinator: MockRouteCoordinator!
    
    override func setUp() {
        super.setUp()
        
        coordinator = MockRouteCoordinator()
        sut = RouteViewModel()
        sut.coordinator = coordinator
    }
    
    func testBack() {
        sut.back()
        XCTAssert(coordinator.isBackCalled)
    }
    
}
