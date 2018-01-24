//
//  RouteViewModel.swift
//  Ceair
//
//  Created by Matt Tian on 24/01/2018.
//  Copyright © 2018 Bizersoft. All rights reserved.
//

import Foundation

protocol RouteViewModelCoordinatorDelegate {
    func back()
}

class RouteViewModel {
    
    var coordinator: RouteViewModelCoordinatorDelegate?
    
    func back() {
        coordinator?.back()
    }
    
}
