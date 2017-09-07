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
    
    var viewModel: FlightTabFlightTVCellViewModel!
    var flight: Flight?
    
    override func setUp() {
        flight = Flight(flightNo: "MU2453", dCityName: "XIAN", dPort: "XIY", departureTime: "2017-09-11 16:00", aCityName: "SHANGHAI", aPort: "SHA", arrivalTime: "2017-09-11 18:20", duration: "245/245", crossDay: "0", dAirportName: "Xi an Xianyang Airport", aAirportName: "SHANGHAI HONGQIAO APT", equipment: "320", trnInfo: nil)
        
        viewModel = FlightTabFlightTVCellViewModel(flight: flight)
    }
    
    func testInit() {
        XCTAssertNotNil(viewModel.flight)
        XCTAssertEqual(viewModel.departureCity, "XIAN")
        XCTAssertEqual(viewModel.arrivalCity, "SHANGHAI")
        XCTAssertNil(viewModel.flightNo)
        XCTAssertNil(viewModel.flightDate)
        XCTAssertNil(viewModel.departureAirport)
        XCTAssertNil(viewModel.departureAirportCode)
        XCTAssertNil(viewModel.departureTime)
        XCTAssertNil(viewModel.arrivalAirport)
        XCTAssertNil(viewModel.arrivalAirportCode)
        XCTAssertNil(viewModel.arrivalTime)
        XCTAssertNil(viewModel.flyTime)
    }
    
    func testConfigCell() {
        viewModel.configCell {}
        
        XCTAssertEqual(viewModel.flightNo, "MU2453 | 320")
        XCTAssertEqual(viewModel.flightDate, "2017-09-11, Monday")
        XCTAssertEqual(viewModel.departureCity, "XIAN")
        XCTAssertEqual(viewModel.departureAirport, "Xi an Xianyang Airport")
        XCTAssertEqual(viewModel.departureAirportCode, "XIY")
        XCTAssertEqual(viewModel.departureTime, "16:00")
        XCTAssertEqual(viewModel.arrivalCity, "SHANGHAI")
        XCTAssertEqual(viewModel.arrivalAirport, "SHANGHAI HONGQIAO APT")
        XCTAssertEqual(viewModel.arrivalAirportCode, "SHA")
        XCTAssertEqual(viewModel.arrivalTime, "18:20")
        XCTAssertEqual(viewModel.flyTime, "2H 20M")
    }
    
}
