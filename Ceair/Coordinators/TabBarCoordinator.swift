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
    }
    
}
