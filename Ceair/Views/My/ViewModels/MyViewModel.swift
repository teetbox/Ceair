//
//  MyViewModel.swift
//  Ceair
//
//  Created by Matt Tian on 02/03/2018.
//  Copyright © 2018 Bizersoft. All rights reserved.
//

import Foundation

class MyViewModel {
    
    private let analytics: AnalyticsManager
    
    init(analytics: AnalyticsManager) {
        self.analytics = analytics
    }
    
    func fetchData() {
        // fetch some data to show
        
        analytics.log(.myScreenViewed)
    }
    
}
