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
        addConstraints(format: "V:|[v0(100)]", views: imageView)
        
        addSubview(tagStack)
        addConstraints(format: "H:|-10-[v0]-10-|", views: tagStack)
        addConstraints(format: "V:[v0(40)]|", views: tagStack)
        
        tagStack.addArrangedSubview(firstLabel)
        tagStack.addArrangedSubview(secondLabel)
        tagStack.addArrangedSubview(thirdLabel)
    }
    
}
