//
//  DestinationCollectionCell.swift
//  Ceair
//
//  Created by Matt Tian on 10/01/2018.
//  Copyright © 2018 Bizersoft. All rights reserved.
//

import UIKit

class DestinationCollectionCell: BaseCVCell {
    
    var viewModel: DestinationViewModel!
    
    let imageView: UIImageView = {
        let image = UIImageView()
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
    
    let cityLabel: UILabel = {
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
        label.layer.borderColor = UIColor.lightGray.cgColor
        label.layer.cornerRadius = 3
        label.clipsToBounds = true
        label.textAlignment = .center
        label.text = "ABC"
        return label
    }()
    
    let secondLabel: UILabel = {
        let label = UILabel()
        label.layer.borderWidth = 0.5
        label.layer.borderColor = UIColor.lightGray.cgColor
        label.layer.cornerRadius = 3
        label.clipsToBounds = true
        label.textAlignment = .center
        label.text = "D"
        return label
    }()
    
    let thirdLabel: UILabel = {
        let label = UILabel()
        label.layer.borderWidth = 0.5
        label.layer.borderColor = UIColor.lightGray.cgColor
        label.layer.cornerRadius = 3
        label.clipsToBounds = true
        label.textAlignment = .center
        label.text = "EF"
        return label
    }()
    
    override func setUpViews() {
        addSubview(imageView)
        addConstraints(format: "H:|[v0]|", views: imageView)
        addConstraints(format: "V:|[v0]-40-|", views: imageView)
        
        addSubview(dimView)
        addConstraints(format: "H:|[v0]|", views: dimView)
        addConstraints(format: "V:|[v0]-40-|", views: dimView)
        
        imageView.addSubview(cityLabel)
        imageView.addConstraints(format: "V:[v0(30)]", views: cityLabel)
        cityLabel.centerXAnchor.constraint(equalTo: imageView.centerXAnchor).isActive = true
        cityLabel.centerYAnchor.constraint(equalTo: imageView.centerYAnchor, constant: -10).isActive = true
        
        imageView.addSubview(upwardLine)
        imageView.addConstraints(format: "H:[v0(80)]", views: upwardLine)
        imageView.addConstraints(format: "V:[v0(1)]", views: upwardLine)
        upwardLine.centerXAnchor.constraint(equalTo: imageView.centerXAnchor).isActive = true
        upwardLine.centerYAnchor.constraint(equalTo: cityLabel.centerYAnchor, constant: -20).isActive = true
        
        imageView.addSubview(downwardLine)
        imageView.addConstraints(format: "H:[v0(80)]", views: downwardLine)
        imageView.addConstraints(format: "V:[v0(1)]", views: downwardLine)
        downwardLine.centerXAnchor.constraint(equalTo: imageView.centerXAnchor).isActive = true
        downwardLine.centerYAnchor.constraint(equalTo: imageView.centerYAnchor, constant: 10).isActive = true
        
        imageView.addSubview(priceLabel)
        priceLabel.centerXAnchor.constraint(equalTo: imageView.centerXAnchor).isActive = true
        priceLabel.centerYAnchor.constraint(equalTo: downwardLine.centerYAnchor, constant: 20).isActive = true
        
        addSubview(tagStack)
        addConstraints(format: "H:|-10-[v0]-10-|", views: tagStack)
        addConstraints(format: "V:[v0(40)]|", views: tagStack)
        
        tagStack.addArrangedSubview(firstLabel)
        tagStack.addArrangedSubview(secondLabel)
        tagStack.addArrangedSubview(thirdLabel)
    }
    
}
