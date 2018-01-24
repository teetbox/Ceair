//
//  RouteCollectionView.swift
//  Ceair
//
//  Created by Matt Tian on 24/01/2018.
//  Copyright © 2018 Bizersoft. All rights reserved.
//

import UIKit

class RouteCollectionView: UIView, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    var viewModel: RouteViewModel!
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 0
        layout.scrollDirection = .horizontal
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.showsHorizontalScrollIndicator = false
        collection.backgroundColor = UIColor.fromHEX(string: "#F8F8F8")
        collection.dataSource = self
        collection.delegate = self
        return collection
    }()
    
    let cellId = "MoreThemeCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        collectionView.register(RouteCollectionCell.self, forCellWithReuseIdentifier: cellId)
        
        addSubview(collectionView)
        addConstraints(format: "H:|[v0]|", views: collectionView)
        addConstraints(format: "V:|[v0]|", views: collectionView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! RouteCollectionCell
        cell.viewModel = viewModel
        cell.backgroundColor = .white
        cell.imageView.image = UIColor.random.getImage(size: CGSize(width: 10, height: 10))
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 130, height: 150)
    }
    
}
