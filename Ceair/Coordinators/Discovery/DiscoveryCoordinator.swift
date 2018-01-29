//
//  DiscoveryCoordinator.swift
//  Ceair
//
//  Created by Matt Tian on 03/01/2018.
//  Copyright © 2018 Bizersoft. All rights reserved.
//

import UIKit

class DiscoveryCoordinator: AppCoordinator {
    
    let discoveryViewController: DiscoveryTabViewController
    
    override init(window: UIWindow) {
        self.discoveryViewController = DiscoveryTabViewController()
        super.init(window: window)
    }

    deinit {
        print("Deinit Discovery Coordinator")
    }
    
    override func start() {
        let discoveryDataModel = DiscoveryTabDataModel()
        let discoveryTabViewModel = DiscoveryViewModel(dataModel: discoveryDataModel)
        discoveryTabViewModel.coordinator = self
        discoveryViewController.viewModel = discoveryTabViewModel
    }
 
}

extension DiscoveryCoordinator: DiscoveryViewModelCoordinatorDelegate {
    
    func didSelectDestination() {
        let destinationCoordinator = DestinationCoordinator(window: window)
        destinationCoordinator.start()
    }
    
}
