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
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    let dimView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(white: 0.1, alpha: 0.1)
        return view
    }()
    
    let upwardLine: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    let themeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20.0)
        label.text = "Zoo"
        label.textColor = .white
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let downwardLine: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    let priceLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20.0)
        label.text = "¥1800"
        label.textColor = .white
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let tagView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(white: 0.1, alpha: 0.6)
        return view
    }()
    
    var tagStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 10
        stack.alignment = .center
        stack.distribution = .fillProportionally
        return stack
    }()
    
    let firstLabel: UILabel = {
        let label = UILabel()
        label.layer.borderWidth = 0.5
        label.layer.borderColor = UIColor.white.cgColor
        label.layer.cornerRadius = 3
        label.clipsToBounds = true
        label.textAlignment = .center
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 14.0)
        return label
    }()
    
    let secondLabel: UILabel = {
        let label = UILabel()
        label.layer.borderWidth = 0.5
        label.layer.borderColor = UIColor.white.cgColor
        label.layer.cornerRadius = 3
        label.clipsToBounds = true
        label.textAlignment = .center
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 14.0)
        return label
    }()
    
    let thirdLabel: UILabel = {
        let label = UILabel()
        label.layer.borderWidth = 0.5
        label.layer.borderColor = UIColor.white.cgColor
        label.layer.cornerRadius = 3
        label.clipsToBounds = true
        label.textAlignment = .center
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 14.0)
        return label
    }()
    
    override func setUpViews() {
        super.setUpViews()
        
        addSubview(imageView)
        addConstraints(format: "H:|[v0]|", views: imageView)
        addConstraints(format: "V:|[v0]|", views: imageView)
        
        addSubview(dimView)
        addConstraints(format: "H:|[v0]|", views: dimView)
        addConstraints(format: "V:|[v0]|", views: dimView)
        
        addSubview(upwardLine)
        addConstraints(format: "H:[v0(80)]", views: upwardLine)
        addConstraints(format: "V:|-42-[v0(1)]", views: upwardLine)
        upwardLine.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        addSubview(themeLabel)
        addConstraints(format: "V:|-50-[v0(30)]", views: themeLabel)
        themeLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        addSubview(downwardLine)
        addConstraints(format: "H:[v0(80)]", views: downwardLine)
        addConstraints(format: "V:|-88-[v0(1)]", views: downwardLine)
        downwardLine.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true

        addSubview(priceLabel)
        priceLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        priceLabel.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 20).isActive = true
        
        addSubview(tagView)
        addConstraints(format: "H:|[v0]|", views: tagView)
        addConstraints(format: "V:[v0(40)]|", views: tagView)
        
        tagView.addSubview(tagStack)
        tagView.addConstraints(format: "H:|-10-[v0]-5-|", views: tagStack)
        tagView.addConstraints(format: "V:|[v0]|", views: tagStack)
        
        tagStack.addArrangedSubview(firstLabel)
        tagStack.addArrangedSubview(secondLabel)
        tagStack.addArrangedSubview(thirdLabel)
    }
    
}
