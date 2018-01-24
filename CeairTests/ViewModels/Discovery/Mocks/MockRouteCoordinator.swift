//
//  MockRouteCoordinator.swift
//  CeairTests
//
//  Created by Matt Tian on 24/01/2018.
//  Copyright © 2018 Bizersoft. All rights reserved.
//

import Foundation
@testable import Ceair

class MockRouteCoordinator: RouteViewModelCoordinatorDelegate {
    
    var isBackCalled = false
    
    func back() {
        isBackCalled = true
    }
    
}
