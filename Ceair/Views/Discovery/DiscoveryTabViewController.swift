//
//  DiscoveryTabViewController.swift
//  Ceair
//
//  Created by Matt Tian on 02/01/2018.
//  Copyright © 2018 Bizersoft. All rights reserved.
//

import UIKit

class DiscoveryTabViewController: UIViewController {
    
    var viewModel: DiscoveryTabViewModel!
    
    let searchView: UIView = {
        let search = UIView()
        search.backgroundColor = .red
        return search
    }()
    
    let refreshView: UIView = {
        let refresh = UIView()
        refresh.backgroundColor = .lightGray
        return refresh
    }()
    
    let collectionView: DiscoveryCollectionView = {
        let collection = DiscoveryCollectionView()
        return collection
    }()
    
    let themeView: ThemeCollectionView = {
        let theme = ThemeCollectionView()
        return theme
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Discovery"
        view.backgroundColor = UIColor.white
        
        setUpViews()
    }
    
    func setUpViews() {
        view.addSubview(searchView)
        view.addConstraints(format: "H:|[v0]|", views: searchView)
        view.addConstraints(format: "V:|[v0(100)]", views: searchView)
        
        view.addSubview(refreshView)
        view.addConstraints(format: "H:|[v0]|", views: refreshView)
        view.addConstraints(format: "V:[v0(0)]", views: refreshView)
        refreshView.topAnchor.constraint(equalTo: searchView.bottomAnchor).isActive = true
        
        view.addSubview(themeView)
        view.addConstraints(format: "H:|[v0]|", views: themeView)
        view.addConstraints(format: "V:[v0(80)]|", views: themeView)
        
        collectionView.viewModel = viewModel
        view.addSubview(collectionView)
        view.addConstraints(format: "H:|[v0]|", views: collectionView)
        collectionView.topAnchor.constraint(equalTo: refreshView.bottomAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: themeView.topAnchor).isActive = true
    }
    
}
