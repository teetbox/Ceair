//
//  DiscoveryCoordinator.swift
//  Ceair
//
//  Created by Matt Tian on 03/01/2018.
//  Copyright © 2018 Bizersoft. All rights reserved.
//

import UIKit

class DiscoveryCoordinator: AppCoordinator {
    
    let discoveryViewController: DiscoveryViewController
    
    override init(window: UIWindow) {
        self.discoveryViewController = DiscoveryViewController()
        super.init(window: window)
    }

    deinit {
        print("Deinit Discovery Coordinator")
    }
    
    override func start() {
        let discoveryDataModel = DiscoveryDataModel()
        let discoveryTabViewModel = DiscoveryViewModel(dataModel: discoveryDataModel)
        discoveryTabViewModel.coordinator = self
        discoveryViewController.viewModel = discoveryTabViewModel
    }
 
}

extension DiscoveryCoordinator: DiscoveryViewModelCoordinatorDelegate {
    
    func showRoute(at index: Int) {
        let topViewController = UIApplication.topViewController()
        topViewController?.hidesBottomBarWhenPushed = true
        
        let routeCoordinator = RouteCoordinator(window: window)
        routeCoordinator.start()
        
        // Show tabBar back when dismiss the next view
        topViewController?.hidesBottomBarWhenPushed = false
    }
    
    func showTheme(at index: Int) {
        let topViewController = UIApplication.topViewController()
        topViewController?.hidesBottomBarWhenPushed = true
        
        let destinationCoordinator = DestinationCoordinator(window: window)
        destinationCoordinator.start()
        
        topViewController?.hidesBottomBarWhenPushed = false
    }
    
}
