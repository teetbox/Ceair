//
//  DestinationViewController.swift
//  Ceair
//
//  Created by Matt Tian on 03/01/2018.
//  Copyright © 2018 Bizersoft. All rights reserved.
//

import UIKit

class DestinationViewController: UIViewController, UITabBarDelegate {
    
    var viewModel: DestinationViewModel!

    let titleView: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        return view
    }()
    
    lazy var backButton: UIButton = {
        let button = UIButton()
        button.setTitle("Back", for: .normal)
        button.addTarget(self, action: #selector(handleBack), for: .touchUpInside)
        return button
    }()
    
    let navView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.blue
        return view
    }()
    
    let navTitle: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.text = "Island"
        label.font = UIFont.systemFont(ofSize: 18.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let subtitle: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.text = "Sunshine Beach"
        label.font = UIFont.boldSystemFont(ofSize: 24.0)
        return label
    }()

    let subtitle2: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.text = "There is an old captain"
        label.font = UIFont.systemFont(ofSize: 20.0)
        return label
    }()
    
    let destinationCollection: DestinationCollectionView = {
        let collection = DestinationCollectionView()
        return collection
    }()

    let themeView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.fromHEX(string: "#F8F8F8")
        return view
    }()
    
    let themeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16.0)
        label.text = "More themes"
        return label
    }()
    
    let themeCollection: MoreThemeCollectionView = {
        let collection = MoreThemeCollectionView()
        return collection
    }()
    
    let barSeparator: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        return view
    }()

    lazy var filterBar: UITabBar = {
        let tabBar = UITabBar()
        let sortItem = UITabBarItem(title: "Sort", image: UIImage(named: "Sort"), tag: 1)
        let filterItem = UITabBarItem(title: "Filter", image: UIImage(named: "Filter"), tag: 2)
        tabBar.tintColor = UIColor.fromHEX(string: COLORS.BarTintColor)
        tabBar.backgroundColor = UIColor.fromHEX(string: "#F8F8F8")
        tabBar.delegate = self
        tabBar.items = [sortItem, filterItem]
        return tabBar
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.fromHEX(string: "#F8F8F8")
        
        navigationItem.title = "Destination"
        navigationController?.isNavigationBarHidden = true
        
        setUpViews()
    }

    private func setUpViews() {
        view.addSubview(navView)
        view.addConstraints(format: "H:|[v0]|", views: navView)
        if DeviceUtility.isPhoneX {
            view.addConstraints(format: "V:|[v0(84)]", views: navView)  // +24
        } else {
            view.addConstraints(format: "V:|[v0(60)]", views: navView)
        }
        
        navView.addSubview(navTitle)
        navView.addConstraints(format: "V:[v0(30)]-10-|", views: navTitle)
        navTitle.centerXAnchor.constraint(equalTo: navView.centerXAnchor).isActive = true
        
        navView.addSubview(backButton)
        navView.addConstraints(format: "H:|-15-[v0]", views: backButton)
        backButton.centerYAnchor.constraint(equalTo: navTitle.centerYAnchor).isActive = true
        
        view.addSubview(titleView)
        view.addConstraints(format: "H:|[v0]|", views: titleView)
        view.addConstraints(format: "V:[v0(100)]", views: titleView)
        titleView.topAnchor.constraint(equalTo: navView.bottomAnchor).isActive = true
        
        titleView.addSubview(subtitle)
        titleView.addSubview(subtitle2)
        titleView.addConstraints(format: "V:|-10-[v0]-10-[v1]", views: subtitle, subtitle2)
        titleView.addConstraints(format: "H:|-40-[v0]", views: subtitle)
        titleView.addConstraints(format: "H:[v0]-40-|", views: subtitle2)

        view.addSubview(filterBar)
        view.addConstraints(format: "H:|[v0]|", views: filterBar)
        view.addConstraints(format: "V:[v0]|", views: filterBar)
        if DeviceUtility.isPhoneX {
            filterBar.heightAnchor.constraint(equalToConstant: 50 + 34).isActive = true // +34
        } else {
            filterBar.heightAnchor.constraint(equalToConstant: 50).isActive = true
        }
        
        view.addSubview(barSeparator)
        view.addConstraints(format: "H:|[v0]|", views: barSeparator)
        view.addConstraints(format: "V:[v0(0.5)]", views: barSeparator)
        barSeparator.topAnchor.constraint(equalTo: filterBar.topAnchor, constant: 0.5).isActive = true

        view.addSubview(themeView)
        view.addConstraints(format: "H:|[v0]|", views: themeView)
        view.addConstraints(format: "V:[v0(160)]", views: themeView)
        themeView.bottomAnchor.constraint(equalTo: filterBar.topAnchor).isActive = true
        
        themeView.addSubview(themeLabel)
        themeView.addConstraints(format: "H:|-10-[v0]", views: themeLabel)
        themeView.addConstraints(format: "V:|-5-[v0]", views: themeLabel)
        
        themeView.addSubview(themeCollection)
        themeView.addConstraints(format: "H:|-10-[v0]-10-|", views: themeCollection)
        themeView.addConstraints(format: "V:[v0(120)]-10-|", views: themeCollection)

        destinationCollection.viewModel = viewModel
        view.addSubview(destinationCollection)
        view.addConstraints(format: "H:|-5-[v0]-5-|", views: destinationCollection)
        view.addConstraints(format: "V:[v0]", views: destinationCollection)
        destinationCollection.topAnchor.constraint(equalTo: titleView.bottomAnchor, constant: 10).isActive = true
        destinationCollection.bottomAnchor.constraint(equalTo: themeView.topAnchor, constant: -10).isActive = true
    }
    
    @objc func handleBack() {
        viewModel.back()
    }
    
    @objc func showFilter() {
        viewModel.showFilter(with: 1)
    }
    
    @objc func showData() {
        viewModel.showFilter(with: 2)
    }
    
    // UITabBar Delegate
    func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        viewModel.showFilter(with: item.tag)
    }
    
    func dismissFilter() {
        filterBar.selectedItem = nil
    }
    
}
