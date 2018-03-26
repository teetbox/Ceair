//
//  Dynamic.swift
//  Ceair
//
//  Created by Matt Tian on 26/03/2018.
//  Copyright © 2018 Bizersoft. All rights reserved.
//

import Foundation

class Dynamic<T> {
    
    var value: T? {
        didSet {
            listenr?()
        }
    }
    
    var listenr: (() -> Void)?
    
    init(_ value: T) {
        self.value = value
    }
    
    func bind(_ closure: @escaping () -> Void) {
        self.listenr = closure
    }
    
    func bindAndFire(_ closure: @escaping () -> Void) {
        self.listenr = closure
        closure()
    }
    
}
