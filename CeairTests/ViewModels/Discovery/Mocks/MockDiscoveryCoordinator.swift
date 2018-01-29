//
//  MockDiscoveryCoordinator.swift
//  CeairTests
//
//  Created by Matt Tian on 03/01/2018.
//  Copyright © 2018 Bizersoft. All rights reserved.
//

import Foundation
@testable import Ceair

class MockDiscoveryCoordinator: DiscoveryViewModelCoordinatorDelegate {
    
    var isShowRouteCalled = false
    var isShowThemeCalled = false
    
    func showRoute(at index: Int) {
        isShowRouteCalled = true
    }
    
    func showTheme(at index: Int) {
        isShowThemeCalled = true
    }
    
}
