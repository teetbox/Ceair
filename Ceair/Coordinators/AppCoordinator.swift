//
//  AppCoordinator.swift
//  Ceair
//
//  Created by Tong Tian on 8/31/17.
//  Copyright © 2017 Bizersoft. All rights reserved.
//

import UIKit

var coordinatorStack = Stack<AppCoordinator>()

class AppCoordinator: Coordinator {
    
    let window: UIWindow
    let analyticsManager: AnalyticsManager
    
    init(window: UIWindow) {
        self.window = window
        self.analyticsManager = AnalyticsManager.make(with: window)
        coordinatorStack.push(self)
    }
    
    func start() {
        if !LaunchUtility.isFirstLaunch {
            showLogin()
        } else {
            showTabBar()
        }
    }
    
    private func showLogin() {
        
    }
    
    private func showTabBar() {
        let tabBarCoordinator = TabBarCoordinator(window: window)
        tabBarCoordinator.start()
    }
    
}
