//
//  CartoonSearchView.swift
//  Ceair
//
//  Created by Matt Tian on 06/02/2018.
//  Copyright © 2018 Bizersoft. All rights reserved.
//

import UIKit

class CartoonSearchView: UIView {
    
    let backgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(white: 0.5, alpha: 0.5)
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
    }
    
    private func setupViews() {
        addSubview(backgroundView)
        addConstraints(format: "H:|[v0]|", views: backgroundView)
        addConstraints(format: "V:|[v0]|", views: backgroundView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
