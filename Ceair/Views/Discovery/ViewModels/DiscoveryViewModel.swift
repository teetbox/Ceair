//
//  DiscoveryViewModel.swift
//  Ceair
//
//  Created by Matt Tian on 02/01/2018.
//  Copyright © 2018 Bizersoft. All rights reserved.
//

import Foundation

protocol DiscoveryViewModelCoordinatorDelegate {
    func showRoute(at index: Int)
    func showTheme(at index: Int)
}

class DiscoveryViewModel {
    
    var coordinator: DiscoveryViewModelCoordinatorDelegate?
    
    let dataModel: DiscoveryDataModelProtocol
    
    init(dataModel: DiscoveryDataModelProtocol) {
        self.dataModel = dataModel
    }
    
    var themeCount: Int {
        return themes.count
    }
    
    var themeCityCount: Int {
        return themeCities.count
    }
    
    private var themes = [DiscoveryTheme]()
    private var themeCities = [[DiscoveryCity]]()
    
    func theme(at indexPath: IndexPath) -> DiscoveryTheme {
        return themes[indexPath.item]
    }
    
    func fetchThemes(completion: @escaping () -> Void) {
        dataModel.fetchThemes { themes in
            self.themes = themes
           
            DispatchQueue.main.async {
                completion()
            }
        }
    }
    
    func city(at index: IndexPath, forTheme themeIndex: Int) -> DiscoveryCity {
        return themeCities[themeIndex][index.item]
    }
    
    func cities(forTheme themeIndex: Int) -> [DiscoveryCity] {
        return themeCities[themeIndex]
    }
    
    func fetchCities(completion: @escaping () -> Void) {
        dataModel.fetchCities { cities in
            self.themeCities = cities
            
            DispatchQueue.main.async {
                completion()
            }
        }
    }
    
    func loadImage(from url: String, completion: @escaping (String, Data) -> Void) {
        dataModel.loadImage(from: url) { (imageUrl, imageData) in
            DispatchQueue.main.async {
                completion(imageUrl, imageData)
            }
        }
    }
    
    func showRoute(at index: Int) {
        coordinator?.showRoute(at: index)
    }
    
    func showTheme(at index: Int) {
        coordinator?.showTheme(at: index)
    }
    
}
