//
//  AnalyticsManager.swift
//  Ceair
//
//  Created by Matt Tian on 02/03/2018.
//  Copyright © 2018 Bizersoft. All rights reserved.
//

import UIKit

class AnalyticsManager {
    
    private let engine: AnalyticsEngine
    
    init(engine: AnalyticsEngine) {
        self.engine = engine
    }
    
    func log(_ event: AnalyticsEvent) {
        engine.sendAnalyticsEvent(named: event.name, metadata: event.metadata)
    }
    
}

extension AnalyticsManager {
    
    static func make(with window: UIWindow) -> AnalyticsManager {
        if CommandLine.arguments.contains("--uitesting") {
            return AnalyticsManager(engine: AlertAnalyticsEngine(window: window))
        }
        
        return AnalyticsManager(engine: CloudKitAnalyticsEngine())
    }
    
}
