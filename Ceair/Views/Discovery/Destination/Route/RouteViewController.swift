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
        view.backgroundColor = .white
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
    
    let chartView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    let infoIcon: UIImageView = {
        let imageView = UIImageView(image: #imageLiteral(resourceName: "My"))
        return imageView
    }()
    
    let infoLabel: UILabel = {
        let label = UILabel()
        label.textColor = .darkGray
        label.text = "Price may fluctuate"
        label.font = UIFont.systemFont(ofSize: 16.0)
        return label
    }()
    
    let routeView: UIView = {
        let view = UIView()
        return view
    }()
    
    let priceChart: PriceChartView = {
        let chart = PriceChartView()
        return chart
    }()
    
    let routeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16.0)
        label.text = "Routes Recommendation"
        return label
    }()
    
    let routeCollection: RouteCollectionView = {
        let collection = RouteCollectionView()
        return collection
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.fromHEX(string: "#F8F8F8")
        
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
        
        view.addSubview(routeView)
        view.addConstraints(format: "H:|[v0]|", views: routeView)
        view.addConstraints(format: "V:[v0(360)]|", views: routeView)
        
        routeView.addSubview(routeLabel)
        routeView.addConstraints(format: "H:|-15-[v0]|", views: routeLabel)
        routeView.addConstraints(format: "V:|-5-[v0(35)]", views: routeLabel)
        
        routeView.addSubview(routeCollection)
        routeView.addConstraints(format: "H:|-10-[v0]-10-|", views: routeCollection)
        routeView.addConstraints(format: "V:|-40-[v0]-10-|", views: routeCollection)
        
        view.addSubview(chartView)
        view.addConstraints(format: "H:|[v0]|", views: chartView)
        chartView.topAnchor.constraint(equalTo: navView.bottomAnchor).isActive = true
        chartView.bottomAnchor.constraint(equalTo: routeView.topAnchor).isActive = true
        
        chartView.addSubview(priceChart)
        chartView.addConstraints(format: "H:|[v0]|", views: priceChart)
        chartView.addConstraints(format: "V:|[v0]-35-|", views: priceChart)
        
        chartView.addSubview(infoIcon)
        chartView.addSubview(infoLabel)
        chartView.addConstraints(format: "H:|-15-[v0(15)]-5-[v1]|", views: infoIcon, infoLabel)
        chartView.addConstraints(format: "V:[v0(15)]-10-|", views: infoIcon)
        infoLabel.centerYAnchor.constraint(equalTo: infoIcon.centerYAnchor).isActive = true
    }
    
    @objc func handleBack() {
        viewModel.back()
    }
    
}
