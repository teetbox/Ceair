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
        search.backgroundColor = UIColor.fromHEX(string: "#273B5E")
        return search
    }()
    
    let areaLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16.0)
        label.text = "From"
        label.textColor = .white
        label.textAlignment = .right
        return label
    }()
    
    let areaTextField: UITextField = {
        let field = UITextField()
        field.backgroundColor = UIColor.fromHEX(string: "#465E7D")
        field.translatesAutoresizingMaskIntoConstraints = false
        return field
    }()
    
    let searchButton: UIButton = {
        let button = UIButton()
        button.setTitle("Search", for: .normal)
        button.layer.cornerRadius = 3
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        button.clipsToBounds = true
        button.backgroundColor = UIColor.fromHEX(string: "#D12E7D")
        return button
    }()
    
    let refreshView: UIView = {
        let refresh = UIView()
        refresh.backgroundColor = .lightGray
        return refresh
    }()
    
    let collectionView: DiscoveryCollectionView = {
        let collection = DiscoveryCollectionView()
        collection.backgroundColor = UIColor.fromHEX(string: "#F8F8F8")
        return collection
    }()
    
    let themeView: ThemeCollectionView = {
        let theme = ThemeCollectionView()
        theme.backgroundColor = UIColor.fromHEX(string: "#F8F8F8")
        return theme
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Discovery"
        navigationController?.isNavigationBarHidden = true
        
        setUpViews()
    }
    
    func setUpViews() {
        view.addSubview(searchView)
        view.addConstraints(format: "H:|[v0]|", views: searchView)
        view.addConstraints(format: "V:|[v0(100)]", views: searchView)
        
        searchView.addSubview(areaLabel)
        searchView.addConstraints(format: "H:|-10-[v0(80)]", views: areaLabel)
        searchView.addConstraints(format: "V:[v0(30)]-10-|", views: areaLabel)

        searchView.addSubview(searchButton)
        searchView.addConstraints(format: "H:[v0(80)]-10-|", views: searchButton)
        searchView.addConstraints(format: "V:[v0(30)]", views: searchButton)
        searchButton.centerYAnchor.constraint(equalTo: areaLabel.centerYAnchor).isActive = true
        
        searchView.addSubview(areaTextField)
        areaTextField.leadingAnchor.constraint(equalTo: areaLabel.trailingAnchor, constant: 10).isActive = true
        areaTextField.trailingAnchor.constraint(equalTo: searchButton.leadingAnchor, constant: -10).isActive = true
        areaTextField.centerYAnchor.constraint(equalTo: areaLabel.centerYAnchor).isActive = true
        
        view.addSubview(refreshView)
        view.addConstraints(format: "H:|[v0]|", views: refreshView)
        view.addConstraints(format: "V:[v0(0)]", views: refreshView)
        refreshView.topAnchor.constraint(equalTo: searchView.bottomAnchor).isActive = true
        
        view.addSubview(themeView)
        view.addConstraints(format: "H:|[v0]|", views: themeView)
        view.addConstraints(format: "V:[v0(91)]|", views: themeView)
        
        collectionView.viewModel = viewModel
        view.addSubview(collectionView)
        view.addConstraints(format: "H:|[v0]|", views: collectionView)
        collectionView.topAnchor.constraint(equalTo: refreshView.bottomAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: themeView.topAnchor).isActive = true
    }
    
}
