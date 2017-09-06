//
//  MockFlightTabDataModel.swift
//  CeairTests
//
//  Created by Tong Tian on 9/1/17.
//  Copyright © 2017 Bizersoft. All rights reserved.
//

import Foundation
@testable import Ceair

class MockFlightTabDataModel: FlightTabDataModelProtocol {
    
    var isPerformLoginCalled = false
    var isPerformQueryFlightsCalled = false
    
    func performLogin(user: String, pwd: String) {
        isPerformLoginCalled = true
    }
    
    func performQueryFlights(completionHandler: @escaping ([Flight]) -> Void) {
        isPerformQueryFlightsCalled = true
    }
    
}
