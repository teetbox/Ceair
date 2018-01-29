//
//  RouteCoordinator.swift
//  Ceair
//
//  Created by Matt Tian on 24/01/2018.
//  Copyright © 2018 Bizersoft. All rights reserved.
//

import UIKit

class RouteCoordinator: AppCoordinator {
    
    var routeViewController: RouteViewController?
    
    deinit {
        print("Deinit Route Coordinator")
    }
    
    override func start() {
        let viewModel = RouteViewModel()
        viewModel.coordinator = self
        routeViewController = RouteViewController()
        routeViewController?.viewModel = viewModel
        
        let topViewController = UIApplication.topViewController()
        topViewController?.navigationController?.pushViewController(routeViewController!, animated: true)
    }
    
}

extension RouteCoordinator: RouteViewModelCoordinatorDelegate {
    
    func back() {
        let topViewController = UIApplication.topViewController()
        topViewController?.navigationController?.popViewController(animated: true)
        routeViewController = nil
        coordinatorStack.pop()
    }
    
}
