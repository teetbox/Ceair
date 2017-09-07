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

        viewModel.loadFlights {
            self.tableView.reloadData()
        }
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
        
        let historyLabel = UILabel()
        historyLabel.font = UIFont.systemFont(ofSize: 14)
        historyLabel.text = Labels.History
        historyLabel.textColor = UIColor.white
        
        naviBar.addSubview(naviLabel)
        naviBar.addSubview(historyLabel)
        naviBar.addConstraints(format: "V:[v0(20)]-10-|", views: naviLabel)
        naviBar.addConstraints(format: "V:[v0(20)]-10-|", views: historyLabel)
        naviBar.addConstraints(format: "H:[v0]-10-|", views: historyLabel)
        naviLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    private func setupFlightsTable() {
        let frame = CGRect(x: 0, y: 64, width: view.frame.width, height: view.frame.height - 64 - 40)
        tableView = UITableView(frame: frame, style: .grouped)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = UIColor.clear
        tableView.separatorStyle = .none
        
        tableView.register(FlightTabFlightTVCell.self, forCellReuseIdentifier: Identifiers.Cell.TVC)
        
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
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Identifiers.Cell.TVC, for: indexPath) as! FlightTabFlightTVCell
        
        let flight = viewModel.getFlight(at: indexPath.section)
        cell.viewModel = FlightTabFlightTVCellViewModel(flight: flight)
        cell.config()
        
        return cell
    }
    
    // MARK: Delegate
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 40))
        let labelWidth = view.frame.width - (view.frame.width / 2 + 20)
        
        let departureLabel = UILabel()
        departureLabel.font = UIFont.boldSystemFont(ofSize: 18)
        departureLabel.textColor = UIColor.white
        departureLabel.textAlignment = .right
        
        let arrivalLabel = UILabel()
        arrivalLabel.font = UIFont.boldSystemFont(ofSize: 18)
        arrivalLabel.textColor = UIColor.white
        arrivalLabel.textAlignment = .left
        
        let dashLineImageView = UIImageView()
        dashLineImageView.image = UIImage(named: Images.DashLine)
        
        headerView.addSubview(dashLineImageView)
        headerView.addSubview(departureLabel)
        headerView.addSubview(arrivalLabel)
        
        headerView.addConstraints(format: "H:|[v0(\(labelWidth))]-10-[v1(20)]-10-[v2(\(labelWidth))]|", views: departureLabel, dashLineImageView, arrivalLabel)
        headerView.addConstraints(format: "V:|[v0(40)]|", views: departureLabel)
        headerView.addConstraints(format: "V:|[v0(40)]|", views: arrivalLabel)
        dashLineImageView.centerYAnchor.constraint(equalTo: headerView.centerYAnchor).isActive = true
        
        let flight = viewModel.getFlight(at: section)
        let cellViewModel = FlightTabFlightTVCellViewModel(flight: flight)
        departureLabel.text = cellViewModel.departureCity
        arrivalLabel.text = cellViewModel.arrivalCity
        
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 190
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath)
    }
    
}
