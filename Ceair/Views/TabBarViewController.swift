//
//  TabBarViewController.swift
//  Ceair
//
//  Created by Tong Tian on 8/29/17.
//  Copyright © 2017 Bizersoft. All rights reserved.
//

import UIKit

class TabBarViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let bookingTab = UINavigationController(rootViewController: BookingTabViewController())
        bookingTab.tabBarItem.title = TabBars.Booking
        bookingTab.tabBarItem.image = UIImage(named: Images.Booking)
        
        let flightTab = UINavigationController(rootViewController: FlightTabViewController())
        flightTab.tabBarItem.title = TabBars.Flight
        flightTab.tabBarItem.image = UIImage(named: Images.Flight)
        
        let dummyMoreTab = createDummyTabItem(title: TabBars.More)
        let dummyMyTab = createDummyTabItem(title: TabBars.My)
        
        viewControllers = [bookingTab, flightTab, dummyMoreTab, dummyMyTab]
    }
    
    private func createDummyTabItem(title: String) -> UINavigationController {
        let dummyViewController = UIViewController()
        dummyViewController.view.backgroundColor = UIColor.fromHEX(string: Colors.defaultBackground)
        dummyViewController.navigationItem.title = title
        
        let navController = UINavigationController(rootViewController: dummyViewController)
        navController.tabBarItem.title = title
        navController.tabBarItem.image = UIImage(named: title)
        
        return navController
    }

}
