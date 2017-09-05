//
//  FlightTabFlightTVCellViewModel.swift
//  Ceair
//
//  Created by Tong Tian on 9/4/17.
//  Copyright © 2017 Bizersoft. All rights reserved.
//

import Foundation

class FlightTabFlightTVCellViewModel {

    var departureCity: String?
    var arrivalCity: String?
    
    init(flight: Flight?) {
        self.departureCity = flight?.dCityName
        self.arrivalCity = flight?.aCityName
    }

}
