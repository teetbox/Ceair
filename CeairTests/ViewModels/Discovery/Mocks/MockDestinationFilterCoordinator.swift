//
//  MockDestinationFilterCoordinator.swift
//  CeairTests
//
//  Created by Matt Tian on 09/01/2018.
//  Copyright © 2018 Bizersoft. All rights reserved.
//

import Foundation
@testable import Ceair

class MockDestinationFilterCoordinator: DestinationFilterViewModelCoordinatorDelegate {
    
    var isDismissCalled = false
    
    func dismiss() {
        isDismissCalled = true
    }
    
}
