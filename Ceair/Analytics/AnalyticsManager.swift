//
//  AnalyticsManager.swift
//  Ceair
//
//  Created by Matt Tian on 02/03/2018.
//  Copyright © 2018 Bizersoft. All rights reserved.
//

import Foundation

class AnalyticsManager {
    
    private let engine: AnalyticsEngine
    
    init(engine: AnalyticsEngine) {
        self.engine = engine
    }
    
    func log(_ event: AnalyticsEvent) {
        engine.sendAnalyticsEvent(named: event.name, metadata: event.metadata)
    }
    
}
