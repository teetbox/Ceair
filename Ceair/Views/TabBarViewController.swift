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
        bookingTab.tabBarItem.title = "Booking"
        bookingTab.tabBarItem.image = UIImage(named: "Booking")
        
        let dummyTabOne = createDummyTabItem(title: "Flight")
        let dummyTabTwo = createDummyTabItem(title: "More")
        let dummyTabThree = createDummyTabItem(title: "My")
        
        viewControllers = [bookingTab, dummyTabOne, dummyTabTwo, dummyTabThree]
    }
    
    private func createDummyTabItem(title: String) -> UINavigationController {
        let dummyViewController = UIViewController()
        dummyViewController.view.backgroundColor = UIColor.fromHEX(string: "#ABCDEF")
        dummyViewController.navigationItem.title = title
        
        let navController = UINavigationController(rootViewController: dummyViewController)
        navController.tabBarItem.title = title
        navController.tabBarItem.image = UIImage(named: title)
        
        return navController
    }

}
