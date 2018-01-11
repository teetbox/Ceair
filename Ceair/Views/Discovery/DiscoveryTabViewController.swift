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
    
    let navTitle: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18.0)
        label.textAlignment = .center
        label.textColor = .white
        label.text = "Island"
        return label
    }()
    
    let searchStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 10
        stack.alignment = .center
        stack.distribution = .fillProportionally
        return stack
    }()
    
    let areaLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16.0)
        label.text = "From"
        label.textColor = .white
        label.textAlignment = .right
        label.clipsToBounds = true
        return label
    }()
    
    let areaTextField: UITextField = {
        let textField = UITextField()
        textField.layer.borderWidth = 0.5
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.backgroundColor = UIColor.fromHEX(string: "#465E7D")
        textField.textColor = .white
        // Cursor color
        textField.tintColor = .white
        textField.font = UIFont.systemFont(ofSize: 16.0)
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 7, height: 30))
        textField.leftViewMode = .always
        return textField
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
        
        navigationController?.isNavigationBarHidden = true
        
        setUpViews()
    }
    
    func setUpViews() {
        view.addSubview(searchView)
        view.addConstraints(format: "H:|[v0]|", views: searchView)
        view.addConstraints(format: "V:|[v0(120)]", views: searchView)
        
        searchView.addSubview(navTitle)
        searchView.addConstraints(format: "V:|-30-[v0]", views: navTitle)
        navTitle.centerXAnchor.constraint(equalTo: searchView.centerXAnchor).isActive = true
        
        searchView.addSubview(areaLabel)
        searchView.addConstraints(format: "H:|[v0(70)]", views: areaLabel)
        searchView.addConstraints(format: "V:[v0(30)]-10-|", views: areaLabel)

        searchView.addSubview(searchButton)
        searchView.addConstraints(format: "H:[v0(60)]-10-|", views: searchButton)
        searchView.addConstraints(format: "V:[v0(30)]-10-|", views: searchButton)

        searchView.addSubview(areaTextField)
        searchView.addConstraints(format: "H:|-80-[v0]-80-|", views: areaTextField)
        searchView.addConstraints(format: "V:[v0(30)]-10-|", views: areaTextField)
        
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
