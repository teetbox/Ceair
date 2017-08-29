//
//  Flight.swift
//  Ceair
//
//  Created by Tong Tian on 8/29/17.
//  Copyright © 2017 Bizersoft. All rights reserved.
//

import Foundation

struct Flight: Codable {
    let flightNo: String
    let dCityName: String
    let dPort: String
    let departureTime: String
    let aCityName: String
    let aPort: String
    let arrivalTime: String
    let duration: String
    let crossDay: String
    let dAirportName: String
    let aAirportName: String
    let equipment: String
    let trnInfo: String
}
