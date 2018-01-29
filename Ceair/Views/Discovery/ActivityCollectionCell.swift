//
//  ActivityCollectionCell.swift
//  Ceair
//
//  Created by Matt Tian on 02/01/2018.
//  Copyright © 2018 Bizersoft. All rights reserved.
//

import UIKit

class ActivityCollectionCell: BaseCVCell {
    
    var viewModel: DiscoveryViewModel! {
        didSet {
            collectionView.viewModel = viewModel
        }
    }
    
    var activityIndex: Int! {
        didSet {
            collectionView.activityIndex = activityIndex
        }
    }
    
    let titleView: UIView = {
        let view = UIView()
        return view
    }()
    
    let contentLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14.0)
        label.text = "Content"
        return label
    }()
    
    let moreLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14.0)
        label.text = "MORE>>"
        label.textColor = .lightGray
        return label
    }()
    
    let collectionView: CityCollectionView = {
        let collection = CityCollectionView()
        collection.backgroundColor = UIColor.fromHEX(string: "#F8F8F8")
        return collection
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14.0)
        label.text = "Sun raise, sunset ..."
        label.textColor = .lightGray
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
