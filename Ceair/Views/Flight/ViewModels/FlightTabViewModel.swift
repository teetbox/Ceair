//
//  FlightTabViewModel.swift
//  Ceair
//
//  Created by Tong Tian on 8/31/17.
//  Copyright © 2017 Bizersoft. All rights reserved.
//

import Foundation

class FlightTabViewModel {
    
    let dataModel: FlightTabDataModelProtocol
    
    var flights = [Flight]()
    
    init(dataModel: FlightTabDataModelProtocol) {
        self.dataModel = dataModel
    }
    
    func loadFlights(completionHandler: @escaping () -> Void) {
        dataModel.performQueryFlights { (flights) in
            self.flights = flights

            completionHandler()
        }
    }
    
    func getFlight(at index: Int) -> Flight? {
        guard index < flights.count else {
            return nil
        }
        return flights[index]
    }
    
    func login(user: String, pwd: String) {
        dataModel.performLogin(user: user, pwd: pwd)
    }
    
}
