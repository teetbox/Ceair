//
//  DestinationFilterViewModel.swift
//  Ceair
//
//  Created by Matt Tian on 03/01/2018.
//  Copyright © 2018 Bizersoft. All rights reserved.
//

import Foundation

protocol DestinationFilterViewModelCoordinatorDelegate {
    func dismiss()
}

class DestinationFilterViewModel {
    
    var coordinator: DestinationFilterViewModelCoordinatorDelegate?
    
}
