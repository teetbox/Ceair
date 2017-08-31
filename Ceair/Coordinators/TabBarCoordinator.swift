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
        let tabBarController = UITabBarController()
        tabBarController.tabBar.isTranslucent = false
        tabBarController.tabBar.tintColor = UIColor.fromHEX(string: Colors.BarTintColor)
        window.rootViewController = tabBarController
        
        let bookingTab = UINavigationController(rootViewController: BookingTabViewController())
        bookingTab.tabBarItem.title = TabBars.Booking
        bookingTab.tabBarItem.image = UIImage(named: Images.Booking)
        
        let flightTabViewController = FlightTabViewController()
        let flightTabDataModel = FlightTabDateModel()
        flightTabViewController.viewModel = FlightTabViewModel(dataModel: flightTabDataModel)
        
        let flightTab = UINavigationController(rootViewController: flightTabViewController)
        flightTab.tabBarItem.title = TabBars.Flight
        flightTab.tabBarItem.image = UIImage(named: Images.Flight)
        
        let dummyMoreTab = createDummyTabItem(title: TabBars.More)
        let dummyMyTab = createDummyTabItem(title: TabBars.My)
        
        tabBarController.viewControllers = [bookingTab, flightTab, dummyMoreTab, dummyMyTab]
        tabBarController.selectedIndex = 1
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
