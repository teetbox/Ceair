//
//  AppCoordinator.swift
//  Ceair
//
//  Created by Tong Tian on 8/31/17.
//  Copyright © 2017 Bizersoft. All rights reserved.
//

import UIKit

class AppCoordinator: Coordinator {
    
    let window: UIWindow
    
    init(window: UIWindow) {
        self.window = window
    }
    
    deinit {
        print("Deinit AppCoordinator")
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
