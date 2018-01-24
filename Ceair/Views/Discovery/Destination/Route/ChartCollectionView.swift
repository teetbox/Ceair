//
//  ChartCollectionView.swift
//  Ceair
//
//  Created by Matt Tian on 24/01/2018.
//  Copyright © 2018 Bizersoft. All rights reserved.
//

import UIKit

class ChartCollectionView: UIView, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    let destinationLabel: UILabel = {
        let label = UILabel()
        label.text = "Shanghai - Xi'an"
        label.textColor = UIColor.fromHEX(string: "#3C73C4")
        label.font = UIFont.boldSystemFont(ofSize: 16.0)
        return label
    }()
    
    var minimalLabelBottomConstraint: NSLayoutConstraint?
    
    let minimalLabel: UILabel = {
        let label = UILabel()
        label.text = "- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -"
        label.textColor = .lightGray
        label.lineBreakMode = .byClipping
        label.font = UIFont.boldSystemFont(ofSize: 16.0)
        return label
    }()
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 0
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.showsHorizontalScrollIndicator = false
        collection.bounces = false
        collection.backgroundColor = UIColor.fromHEX(string: "#273B5E")
        collection.dataSource = self
        collection.delegate = self
        return collection
    }()
    
    let cellId = "PriceChartCell"
    
    let blueColors = [UIColor.fromHEX(string: "#4695CD").cgColor, UIColor.fromHEX(string: "#385BBE").cgColor]
    let redColors = [UIColor.fromHEX(string: "#E958C6").cgColor, UIColor.fromHEX(string: "#B42A51").cgColor]
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        collectionView.register(ChartCollectionCell.self, forCellWithReuseIdentifier: cellId)
        
        addSubview(collectionView)
        addConstraints(format: "H:|[v0]|", views: collectionView)
        addConstraints(format: "V:|[v0]|", views: collectionView)
        
        addSubview(destinationLabel)
        addConstraints(format: "H:|-15-[v0]", views: destinationLabel)
        addConstraints(format: "V:|-10-[v0]", views: destinationLabel)
        
        addSubview(minimalLabel)
        addConstraints(format: "H:|-10-[v0]-10-|", views: minimalLabel)
        addConstraints(format: "V:[v0(2)]", views: minimalLabel)
        minimalLabelBottomConstraint = minimalLabel.bottomAnchor.constraint(equalTo: bottomAnchor)
        minimalLabelBottomConstraint?.isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return prices.count
    }
    
    let prices = [100, 200, 123, 78, 98, 230, 167, 150, 90, 87, 110]
    var minPrice: CGFloat {
        return CGFloat(prices.min()!)
    }
    
    var maxPrice: CGFloat {
        return CGFloat(prices.max()!)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! ChartCollectionCell
        
        let maxPrice = CGFloat(prices.max()!)
        let price = CGFloat(prices[indexPath.item])
        let frameHeight = frame.height - 30
        let height = price * frameHeight / maxPrice

        cell.backgroundColor = UIColor.fromHEX(string: "#2D4267")
        cell.colors = blueColors
        cell.heightConstraint?.constant = height
        
        if price == minPrice {
            cell.colors = redColors
            minimalLabelBottomConstraint?.constant = -height
            minimalLabel.layoutIfNeeded()
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 45, height: frame.height)
    }
    
}
