//
//  FlightTabViewController.swift
//  Ceair
//
//  Created by Tong Tian on 8/30/17.
//  Copyright © 2017 Bizersoft. All rights reserved.
//

import UIKit

class FlightTabViewController: UIViewController {
    
    var viewModel: FlightTabViewModel!
    
    var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.isNavigationBarHidden = true
        
        setupUI()
//        setupLogin()
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
        
        setupNaviBar()
        setupFlightsTable()
    }
    
    private func setupNaviBar() {
        let naviBar = UIView()
        view.addSubview(naviBar)

        view.addConstraints(format: "H:|[v0]|", views: naviBar)
        view.addConstraints(format: "V:|[v0(64)]", views: naviBar)
        
        let naviLabel = UILabel()
        naviLabel.font = UIFont.boldSystemFont(ofSize: 18)
        naviLabel.text = Labels.MyFlights
        naviLabel.textColor = UIColor.white
        
        naviBar.addSubview(naviLabel)
        naviBar.addConstraints(format: "V:[v0(20)]-10-|", views: naviLabel)
        naviLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    private func setupFlightsTable() {
        tableView = UITableView()
        tableView.frame = CGRect(x: 0, y: 64, width: view.frame.width, height: view.frame.height - 64 - 40)
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.register(FlightTabFlightTVC.self, forCellReuseIdentifier: Identifiers.Cell.TVC)
        
        view.addSubview(tableView)
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

// MARK: - TableView DataSource & Delegate

extension FlightTabViewController: UITableViewDataSource, UITableViewDelegate {
    
    // MARK: DataSource
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Identifiers.Cell.TVC, for: indexPath) as! FlightTabFlightTVC
        cell.backgroundColor = UIColor.red
        return cell
    }
    
    // MARK: Delegate
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return nil
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 10
    }
    
}
















