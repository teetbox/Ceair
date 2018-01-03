//
//  DiscoveryCoordinator.swift
//  Ceair
//
//  Created by Matt Tian on 03/01/2018.
//  Copyright © 2018 Bizersoft. All rights reserved.
//

import UIKit

class DiscoveryCoordinator: Coordinator {
    
    let window: UIWindow
    
    init(window: UIWindow) {
        self.window = window
    }
    
    deinit {
        print("Deinit Discovery Coordinator")
    }
    
    func start() {
    
    }
 
}

extension DiscoveryCoordinator: DiscoveryTabViewModelCoordinatorDelegate {
    
    func didSelectDestination() {
        let destinationCoordinator = DestinationCoordinator(window: window)
        destinationCoordinator.start()
    }
    
}
