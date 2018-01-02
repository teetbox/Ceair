//
//  DiscoveryCollectionCell.swift
//  Ceair
//
//  Created by Matt Tian on 02/01/2018.
//  Copyright © 2018 Bizersoft. All rights reserved.
//

import UIKit

class DiscoveryCollectionCell: BaseCVCell {
    
    let titleView: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        return view
    }()
    
    let contentLabel: UILabel = {
        let label = UILabel()
        label.text = "Content"
        return label
    }()
    
    let moreLabel: UILabel = {
        let label = UILabel()
        label.text = "More"
        return label
    }()
    
    let collectionView: DiscoverySubCollectionView = {
        let collection = DiscoverySubCollectionView()
        return collection
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "Sun raise, sunset ..."
        return label
    }()
    
    override func setUpViews() {
        super.setUpViews()
        
        addSubview(titleView)
        addConstraints(format: "H:|[v0]|", views: titleView)
        addConstraints(format: "V:|[v0(40)]", views: titleView)
        
        titleView.addSubview(contentLabel)
        titleView.addSubview(moreLabel)
        titleView.addConstraints(format: "H:|-10-[v0]", views: contentLabel)
        titleView.addConstraints(format: "H:[v0]-10-|", views: moreLabel)
        titleView.addConstraints(format: "V:|-10-[v0]", views: contentLabel)
        titleView.addConstraints(format: "V:|-10-[v0]", views: moreLabel)
        
        addSubview(collectionView)
        addConstraints(format: "H:|[v0]|", views: collectionView)
        addConstraints(format: "V:|-40-[v0(120)]-40-|", views: collectionView)
        
        addSubview(descriptionLabel)
        addConstraints(format: "H:|-10-[v0]|", views: descriptionLabel)
        addConstraints(format: "V:[v0(40)]|", views: descriptionLabel)
    }
    
}
