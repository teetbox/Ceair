//
//  XCUIApplication+DisplayView.swift
//  CeairUITests
//
//  Created by Matt Tian on 08/03/2018.
//  Copyright © 2018 Bizersoft. All rights reserved.
//

import XCTest
import Foundation
@testable import Ceair

extension XCUIApplication {
    
    var isDisplayingDiscovery: Bool {
        return otherElements[DISPLAY.DiscoveryView].exists
    }
    
    var isDisplayingCity: Bool {
        return otherElements[DISPLAY.CityView].exists
    }
    
    var isDisplayingMy: Bool {
        return otherElements[DISPLAY.MyView].exists
    }
    
    var isDisplayingLoading: Bool {
        return otherElements[DISPLAY.LoadingView].exists
    }
 
    func isLogged(for event: AnalyticsEvent) -> Bool {
        let alert = alerts.element
        
        guard alert.exists else {
            return false
        }
        
        let expectedTitle = "Analytics event: \(event.name)"
        var expectedMessage = "Metadata: "

        for (key, value) in event.metadata {
            expectedMessage.append("(\(key), \(value))")
        }

        guard alert.staticTexts[expectedTitle].exists else {
            return false
        }

        guard alert.staticTexts[expectedMessage].exists else {
            return false
        }
        
        return true
    }
    
}
