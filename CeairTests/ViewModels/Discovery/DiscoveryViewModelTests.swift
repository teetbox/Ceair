//
//  DiscoveryViewModelTests.swift
//  CeairTests
//
//  Created by Matt Tian on 02/01/2018.
//  Copyright © 2018 Bizersoft. All rights reserved.
//

import XCTest
@testable import Ceair

class DiscoveryViewModelTests: XCTestCase {
    
    var sut: DiscoveryViewModel!
    var dataModel: MockDiscoveryDataModel!
    var coordinator: MockDiscoveryCoordinator!
    
    override func setUp() {
        super.setUp()
        
        dataModel = MockDiscoveryDataModel()
        coordinator = MockDiscoveryCoordinator()
        sut = DiscoveryViewModel(dataModel: dataModel)
        sut.coordinator = coordinator
    }
    
    func testShowRoute() {
        sut.showRoute(at: 0)
        XCTAssert(coordinator.isShowRouteCalled)
    }
    
    func testShowTheme() {
        sut.showTheme(at: 0)
        XCTAssert(coordinator.isShowThemeCalled)
    }
    
    func testFetchThemes() {
        sut.fetchThemes {}
        XCTAssert(dataModel.isFetchThemesCalled)
    }
    
    func testFetchCities() {
        sut.fetchCities {}
        XCTAssert(dataModel.isFetchCitiesCalled)
    }
    
}
