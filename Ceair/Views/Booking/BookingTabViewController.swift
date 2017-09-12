//
//  BookingTabViewController.swift
//  Ceair
//
//  Created by Tong Tian on 8/29/17.
//  Copyright © 2017 Bizersoft. All rights reserved.
//

import UIKit
import Alamofire

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
        
        let aintxButton = UIButton()
        aintxButton.layer.borderWidth = 0.5
        aintxButton.layer.borderColor = UIColor.fromHEX(string: "#008080").cgColor
        aintxButton.setTitle(Labels.Aintx, for: .normal)
        aintxButton.setTitleColor(UIColor.fromHEX(string: "#008080"), for: .normal)
        aintxButton.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        aintxButton.addTarget(self, action: #selector(goAintx), for: .touchUpInside)
        
        view.addSubview(loginButton)
        view.addSubview(aintxButton)
        
        view.addConstraints(format: "H:[v0(120)]", views: loginButton)
        view.addConstraints(format: "V:[v0(40)]-40-[v1(40)]", views: loginButton, aintxButton)
        loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        loginButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        view.addConstraints(format: "H:[v0(120)]", views: aintxButton)
        aintxButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    @objc func loginTapped() {
        let url = URL(string: URLs.Host + URLs.Login)!
        let params = ["loginType": "0", "password": "00313131", "username": "660265538998", "verifyCode": ""]
        Alamofire.request(url, parameters: params).responseJSON { (jsonData) in
            print(jsonData)
        }
    }
    
    @objc func goAintx() {
        let params = ["loginType": "0", "password": "00313131", "username": "660265538998", "verifyCode": ""]
        
        Aintx.shared.request(endPoint: URLs.Login, parameters: params) { (response) in
            if let error = response.error {
                print(error.localizedDescription)
                return
            }
            
            if let data = response.data, let user = try? JSONDecoder().decode(User.self, from: data) {
                UserConfig.shared.update(user: user)
            }
        }
    }

}
