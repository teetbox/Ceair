//
//  RouteViewController.swift
//  Ceair
//
//  Created by Matt Tian on 24/01/2018.
//  Copyright © 2018 Bizersoft. All rights reserved.
//

import UIKit

class RouteViewController: UIViewController {
    
    var viewModel: RouteViewModel!
    
    let navView: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        return view
    }()
    
    let navTitle: UILabel = {
        let label = UILabel()
        label.text = "Shanghai - Xi'an"
        label.textColor = .darkGray
        label.textAlignment = .center
        return label
    }()
    
    lazy var backButton: UIButton = {
        let button = UIButton()
        button.setTitle("Back", for: .normal)
        button.setTitleColor(UIColor.darkGray, for: .normal)
        button.addTarget(self, action: #selector(handleBack), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.brown
        
        setUpViews()
    }
    
    private func setUpViews() {
        view.addSubview(navView)
        view.addConstraints(format: "H:|[v0]|", views: navView)
        view.addConstraints(format: "V:|[v0(60)]", views: navView)
        
        navView.addSubview(navTitle)
        navView.addConstraints(format: "V:|-30-[v0]", views: navTitle)
        navTitle.centerXAnchor.constraint(equalTo: navView.centerXAnchor).isActive = true
        
        navView.addSubview(backButton)
        navView.addConstraints(format: "H:|-15-[v0]", views: backButton)
        backButton.centerYAnchor.constraint(equalTo: navTitle.centerYAnchor).isActive = true
    }
    
    @objc func handleBack() {
        viewModel.back()
    }
    
}
