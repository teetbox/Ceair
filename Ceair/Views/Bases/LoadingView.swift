//
//  LoadingView.swift
//  Ceair
//
//  Created by Matt Tian on 08/02/2018.
//  Copyright © 2018 Bizersoft. All rights reserved.
//

import UIKit

class LoadingView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
    }
    
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
    
    private func setupViews() {
        addSubview(dimView)
        addConstraints(format: "H:|[v0]|", views: dimView)
        addConstraints(format: "V:|[v0]|", views: dimView)
        
        addSubview(containerView)
        addConstraints(format: "H:[v0(80)]", views: containerView)
        addConstraints(format: "V:[v0(80)]", views: containerView)
        containerView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        containerView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
        addSubview(activityIndicator)
        addConstraints(format: "H:[v0(40)]", views: activityIndicator)
        addConstraints(format: "V:[v0(40)]", views: activityIndicator)
        activityIndicator.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        activityIndicator.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }
    
    func startAnimating() {
        activityIndicator.startAnimating()
        alpha = 1
    }
    
    func stopAnimating() {
        activityIndicator.stopAnimating()
        alpha = 0
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
