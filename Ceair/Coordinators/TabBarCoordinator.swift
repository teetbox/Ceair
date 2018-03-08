//
//  TabBarCoordinator.swift
//  Ceair
//
//  Created by Tong Tian on 8/31/17.
//  Copyright © 2017 Bizersoft. All rights reserved.
//

import UIKit

class TabBarCoordinator: AppCoordinator {
    
    var discoveryCoordinator: DiscoveryCoordinator?
    
    override func start() {
        let tabBarController = UITabBarController()
        tabBarController.tabBar.isTranslucent = false
        tabBarController.tabBar.tintColor = UIColor.fromHEX(string: COLORS.BarTintColor)
        window.rootViewController = tabBarController
        
        let bookingTab = UINavigationController(rootViewController: BookingTabViewController())
        bookingTab.tabBarItem.title = TABBARS.Booking
        bookingTab.tabBarItem.image = UIImage(named: IMAGES.Booking)
        
        let flightTabViewController = FlightTabViewController()
        let flightTabDataModel = FlightTabDateModel()
        flightTabViewController.viewModel = FlightTabViewModel(dataModel: flightTabDataModel)
        
        let flightTab = UINavigationController(rootViewController: flightTabViewController)
        flightTab.tabBarItem.title = TABBARS.Flight
        flightTab.tabBarItem.image = UIImage(named: IMAGES.Flight)
        
        /*
        let discoveryTabViewController = DiscoveryTabViewController()
        let discoveryDataModel = DiscoveryTabDataModel()
        discoveryCoordinator = DiscoveryCoordinator(window: window)
        let discoveryTabViewModel = DiscoveryTabViewModel(dataModel: discoveryDataModel)
        discoveryTabViewModel.coordinator = discoveryCoordinator
        discoveryTabViewController.viewModel = discoveryTabViewModel
        */
        let discoveryCoordinator = DiscoveryCoordinator(window: window)
        discoveryCoordinator.start()
        
        let discoveryTab = UINavigationController(rootViewController: discoveryCoordinator.discoveryViewController)
        discoveryTab.tabBarItem.title = TABBARS.Discovery
        
        let moreTab = UINavigationController(rootViewController: MoreTabViewController())
        moreTab.tabBarItem.title = TABBARS.More
        moreTab.tabBarItem.image = UIImage(named: IMAGES.More)
        
        let myViewModel = MyViewModel(analytics: AnalyticsManager(engine: CloudKitAnalyticsEngine()))
        let myViewController = MyViewController(viewModel: myViewModel)
        let myTab = UINavigationController(rootViewController: myViewController)
        myTab.tabBarItem.title = TABBARS.My
        myTab.tabBarItem.image = UIImage(named: IMAGES.My)
        
        tabBarController.viewControllers = [bookingTab, flightTab, discoveryTab, moreTab, myTab]
        tabBarController.selectedIndex = 2
    }
    
    private func createDummyTabItem(title: String) -> UINavigationController {
        let dummyViewController = UIViewController()
        dummyViewController.view.backgroundColor = UIColor.fromHEX(string: COLORS.DefaultBackground)
        dummyViewController.navigationItem.title = title
        
        let navController = UINavigationController(rootViewController: dummyViewController)
        navController.tabBarItem.title = title
        navController.tabBarItem.image = UIImage(named: title)
        
        return navController
    }
    
}
