//
//  FlightTabDataModel.swift
//  Ceair
//
//  Created by Tong Tian on 9/1/17.
//  Copyright © 2017 Bizersoft. All rights reserved.
//

import Foundation

protocol FlightTabDataModelProtocol {
    func performLogin(user: String, pwd: String)
    func performQueryFlights(completionHandler: @escaping ([Flight]) -> Void)
}

struct FlightTabDateModel: FlightTabDataModelProtocol {
    
    func performLogin(user: String, pwd: String) {
        
    }
    
    func performQueryFlights(completionHandler: @escaping ([Flight]) -> Void) {
        DispatchQueue.global().async {
            let flight = Flight(flightNo: "MU2453", dCityName: "XIAN", dPort: "XIY", departureTime: "2017-09-11 07:10", aCityName: "SHANGHAI", aPort: "SHA", arrivalTime: "2017-09-11 11:45", duration: "245/245", crossDay: "0", dAirportName: "Xi an Xianyang Airport", aAirportName: "SHANGHAI HONGQIAO APT", equipment: "320", trnInfo: nil)
            
            let flight2 = Flight(flightNo: "MU2111", dCityName: "XIAN", dPort: "XIY", departureTime: "2017-09-01 16:00", aCityName: "BEIJING", aPort: "PEK", arrivalTime: "2017-09-01 17:55", duration: "115/115", crossDay: "0", dAirportName: "Xi an Xianyang Airport", aAirportName: "BEIJING CAPITAL AIRPORT", equipment: "325", trnInfo: nil)
            
            DispatchQueue.main.async {
                completionHandler([flight, flight2])
            }
        }
    }
    
}
