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
    
    var isShowFilterCalled = false
    
    func showFilter() {
        isShowFilterCalled = true
    }
    
}
