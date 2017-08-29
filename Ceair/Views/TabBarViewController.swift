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
        
        let dummyTabOne = createDummyTabItem(title: "One")
        let dummyTabTwo = createDummyTabItem(title: "Two")
        let dummyTabThree = createDummyTabItem(title: "Three")
        
        viewControllers = [bookingTab, dummyTabOne, dummyTabTwo, dummyTabThree]
    }
    
    private func createDummyTabItem(title: String) -> UINavigationController {
        let dummyViewController = UIViewController()
        dummyViewController.view.backgroundColor = UIColor.fromHEX(string: "#ABCDEF")
        dummyViewController.navigationItem.title = title
        
        let navController = UINavigationController(rootViewController: dummyViewController)
        navController.tabBarItem.title = title
        
        return navController
    }

}
