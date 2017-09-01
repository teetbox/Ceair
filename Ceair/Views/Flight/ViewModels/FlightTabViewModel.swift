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
    
    init(dataModel: FlightTabDataModelProtocol) {
        self.dataModel = dataModel
    }
    
    func login(user: String, pwd: String) {
        dataModel.performLogin(user: user, pwd: pwd)
    }
    
}
