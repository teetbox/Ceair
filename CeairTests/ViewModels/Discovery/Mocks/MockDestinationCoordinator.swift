//
//  MockDestinationCoordinator.swift
//  CeairTests
//
//  Created by Matt Tian on 03/01/2018.
//  Copyright © 2018 Bizersoft. All rights reserved.
//

import Foundation
@testable import Ceair

class MockDestinationCoordinator: DestinationViewModelCoordinatorDelegate {
    
    var isBackCalled = false
    var isShowFilterCalled = false
    var isShowRouteCalled = false
    var tag = 0
    
    func back() {
        isBackCalled = true
    }
    
    func showFilter(with tag: Int) {
        self.tag = tag
        isShowFilterCalled = true
    }
    
    func showRoute(at index: Int) {
        isShowRouteCalled = true
    }
    
}
