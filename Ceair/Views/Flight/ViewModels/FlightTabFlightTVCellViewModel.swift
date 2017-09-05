//
//  FlightTabFlightTVCellViewModel.swift
//  Ceair
//
//  Created by Tong Tian on 9/4/17.
//  Copyright © 2017 Bizersoft. All rights reserved.
//

import Foundation

class FlightTabFlightTVCellViewModel {

    let flight: Flight?
    
    var departureCity: String?
    var arrivalCity: String?
    var flightNo: String?
    var flightEquipment: String?
    
    init(flight: Flight?) {
        self.flight = flight
    }
    
    func configCell() {
        self.departureCity = flight?.dCityName
        self.arrivalCity = flight?.aCityName
        self.flightNo = flight?.flightNo
        self.flightEquipment = flight?.equipment
    }
    
}
