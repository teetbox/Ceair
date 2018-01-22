//
//  MyTabViewController.swift
//  Ceair
//
//  Created by Matt Tian on 22/01/2018.
//  Copyright © 2018 Bizersoft. All rights reserved.
//

import UIKit

class MyTabViewController: UIViewController {
    
    let navView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }()
    
    let navTitle: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18.0)
        label.textAlignment = .center
        label.textColor = .white
        label.text = "My"
        return label
    }()
    
    let radialView: RadialGradientView = {
        let view = RadialGradientView()
        view.insideColor = UIColor.cyan
        view.outsideColor = UIColor.magenta
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.isNavigationBarHidden = true
        
        setUpGradients()
        setUpViews()
    }
    
    private func setUpGradients() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [UIColor.black.cgColor, UIColor.darkGray.cgColor]
        gradientLayer.frame = view.frame
        
        view.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    private func setUpViews() {
        view.addSubview(navView)
        view.addConstraints(format: "H:|[v0]|", views: navView)
        view.addConstraints(format: "V:|[v0(60)]", views: navView)
        
        navView.addSubview(navTitle)
        navView.addConstraints(format: "V:|-30-[v0]", views: navTitle)
        navTitle.centerXAnchor.constraint(equalTo: navView.centerXAnchor).isActive = true
        
        view.addSubview(radialView)
        view.addConstraints(format: "H:|[v0]|", views: radialView)
        view.addConstraints(format: "V:[v0(\(view.frame.width))]|", views: radialView)
    }
    
}
