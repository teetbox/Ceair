//
//  FlightTabFlightTVCellViewModel.swift
//  Ceair
//
//  Created by Tong Tian on 9/4/17.
//  Copyright © 2017 Bizersoft. All rights reserved.
//

import Foundation

class FlightTabFlightTVCellViewModel {
    
    var flight: Flight?
    
    init(flight: Flight?) {
        self.flight = flight
    }
    
    var departureCity: String?
    var arrivalCity: String?
    
}
