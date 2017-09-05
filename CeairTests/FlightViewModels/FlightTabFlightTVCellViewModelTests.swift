//
//  FlightTabFlightTVCellViewModelTests.swift
//  CeairTests
//
//  Created by Tong Tian on 9/5/17.
//  Copyright © 2017 Bizersoft. All rights reserved.
//

import XCTest
@testable import Ceair

class FlightTabFlightTVCellViewModelTests: XCTestCase {
    
    var flight: Flight?
    
    override func setUp() {
        flight = Flight(flightNo: "MU2453", dCityName: "XIAN", dPort: "XIY", departureTime: "2017-09-11 07:10", aCityName: "SHANGHAI", aPort: "SHA", arrivalTime: "2017-09-11 11:45", duration: "245/245", crossDay: "0", dAirportName: "Xi an Xianyang Airport", aAirportName: "SHANGHAI HONGQIAO APT", equipment: "320", trnInfo: nil)
    }
    
    func testInit() {
        XCTAssertNotNil(flight)
    }
    
    func testConfigCell() {
        XCTAssertEqual(flight?.flightNo, "MU2453")
        XCTAssertEqual(flight?.dCityName, "XIAN")
        XCTAssertEqual(flight?.dPort, "XIY")
        XCTAssertEqual(flight?.departureTime, "2017-09-11 07:10")
        XCTAssertEqual(flight?.aCityName, "SHANGHAI")
        XCTAssertEqual(flight?.aPort, "SHA")
        XCTAssertEqual(flight?.arrivalTime, "2017-09-11 11:45")
        XCTAssertEqual(flight?.duration, "245/245")
        XCTAssertEqual(flight?.crossDay, "0")
        XCTAssertEqual(flight?.dAirportName, "Xi an Xianyang Airport")
        XCTAssertEqual(flight?.aAirportName, "SHANGHAI HONGQIAO APT")
        XCTAssertEqual(flight?.equipment, "320")
        XCTAssertEqual(flight?.trnInfo, nil)
    }
    
}
