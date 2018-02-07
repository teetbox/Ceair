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
    
    var themeIndex: Int! {
        didSet {
            collectionView.themeIndex = themeIndex
        }
    }
    
    let titleView: UIView = {
        let view = UIView()
        return view
    }()
    
    let contentIcon: UIImageView = {
        let image = UIImageView(image: #imageLiteral(resourceName: "Triangle"))
        image.tintColor = .darkGray
        return image
    }()
    
    let contentLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18.0)
        label.textAlignment = .left
        label.textColor = .darkGray
        label.text = "Content"
        return label
    }()
    
    let moreLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16.0)
        label.textAlignment = .right
        label.textColor = .lightGray
        label.text = "MORE>>"
        return label
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16.0)
        label.text = "Sun raise, sunset ..."
        label.textColor = .lightGray
        label.textAlignment = .left
        return label
    }()
    
    let collectionView: CityCollectionView = {
        let collection = CityCollectionView()
        collection.backgroundColor = UIColor.fromHEX(string: "#F8F8F8")
        return collection
    }()
    
    override func setUpViews() {
        super.setUpViews()
        
        addSubview(titleView)
        addConstraints(format: "H:|[v0]|", views: titleView)
        addConstraints(format: "V:|[v0(40)]", views: titleView)
        
        titleView.addSubview(contentIcon)
        titleView.addSubview(contentLabel)
        titleView.addSubview(descriptionLabel)
        titleView.addSubview(moreLabel)
        titleView.addConstraints(format: "H:|-5-[v0(20)]-5-[v1(80)]-5-[v2]-10-[v3(80)]-10-|", views: contentIcon, contentLabel, descriptionLabel, moreLabel)
        titleView.addConstraints(format: "V:|-12-[v0(16)]", views: contentIcon)
        titleView.addConstraints(format: "V:[v0(40)]", views: contentLabel)
        titleView.addConstraints(format: "V:[v0(40)]", views: descriptionLabel)
        titleView.addConstraints(format: "V:[v0(40)]", views: moreLabel)
        contentLabel.centerYAnchor.constraint(equalTo: contentIcon.centerYAnchor).isActive = true
        descriptionLabel.centerYAnchor.constraint(equalTo: contentIcon.centerYAnchor).isActive = true
        moreLabel.centerYAnchor.constraint(equalTo: contentIcon.centerYAnchor).isActive = true

        addSubview(collectionView)
        addConstraints(format: "H:|[v0]|", views: collectionView)
        addConstraints(format: "V:|-40-[v0(187)]-10-|", views: collectionView)
    }
    
}
