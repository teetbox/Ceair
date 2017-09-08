//
//  BookingTabViewController.swift
//  Ceair
//
//  Created by Tong Tian on 8/29/17.
//  Copyright © 2017 Bizersoft. All rights reserved.
//

import UIKit


class BookingTabViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = TabBars.Booking
        view.backgroundColor = UIColor.white
        
        setupViews()
    }
    
    private func setupViews() {
        let loginButton = UIButton()
        loginButton.layer.borderWidth = 0.5
        loginButton.layer.borderColor = UIColor.fromHEX(string: "#1D3C5F").cgColor
        loginButton.setTitle(Labels.Login, for: .normal)
        loginButton.setTitleColor(UIColor.fromHEX(string: "#1D3C5F"), for: .normal)
        loginButton.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        loginButton.addTarget(self, action: #selector(loginTapped), for: .touchUpInside)
        
        view.addSubview(loginButton)
        
        view.addConstraints(format: "H:[v0(120)]", views: loginButton)
        view.addConstraints(format: "V:[v0(40)]", views: loginButton)
        loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        loginButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
    @objc func loginTapped() {
        print(#function)
    }

}
