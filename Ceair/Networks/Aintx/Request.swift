//
//  Request.swift
//  Ceair
//
//  Created by Tong Tian on 9/15/17.
//  Copyright © 2017 Bizersoft. All rights reserved.
//

import Foundation

protocol Request {
    func fire()
}

struct DataRequest: Request {
    
    func fire() {
        performDataRequest()
    }
    
    private func performDataRequest() {
    
    }
    
}
