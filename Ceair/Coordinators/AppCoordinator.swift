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
    
    func start() {
        if LaunchUtility.isFirstLaunch {
            showLogin()
        } else {
            showTabBar()
        }
    }
    
    private func showLogin() {
        
    }
    
    private func showTabBar() {
        
    }
    
}
