//
//  MoreThemeCollectionView.swift
//  Ceair
//
//  Created by Matt Tian on 10/01/2018.
//  Copyright © 2018 Bizersoft. All rights reserved.
//

import UIKit

class MoreThemeCollectionView: UIView, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    var viewModel: DestinationViewModel!
    
    let themes = ["GUJI", "ZIRAN", "ZIJIA", "PAOTANG", "HAIDAO", "DOGNWU", "HUAXUE", "GOUWU",
                  "MINSU", "JIXIAN", "JIGUANG", "HUPO", "SHANGHUA", "QINZI", "WENHUA", "ZONGJIAO",
                  "LENGMEN", "SHANFENG", "JUNMI", "JIEQING", "SAISHI", "SENLING", "MIYUE",
                  "DUZI", "HONGSELVYOU", "MEISHI", "FUMU", "QIXING", "QIANSHUI", "SHEYING", "TUBU",
                  "XINGKONG", "SHAMO", "CAOYUAN", "PIAOLIU"]
    // "QIANSHUI", "SHASHI", "ZONGJIAO", "WENHUA", "HAIDAO", "PAOTANG"
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 0
        layout.scrollDirection = .horizontal
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.showsHorizontalScrollIndicator = false
        collection.backgroundColor = .white
        collection.dataSource = self
        collection.delegate = self
        return collection
    }()
    
    let cellId = "MoreThemeCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        collectionView.register(MoreThemeCollectionCell.self, forCellWithReuseIdentifier: cellId)
        
        addSubview(collectionView)
        addConstraints(format: "H:|[v0]|", views: collectionView)
        addConstraints(format: "V:|[v0]|", views: collectionView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return themes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! MoreThemeCollectionCell
        cell.viewModel = viewModel
        cell.backgroundColor = .white
        cell.imageView.image = UIImage(named: themes[indexPath.item]) ?? #imageLiteral(resourceName: "STAR")
        cell.themeLabel.text = themes[indexPath.item]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 140, height: 120)
    }

}
