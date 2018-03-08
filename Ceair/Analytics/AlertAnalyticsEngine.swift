//
//  AlertAnalyticsEngine.swift
//  Ceair
//
//  Created by Matt Tian on 08/03/2018.
//  Copyright © 2018 Bizersoft. All rights reserved.
//

import UIKit

class AlertAnalyticsEngine: AnalyticsEngine {
    
    private let window: UIWindow
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func sendAnalyticsEvent(named name: String, metadata: [String : String]) {
        var message = "Metadata: "
        
        for (key, value) in metadata {
            message.append("(\(key), \(value))")
        }
        
        let title = "Analytics event: \(name)"
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: nil))
        
        var viewController = window.rootViewController
        
        if let presentedViewController = viewController?.presentedViewController {
            viewController = presentedViewController
        }
        
        viewController?.present(alert, animated: false)
    }
    
}
