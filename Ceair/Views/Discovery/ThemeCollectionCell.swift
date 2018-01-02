//
//  ThemeCollectionCell.swift
//  Ceair
//
//  Created by Matt Tian on 02/01/2018.
//  Copyright © 2018 Bizersoft. All rights reserved.
//

import UIKit

class ThemeCollectionCell: BaseCVCell {
    
    let themeLabel: UILabel = {
        let label = UILabel()
        label.text = "Theme"
        label.textAlignment = .center
        return label
    }()
    
    override func setUpViews() {
        addSubview(themeLabel)
        
        addConstraints(format: "H:|[v0]|", views: themeLabel)
        addConstraints(format: "V:|[v0]|", views: themeLabel)
        themeLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        themeLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }
    
}
