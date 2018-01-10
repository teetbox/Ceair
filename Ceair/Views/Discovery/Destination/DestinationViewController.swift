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

    let collectionView: UIView = {
        let view = UIView()
        view.backgroundColor = .green
        return view
    }()

    let themeView: UIView = {
        let view = UIView()
        view.backgroundColor = .brown
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
        
        view.backgroundColor = .white
        
        navigationItem.title = "Destination"
        navigationController?.isNavigationBarHidden = true
        
        setUpViews()
    }

    private func setUpViews() {
        view.addSubview(titleView)
        view.addConstraints(format: "H:|[v0]|", views: titleView)
        view.addConstraints(format: "V:|[v0(100)]", views: titleView)
        
        titleView.addSubview(backButton)
        titleView.addConstraints(format: "H:|-15-[v0]", views: backButton)
        titleView.addConstraints(format: "V:|-30-[v0]", views: backButton)

        view.addSubview(filterBar)
        view.addConstraints(format: "H:|[v0]|", views: filterBar)
        view.addConstraints(format: "V:[v0(50)]|", views: filterBar)

        view.addSubview(themeView)
        view.addConstraints(format: "H:|[v0]|", views: themeView)
        view.addConstraints(format: "V:[v0(140)]", views: themeView)
        themeView.bottomAnchor.constraint(equalTo: filterBar.topAnchor).isActive = true

        view.addSubview(collectionView)
        view.addConstraints(format: "H:|[v0]|", views: collectionView)
        view.addConstraints(format: "V:[v0]", views: collectionView)
        collectionView.topAnchor.constraint(equalTo: titleView.bottomAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: themeView.topAnchor).isActive = true
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
