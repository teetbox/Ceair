//
//  XCUIApplication+DisplayView.swift
//  CeairUITests
//
//  Created by Matt Tian on 08/03/2018.
//  Copyright © 2018 Bizersoft. All rights reserved.
//

import XCTest

extension XCUIApplication {
    
    var isDisplayingDiscovery: Bool {
        return otherElements[DISPLAY.DiscoveryView].exists
    }
    
    var isDisplayingMy: Bool {
        return otherElements[DISPLAY.MyView].exists
    }
    
    var isDisplayingLoading: Bool {
        return otherElements[DISPLAY.LoadingView].exists
    }
    
}
