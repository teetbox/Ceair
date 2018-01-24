//
//  RouteCollectionCell.swift
//  Ceair
//
//  Created by Matt Tian on 24/01/2018.
//  Copyright © 2018 Bizersoft. All rights reserved.
//

import UIKit

class RouteCollectionCell: BaseCVCell {
    
    var viewModel: RouteViewModel!
    
    let imageView: UIImageView = {
        let image = UIImageView()
        return image
    }()
    
    let destinationLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .white
        label.text = "Shanghai - Xi'an"
        label.font = UIFont.systemFont(ofSize: 14.0)
        return label
    }()
    
    let priceLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .white
        label.text = "¥1800"
        label.font = UIFont.boldSystemFont(ofSize: 16.0)
        return label
    }()
    
    let distanceLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .darkGray
        label.text = "800km from Bali"
        label.font = UIFont.systemFont(ofSize: 14.0)
        return label
    }()
    
    override func setUpViews() {
        addSubview(imageView)
        addConstraints(format: "H:|[v0]|", views: imageView)
        addConstraints(format: "V:|[v0(120)]", views: imageView)
        
        imageView.addSubview(destinationLabel)
        imageView.addSubview(priceLabel)
        imageView.addConstraints(format: "H:|[v0]|", views: destinationLabel)
        imageView.addConstraints(format: "H:|[v0]|", views: priceLabel)
        imageView.addConstraints(format: "V:|-30-[v0(30)][v1(30)]-30-|", views: destinationLabel, priceLabel)
        
        addSubview(distanceLabel)
        addConstraints(format: "V:[v0(30)]|", views: distanceLabel)
        distanceLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
    }
    
}
