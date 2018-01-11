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
    var coordinator: MockDestinationFilterCoordinator!
    
    override func setUp() {
        super.setUp()
        
        dataModel = MockDestinationFilterDataModel()
        coordinator = MockDestinationFilterCoordinator()
        sut = DestinationFilterViewModel(dataModel: dataModel)
        sut.coordinator = coordinator
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
    
    func testGetCellViewModel() {
        dataModel.fakeFilters = [["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K"], ["O", "P", "Q"]]
        sut.getFilters(completion: {})
        
        var cellViewModel = sut.getCellViewModel(at: 1)
        XCTAssertEqual(cellViewModel.filterName, "B")
        
        sut.updateFilter(with: 2, completion: {})
        cellViewModel = sut.getCellViewModel(at: 2)
        XCTAssertEqual(cellViewModel.filterName, "Q")
    }
    
    func testDismiss() {
        sut.dismiss()
        
        XCTAssert(coordinator.isDismissCalled)
    }
    
}
