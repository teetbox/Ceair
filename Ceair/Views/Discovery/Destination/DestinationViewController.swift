//
//  DestinationViewController.swift
//  Ceair
//
//  Created by Matt Tian on 03/01/2018.
//  Copyright © 2018 Bizersoft. All rights reserved.
//

import UIKit

class DestinationViewController: UIViewController {
    
    // TODO: - Using its own viewModel. Do not share with parent's viewModel
    var viewModel: DestinationViewModel!
    
    deinit {
        print("Deinit Destination View Controller")
    }
    
    let titleView: UIView = {
        let view = UIView()
        view.backgroundColor = .blue
        return view
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
    
    let filterBar: UIView = {
        let view = UIView()
        view.backgroundColor = .orange
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        navigationItem.title = "Destination"
        navigationController?.isNavigationBarHidden = false
        
        setUpViews()
    }
    
    private func setUpViews() {
        view.addSubview(titleView)
        view.addConstraints(format: "H:|[v0]|", views: titleView)
        view.addConstraints(format: "V:|[v0(100)]", views: titleView)
        
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
        
        let sortButton = UIButton()
        sortButton.setTitle("Sort", for: .normal)
        sortButton.backgroundColor = .magenta
        sortButton.addTarget(self, action: #selector(showFilter), for: .touchUpInside)
        
        let filterButton = UIButton()
        filterButton.setTitle("Filter", for: .normal)
        filterButton.backgroundColor = .cyan
        filterButton.addTarget(self, action: #selector(showData), for: .touchUpInside)
        
        filterBar.addSubview(sortButton)
        filterBar.addSubview(filterButton)
        let buttonWidth = view.frame.width / 2
        filterBar.addConstraints(format: "H:|[v0(\(buttonWidth))][v1(\(buttonWidth))]|", views: sortButton, filterButton)
        filterBar.addConstraints(format: "V:|[v0]|", views: sortButton)
        filterBar.addConstraints(format: "V:|[v0]|", views: filterButton)
    }
    
    @objc func showFilter() {
        viewModel.showFilter()
    }
    
    @objc func showData() {
        print(#function)
    }
    
}
