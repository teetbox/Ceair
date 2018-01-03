//
//  DestinationFilterView.swift
//  Ceair
//
//  Created by Matt Tian on 03/01/2018.
//  Copyright © 2018 Bizersoft. All rights reserved.
//

import UIKit

class DestinationFilterView: UIView {
    
    var viewModel: DestinationFilterViewModel!
    
    let blackView: UIView = {
        let view = UIView()
        return view
    }()
    
    let titleView: UIView = {
        let view = UIView()
        return view
    }()
    
    func show(_ window: UIWindow) {
        blackView.backgroundColor = UIColor(white: 1, alpha: 0.8)
        blackView.frame = window.frame
        blackView.alpha = 0.5
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleDismiss))
        blackView.addGestureRecognizer(tapGesture)
        
        window.addSubview(blackView)
        
        setUpViews(window)
    }
    
    private func setUpViews(_ window: UIView) {
        titleView.frame = CGRect(x: 0, y: window.frame.height, width: window.frame.width, height: 200)
        titleView.backgroundColor = .green
        window.addSubview(titleView)
        
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            self.blackView.alpha = 1
            self.titleView.frame = CGRect(x: 0, y: window.frame.height - 200, width: window.frame.width, height: 200)
        }, completion: nil)
    }
    
    @objc func handleDismiss() {
        print(#function)
    }
    
}
