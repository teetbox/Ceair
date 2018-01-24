//
//  DestinationCoordinator.swift
//  Ceair
//
//  Created by Matt Tian on 03/01/2018.
//  Copyright © 2018 Bizersoft. All rights reserved.
//

import UIKit

class DestinationCoordinator: AppCoordinator {

    var destinationVC: DestinationViewController?

    deinit {
        print("Deinit Destination Coordinator")
    }
    
    override func start() {
        let dataModel = DestinationDataModel()
        let viewModel = DestinationViewModel(dataModel: dataModel)
        viewModel.coordinator = self
        destinationVC = DestinationViewController()
        destinationVC!.viewModel = viewModel
        
        let topViewController = UIApplication.topViewController()
        // Easiest way to hide tabBar in the next view
        topViewController?.hidesBottomBarWhenPushed = true
        topViewController?.navigationController?.pushViewController(destinationVC!, animated: true)
        // Make tabBar back when dismiss the next view
        topViewController?.hidesBottomBarWhenPushed = false
    }
    
}

extension DestinationCoordinator: DestinationViewModelCoordinatorDelegate {
    
    func back() {
        let topViewController = UIApplication.topViewController()
        topViewController?.navigationController?.popViewController(animated: true)
        destinationVC = nil
        coordinatorStack.pop()
    }
    
    func showFilter(with tag: Int) {
        let filterCoordinator = DestinationFilterCoordinator(window: window)
        filterCoordinator.showFilter(with: tag)
    }
    
    func showRoute(at index: Int) {
        let routeCoordinator = RouteCoordinator(window: window)
        routeCoordinator.start()
    }
    
    func dismissFilter() {
        destinationVC?.dismissFilter()
    }
    
}
