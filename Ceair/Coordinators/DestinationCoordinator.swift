//
//  DestinationCoordinator.swift
//  Ceair
//
//  Created by Matt Tian on 03/01/2018.
//  Copyright © 2018 Bizersoft. All rights reserved.
//

import UIKit

class DestinationCoordinator: Coordinator {
    
    let window: UIWindow
    let destinationVC: DestinationViewController
    
    init(window: UIWindow) {
        self.window = window
        self.destinationVC = DestinationViewController()
        print("Init Destination Coordinator")
    }
    
    deinit {
        print("Deinit Destination Coordinator")
    }
    
    func start() {
        let dataModel = DestinationDataModel()
        let viewModel = DestinationViewModel(dataModel: dataModel)
        viewModel.coordinator = self
        destinationVC.viewModel = viewModel
        
        let topViewController = UIApplication.topViewController()
        topViewController?.navigationController?.pushViewController(destinationVC, animated: true)
    }
    
}

extension DestinationCoordinator: DestinationViewModelCoordinatorDelegate {
    
}
