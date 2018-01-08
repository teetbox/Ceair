//
//  DestinationFilterViewModelTests.swift
//  CeairTests
//
//  Created by Matt Tian on 08/01/2018.
//  Copyright © 2018 Bizersoft. All rights reserved.
//

import XCTest
@testable import Ceair

class DestinationFilterViewModelTests: XCTestCase {
    
    var sut: DestinationFilterViewModel!
    var dataModel: MockDestinationFilterDataModel!
    
    override func setUp() {
        super.setUp()
        
        dataModel = MockDestinationFilterDataModel()
        sut = DestinationFilterViewModel(dataModel: dataModel)
    }
    
    func testGetFilters() {
        sut.getFilters(completion: {})
        XCTAssert(dataModel.isGetFiltersCalled)
    }
    
    func testFilterNumber() {
        dataModel.fakeFilters = [["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K"], ["O", "P", "Q"]]
        sut.getFilters(completion: {})
        XCTAssertEqual(sut.filterNumber, 11)
    }
    
    func testUpdateFilter() {
        dataModel.fakeFilters = [["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K"], ["O", "P", "Q"]]
        sut.getFilters(completion: {})
        
        sut.updateFilter(with: 1, completion: {})
        XCTAssertEqual(sut.filterNumber, 11)
        
        sut.updateFilter(with: 2, completion: {})
        XCTAssertEqual(sut.filterNumber, 3)
    }
    
}
