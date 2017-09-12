//
//  Config.swift
//  Ceair
//
//  Created by Tong Tian on 9/12/17.
//  Copyright © 2017 Bizersoft. All rights reserved.
//

import Foundation

class UserConfig {
    
    static let shared = UserConfig()
    
    private init() {}
    
    var isLoggedIn = false
    var user: User?
    
    func update(user: User) {
        self.user = user
        isLoggedIn = true
    }
    
}
