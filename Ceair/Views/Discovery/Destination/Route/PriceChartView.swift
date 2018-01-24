//
//  PriceChartView.swift
//  Ceair
//
//  Created by Matt Tian on 24/01/2018.
//  Copyright © 2018 Bizersoft. All rights reserved.
//

import UIKit

class PriceChartView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
//        collectionView.register(DiscoveryCollectionCell.self, forCellWithReuseIdentifier: cellId)
//
//        addSubview(collectionView)
//        addConstraints(format: "H:|[v0]|", views: collectionView)
//        addConstraints(format: "V:|[v0]|", views: collectionView)
        
        backgroundColor = .brown
        
        setUpViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpViews() {
        
    }
    
}
