//
//  LaunchUtility.swift
//  Ceair
//
//  Created by Tong Tian on 8/31/17.
//  Copyright © 2017 Bizersoft. All rights reserved.
//

import Foundation

class LaunchUtility {
    
    static let isFirstLaunch = !UserDefaults.standard.bool(forKey: Defaults.IsFirstLaunch)
    
}
