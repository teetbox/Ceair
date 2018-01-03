//
//  DestinationFilterCoordinator.swift
//  Ceair
//
//  Created by Matt Tian on 03/01/2018.
//  Copyright © 2018 Bizersoft. All rights reserved.
//

import UIKit

class DestinationFilterCoordinator: Coordinator {
    
    let window: UIWindow
    let destinationFilterView: DestinationFilterView
    
    init(window: UIWindow) {
        self.window = window
        self.destinationFilterView = DestinationFilterView()
        print("Init Destination Filter Coordinator")
    }
    
    deinit {
        print("Deinit Destination Filter Coordinator")
    }
    
    func start() {
        let viewModel = DestinationFilterViewModel()
        viewModel.coordinator = self
        destinationFilterView.viewModel = viewModel
        destinationFilterView.show(window)
    }
    
}

extension DestinationFilterCoordinator: DestinationFilterViewModelCoordinatorDelegate {
    
    func dismiss() {
        
    }
    
}
