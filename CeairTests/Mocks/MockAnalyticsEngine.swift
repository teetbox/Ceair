//
//  MockAnalyticsEngine.swift
//  CeairTests
//
//  Created by Matt Tian on 08/03/2018.
//  Copyright © 2018 Bizersoft. All rights reserved.
//

import Foundation
@testable import Ceair

class MockAnalyticsEngine: AnalyticsEngine {
    
    var stubName: String?
    var stubMetadata: [String: String]?
    
    func sendAnalyticsEvent(named name: String, metadata: [String : String]) {
        self.stubName = name
        self.stubMetadata = metadata
    }
    
}
