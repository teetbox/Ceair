//
//  MockDestinationFilterDataModel.swift
//  CeairTests
//
//  Created by Matt Tian on 08/01/2018.
//  Copyright © 2018 Bizersoft. All rights reserved.
//

import Foundation
@testable import Ceair

class MockDestinationFilterDataModel: DestinationFilterDataModelProtocol {
    
    var isGetFiltersCalled = false
    var fakeFilters: [[String]]?
    
    func getFilters(completion: @escaping ([[String]]) -> Void) {
        isGetFiltersCalled = true
        if let filters = fakeFilters {
            completion(filters)
        }
    }
    
}
