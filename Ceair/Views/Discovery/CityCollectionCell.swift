//
//  CityCollectionCell.swift
//  Ceair
//
//  Created by Matt Tian on 02/01/2018.
//  Copyright © 2018 Bizersoft. All rights reserved.
//

import UIKit

class CityCollectionCell: BaseCVCell {
    
    var imageUrl: String?
    
    let imageView: UIImageView = {
        let image = UIImageView()
        return image
    }()
    
    let upwardLine: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(white: 1.0, alpha: 0.5)
        return view
    }()
    
    let themeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16.0)
        label.text = "Zoo"
        label.textColor = .white
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let downwardLine: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(white: 1.0, alpha: 0.5)
        return view
    }()
    
    let priceLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14.0)
        label.text = "¥1800"
        label.textColor = .white
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func setUpViews() {
        super.setUpViews()
        
        addSubview(imageView)
        addConstraints(format: "H:|[v0]|", views: imageView)
        addConstraints(format: "V:|[v0]|", views: imageView)
        
        addSubview(upwardLine)
        addConstraints(format: "H:[v0(60)]", views: upwardLine)
        addConstraints(format: "V:|-40-[v0(1)]", views: upwardLine)
        upwardLine.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        addSubview(themeLabel)
        themeLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        themeLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
        addSubview(downwardLine)
        addConstraints(format: "H:[v0(60)]", views: downwardLine)
        addConstraints(format: "V:[v0(1)]-40-|", views: downwardLine)
        downwardLine.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        addSubview(priceLabel)
        priceLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        priceLabel.topAnchor.constraint(equalTo: downwardLine.bottomAnchor, constant: 5).isActive = true
    }
    
}
