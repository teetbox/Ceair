//
//  DiscoveryTabViewModel.swift
//  Ceair
//
//  Created by Matt Tian on 02/01/2018.
//  Copyright © 2018 Bizersoft. All rights reserved.
//

import Foundation

protocol DiscoveryTabViewModelCoordinatorDelegate {
    func didSelectDestination()
}

class DiscoveryTabViewModel {
    
    var coordinator: DiscoveryTabViewModelCoordinatorDelegate?
    
    let dataModel: DiscoveryTabDataModelProtocol
    
    init(dataModel: DiscoveryTabDataModelProtocol) {
        self.dataModel = dataModel
    }
    
    var themes: [DiscoveryTheme] = Array(repeating: DiscoveryTheme(themeName: "Theme", themeCode: "", delFlag: false), count: 8)
    
    var themeCities: [[DiscoveryCity]] = [[]]
    
    func fetchThemes(completion: @escaping () -> Void) {
        dataModel.fetchThemes { themes in
            self.themes = themes
           
            DispatchQueue.main.async {
                completion()
            }
        }
    }
    
    func fetchCities(completion: @escaping () -> Void) {
        dataModel.fetchCities { (cities) in
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
