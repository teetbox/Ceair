//
//  DestinationViewModel.swift
//  Ceair
//
//  Created by Matt Tian on 03/01/2018.
//  Copyright © 2018 Bizersoft. All rights reserved.
//

import Foundation

protocol DestinationViewModelCoordinatorDelegate {
    func showFilter()
}

class DestinationViewModel {
    
    var coordinator: DestinationViewModelCoordinatorDelegate?
    
    let dataModel: DestinationDataModelProtocol
    
    init(dataModel: DestinationDataModelProtocol) {
        self.dataModel = dataModel
    }
    
    func showFilter() {
        coordinator?.showFilter()
    }
    
}
