//
//  FilterCollectionCell.swift
//  Ceair
//
//  Created by Matt Tian on 04/01/2018.
//  Copyright © 2018 Bizersoft. All rights reserved.
//

import UIKit

class FilterCollectionCell: BaseCVCell {
    
    let themeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .darkGray
        label.textAlignment = .center
        label.text = "Island"
        return label
    }()
    
    override func setUpViews() {
        addSubview(themeLabel)
        
        addConstraints(format: "H:|-2-[v0]-2-|", views: themeLabel)
        addConstraints(format: "V:|-2-[v0]-2-|", views: themeLabel)
        themeLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        themeLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }
    
}
