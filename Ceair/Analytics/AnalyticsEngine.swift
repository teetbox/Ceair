//
//  AnalyticsEngine.swift
//  Ceair
//
//  Created by Matt Tian on 02/03/2018.
//  Copyright © 2018 Bizersoft. All rights reserved.
//

import Foundation

protocol AnalyticsEngine: class {
    func sendAnalyticsEvent(named name: String, metadata: [String: String])
}
