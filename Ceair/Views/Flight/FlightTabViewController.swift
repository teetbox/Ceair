//
//  FlightTabViewController.swift
//  Ceair
//
//  Created by Tong Tian on 8/30/17.
//  Copyright © 2017 Bizersoft. All rights reserved.
//

import UIKit

class FlightTabViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.isNavigationBarHidden = true
        
        setupUI()
        setupLogin()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        UIApplication.shared.statusBarStyle = .lightContent
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        UIApplication.shared.statusBarStyle = .default
    }
    
    private func setupUI() {
        let backgroundImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height))
        let fligtTabBackgroundImage = UIImage(named: Images.FlightBackground)
        backgroundImageView.image = fligtTabBackgroundImage
        
        view.addSubview(backgroundImageView)
    }
    
    private func setupLogin() {
        let loginButton = UIButton()
        loginButton.setTitle(Labels.Login, for: .normal)
        loginButton.layer.borderWidth = 1
        loginButton.layer.borderColor = UIColor.white.cgColor
        
        view.addSubview(loginButton)
        view.addConstraints(format: "H:[v0(100)]", views: loginButton)
        view.addConstraints(format: "V:[v0(50)]", views: loginButton)
        
        loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        loginButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
}


















