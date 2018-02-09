//
//  ThemeCollectionView.swift
//  Ceair
//
//  Created by Matt Tian on 02/01/2018.
//  Copyright © 2018 Bizersoft. All rights reserved.
//

import UIKit

class ThemeCollectionView: UIView, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    var viewModel: DiscoveryViewModel!
    
    let themes = ["GUJI", "ZIRAN", "ZIJIA", "PAOTANG", "HAIDAO", "DOGNWU", "HUAXUE", "GOUWU",
                  "MINSU", "JIXIAN", "JIGUANG", "HUPO", "SHANGHUA", "QINZI", "WENHUA", "ZONGJIAO",
                  "LENGMEN", "SHANFENG", "JUNMI", "JIEQING", "SAISHI", "SENLING", "MIYUE/QINGLV",
                  "DUZI", "HONGSELVYOU", "MEISHI", "FUMU", "QIXING", "QIANSHUI", "SHEYING", "TUBU",
                  "XINGKONG", "SHAMO", "CAOYUAN", "PIAOLIU"]
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.showsHorizontalScrollIndicator = false
        collection.backgroundColor = UIColor.fromHEX(string: "#F8F8F8")
        collection.dataSource = self
        collection.delegate = self
        return collection
    }()
    
    let cellId = "ThemeCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        collectionView.register(ThemeCollectionCell.self, forCellWithReuseIdentifier: cellId)
        
        addSubview(collectionView)
        addConstraints(format: "H:|-10-[v0]-10-|", views: collectionView)
        addConstraints(format: "V:|-10-[v0]-10-|", views: collectionView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func reloadData() {
        collectionView.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return viewModel.themeCount
        return themes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! ThemeCollectionCell
        cell.backgroundColor = UIColor.fromHEX(string: "#F8F8F8")
        cell.themeLabel.text = themes[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        viewModel.showTheme(at: indexPath.item)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 86, height: 40)
    }
    
    // Horizontal and Vertical spacing between each line
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    
    // Horizontal and Vertical spacing between each item
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
}
