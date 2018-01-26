//
//  MockDiscoveryTabDataModel.swift
//  CeairTests
//
//  Created by Matt Tian on 02/01/2018.
//  Copyright © 2018 Bizersoft. All rights reserved.
//

import Foundation
@testable import Ceair

class MockDiscoveryTabDataModel: DiscoveryTabDataModelProtocol {
    
    var isFetchThemesCalled = false
    var isFetchCitiesCalled = false
    
    func fetchThemes(completion: @escaping ([DiscoveryTheme]) -> Void) {
        isFetchThemesCalled = true
    }
    
    func fetchCities(completion: @escaping ([[DiscoveryCity]]) -> Void) {
        isFetchCitiesCalled = true
    }
    
}
