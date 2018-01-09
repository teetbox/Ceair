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
    let parent: Coordinator
    let destinationFilterView: DestinationFilterView
    
    init(window: UIWindow, parent: Coordinator) {
        self.window = window
        self.parent = parent
        self.destinationFilterView = DestinationFilterView()
        print("Init Destination Filter Coordinator")
    }
    
    deinit {
        print("Deinit Destination Filter Coordinator")
    }
    
    func start() {
        let dataModel = DestinationFilterDataModel()
        let viewModel = DestinationFilterViewModel(dataModel: dataModel)
        viewModel.coordinator = self
        destinationFilterView.viewModel = viewModel
        destinationFilterView.show(window)
    }
    
    func showFilter(with tag: Int) {
        destinationFilterView.handleFilter(with: tag)
    }
    
}

extension DestinationFilterCoordinator: DestinationFilterViewModelCoordinatorDelegate {
    
    func dismiss() {
        if let destinationCoordinator = parent as? DestinationCoordinator {
            destinationCoordinator.dismissFilter()
        }
    }
    
}
