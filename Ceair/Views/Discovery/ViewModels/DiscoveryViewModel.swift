//
//  DiscoveryViewModel.swift
//  Ceair
//
//  Created by Matt Tian on 02/01/2018.
//  Copyright © 2018 Bizersoft. All rights reserved.
//

import Foundation

protocol DiscoveryViewModelCoordinatorDelegate {
    func didSelectDestination()
}

class DiscoveryViewModel {
    
    var coordinator: DiscoveryViewModelCoordinatorDelegate?
    
    let dataModel: DiscoveryTabDataModelProtocol
    
    init(dataModel: DiscoveryTabDataModelProtocol) {
        self.dataModel = dataModel
    }
    
    var themes = [DiscoveryTheme]()
    
    var themeCities = [[DiscoveryCity]]()
    
    func fetchThemes(completion: @escaping () -> Void) {
        dataModel.fetchThemes { themes in
            self.themes = themes
           
            DispatchQueue.main.async {
                completion()
            }
        }
    }
    
    func fetchCities(completion: @escaping () -> Void) {
        dataModel.fetchCities { cities in
            self.themeCities = cities
            
            DispatchQueue.main.async {
                completion()
            }
        }
    }
    
    func didSelectDestination() {
        coordinator?.didSelectDestination()
    }
    
}
