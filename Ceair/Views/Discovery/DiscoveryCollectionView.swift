//
//  DiscoveryCollectionView.swift
//  Ceair
//
//  Created by Matt Tian on 02/01/2018.
//  Copyright © 2018 Bizersoft. All rights reserved.
//

import UIKit

protocol ScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView)
}

class DiscoveryCollectionView: UIView, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    var viewModel: DiscoveryTabViewModel!
    
    var scrollDelegate: ScrollViewDelegate?
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.showsVerticalScrollIndicator = false
        collection.backgroundColor = UIColor.fromHEX(string: "#F8F8F8")
        collection.dataSource = self
        collection.delegate = self
        return collection
    }()
    
    let cellId = "DiscoveryCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        collectionView.register(DiscoveryCollectionCell.self, forCellWithReuseIdentifier: cellId)
        
        addSubview(collectionView)
        addConstraints(format: "H:|[v0]|", views: collectionView)
        addConstraints(format: "V:|[v0]|", views: collectionView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! DiscoveryCollectionCell
        cell.viewModel = viewModel
        cell.backgroundColor = .white
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: frame.width, height: 200)
    }
    
    // Maybe this is for section spacing
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    // Horizontal and Vertical spacing between each item
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        scrollDelegate?.scrollViewDidScroll(scrollView)
    }
    
}
