//
//  CityCollectionView.swift
//  Ceair
//
//  Created by Matt Tian on 02/01/2018.
//  Copyright © 2018 Bizersoft. All rights reserved.
//

import UIKit

class CityCollectionView: UIView, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    var viewModel: DiscoveryViewModel!
    var themeIndex: Int!
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.showsHorizontalScrollIndicator = false
        collection.backgroundColor = .white
        collection.dataSource = self
        collection.delegate = self
        return collection
    }()
    
    let cellId = "DiscoverySubCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        collectionView.register(CityCollectionCell.self, forCellWithReuseIdentifier: cellId)
        
        addSubview(collectionView)
        addConstraints(format: "H:|[v0]|", views: collectionView)
        addConstraints(format: "V:|[v0]|", views: collectionView)
        
        accessibilityLabel = DISPLAY.Discovery.CityView
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func reloadData() {
        collectionView.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return themeIndex != nil ? viewModel.cities(forTheme: themeIndex!).count : 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! CityCollectionCell
        let city = viewModel.city(at: indexPath, forTheme: themeIndex!)
        cell.backgroundColor = UIColor.random
        cell.themeLabel.text = city.cityName
        cell.priceLabel.text = "$\(city.price)"
        cell.imageUrl = city.imageUrl
        cell.firstLabel.text = city.firstTag
        cell.secondLabel.text = city.secondTag
        cell.thirdLabel.text = city.thirdTag
        
        viewModel.loadImage(from: city.imageUrl) { (imageUrl, imageData) in
            if cell.imageUrl == imageUrl {
                cell.imageView.image = UIImage(data: imageData)
            }
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        viewModel.showRoute(at: indexPath.item)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 187, height: 187)
    }
    
}
