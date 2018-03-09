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
    var analyticsEngine: MockAnalyticsEngine!
    
    override func setUp() {
        super.setUp()
        
        dataModel = MockDiscoveryDataModel()
        coordinator = MockDiscoveryCoordinator()
        analyticsEngine = MockAnalyticsEngine()
        sut = DiscoveryViewModel(dataModel: dataModel, analytics: AnalyticsManager(engine: analyticsEngine))
        sut.coordinator = coordinator
    }
    
    func testInit() {
        XCTAssertNotNil(sut.dataModel)
        XCTAssertEqual(sut.themeCount, 0)
        XCTAssertEqual(sut.themeCityCount, 0)
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

        XCTAssertEqual(analyticsEngine.stubName, "discoveryThemeRequested")
        XCTAssertEqual(analyticsEngine.stubMetadata?.count, 0)
    }
    
    func testFetchCities() {
        sut.fetchCities {}
        XCTAssert(dataModel.isFetchCitiesCalled)
        
        XCTAssertEqual(analyticsEngine.stubName, "discoveryCityRequested")
        XCTAssertEqual(analyticsEngine.stubMetadata?.count, 0)
    }
    
    func testLoadImage() {
        sut.loadImage(from: "/download/image") { _, _ in }
        XCTAssert(dataModel.isLoadImageCalled)
    }
    
    func testThemeCount() {
        let async = expectation(description: "async")
        
        let theme = DiscoveryTheme(themeName: "", themeCode: "", delFlag: false)
        dataModel.fakeThemes = Array(repeating: theme, count: 2)
        sut.fetchThemes {
            async.fulfill()
            XCTAssertEqual(self.sut.themeCount, 2)
        }
        
        wait(for: [async], timeout: 1)
    }
    
    func testThemeCityCount() {
        let async = expectation(description: "async")
        
        let city = DiscoveryCity(cityName: "", tagList: [], oriEngCode: "", desEngCode: "", price: 0, imageUrl: "", themeCode: "")
        dataModel.fakeCities = [[city], [city]]
        sut.fetchCities {
            async.fulfill()
            XCTAssertEqual(self.sut.themeCityCount, 2)
        }
        
        wait(for: [async], timeout: 1)
    }
    
    func testTheme() {
        let async = expectation(description: "async")
        
        let theme = DiscoveryTheme(themeName: "TTSY", themeCode: "", delFlag: false)
        dataModel.fakeThemes = Array(repeating: theme, count: 2)
        sut.fetchThemes {
            async.fulfill()
            let indexPath = IndexPath(item: 1, section: 0)
            XCTAssertEqual(self.sut.theme(at: indexPath).themeName, "TTSY")
        }
        
        wait(for: [async], timeout: 1)
    }
    
    func testCity() {
        let async = expectation(description: "async")
        
        let city = DiscoveryCity(cityName: "TTSY", tagList: [], oriEngCode: "", desEngCode: "", price: 0, imageUrl: "", themeCode: "")
        dataModel.fakeCities = [[city], [city]]
        sut.fetchCities {
            async.fulfill()
            let indexPath = IndexPath(item: 0, section: 0)
            XCTAssertEqual(self.sut.city(at: indexPath, forTheme: 1).cityName, "TTSY")
        }
        
        wait(for: [async], timeout: 1)
    }
    
    func testCities() {
        let async = expectation(description: "async")
        
        let city = DiscoveryCity(cityName: "TT", tagList: [], oriEngCode: "", desEngCode: "", price: 0, imageUrl: "", themeCode: "")
        let city2 = DiscoveryCity(cityName: "SY", tagList: [], oriEngCode: "", desEngCode: "", price: 0, imageUrl: "", themeCode: "")
        dataModel.fakeCities = [[city, city2]]
        sut.fetchCities {
            async.fulfill()
            let cities = self.sut.cities(forTheme: 0)
            XCTAssertEqual(cities[0].cityName, "TT")
            XCTAssertEqual(cities[1].cityName, "SY")
        }
        
        wait(for: [async], timeout: 1)
    }
    
}
