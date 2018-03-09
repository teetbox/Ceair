//
//  LoadingViewController.swift
//  Ceair
//
//  Created by Matt Tian on 01/03/2018.
//  Copyright © 2018 Bizersoft. All rights reserved.
//

import UIKit

class LoadingViewController: UIViewController {
    
    let dimView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(white: 0.7, alpha: 0.1)
        return view
    }()
    
    let containerView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(white: 0.1, alpha: 0.7)
        view.layer.cornerRadius = 10
        view.clipsToBounds = true
        return view
    }()
    
    let activityIndicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView()
        indicator.activityIndicatorViewStyle = .whiteLarge
        return indicator
    }()
    
    deinit {
        print("Deinit loading view")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // For UI testing identifer
        view.accessibilityIdentifier = DISPLAY.Common.LoadingView
        
        setupViews()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        activityIndicator.startAnimating()
    }
    
    private func setupViews() {
        view.addSubview(dimView)
        view.addConstraints(format: "H:|[v0]|", views: dimView)
        view.addConstraints(format: "V:|[v0]|", views: dimView)
        
        view.addSubview(containerView)
        view.addConstraints(format: "H:[v0(80)]", views: containerView)
        view.addConstraints(format: "V:[v0(80)]", views: containerView)
        containerView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        containerView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        view.addSubview(activityIndicator)
        view.addConstraints(format: "H:[v0(40)]", views: activityIndicator)
        view.addConstraints(format: "V:[v0(40)]", views: activityIndicator)
        activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        activityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
}
