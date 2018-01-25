//
//  DeviceUtility.swift
//  Ceair
//
//  Created by Tong Tian on 1/25/18.
//  Copyright © 2018 Bizersoft. All rights reserved.
//

import UIKit

class DeviceUtility {
    
    static var isPhoneX: Bool {
        if #available(iOS 11.0, *) {
            return UIApplication.shared.keyWindow!.safeAreaInsets.top > CGFloat(0.0)
        }
        return false
    }
    
}
