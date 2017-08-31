//
//  TabBarCoordinator.swift
//  Ceair
//
//  Created by Tong Tian on 8/31/17.
//  Copyright © 2017 Bizersoft. All rights reserved.
//

import UIKit

class TabBarCoordinator: Coordinator {
    
    let window: UIWindow
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
        let tabBarViewController = TabBarViewController()
        window.rootViewController = tabBarViewController
        
        let bookingTab = UINavigationController(rootViewController: BookingTabViewController())
        bookingTab.tabBarItem.title = TabBars.Booking
        bookingTab.tabBarItem.image = UIImage(named: Images.Booking)
        
        let flightViewController = FlightTabViewController()
        flightViewController.viewModel = FlightTabViewModel()
        
        let flightTab = UINavigationController(rootViewController: flightViewController)
        flightTab.tabBarItem.title = TabBars.Flight
        flightTab.tabBarItem.image = UIImage(named: Images.Flight)
        
        let dummyMoreTab = createDummyTabItem(title: TabBars.More)
        let dummyMyTab = createDummyTabItem(title: TabBars.My)
        
        tabBarViewController.viewControllers = [bookingTab, flightTab, dummyMoreTab, dummyMyTab]
        
        tabBarViewController.selectedIndex = 1
    }
    
    private func createDummyTabItem(title: String) -> UINavigationController {
        let dummyViewController = UIViewController()
        dummyViewController.view.backgroundColor = UIColor.fromHEX(string: Colors.DefaultBackground)
        dummyViewController.navigationItem.title = title
        
        let navController = UINavigationController(rootViewController: dummyViewController)
        navController.tabBarItem.title = title
        navController.tabBarItem.image = UIImage(named: title)
        
        return navController
    }
    
}
