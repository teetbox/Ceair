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
    var loggedUser: User?
    
    func userLogin(_ user: User) {
        loggedUser = user
        isLoggedIn = true
    }
    
    func userLogout() {
        loggedUser = nil
        isLoggedIn = false
    }
    
}
