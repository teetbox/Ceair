//
//  DestinationFilterView.swift
//  Ceair
//
//  Created by Matt Tian on 03/01/2018.
//  Copyright © 2018 Bizersoft. All rights reserved.
//

import UIKit

class DestinationFilterView: UIView {
    
    var viewModel: DestinationFilterViewModel!
    
    let blackView: UIView = {
        let view = UIView()
        return view
    }()
    
    let filterView: UIView = {
        let view = UIView()
        view.backgroundColor = .green
        return view
    }()
    
    let titleBar: UIView = {
        let view = UIView()
        view.backgroundColor = .blue
        return view
    }()
    
    let menuView: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        return view
    }()
    
    lazy var areaButton:  UIButton = {
        let button = UIButton()
        button.tag = 1
        button.setTitle("Area", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .white
        button.addTarget(self, action: #selector(handleMenuButton), for: .touchUpInside)
        return button
    }()
    
    lazy var dateButton:  UIButton = {
        let button = UIButton()
        button.tag = 2
        button.setTitle("Date", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .darkGray
        button.addTarget(self, action: #selector(handleMenuButton), for: .touchUpInside)
        return button
    }()
    
    let collectionView: FilterCollectionView = {
        let collection = FilterCollectionView()
        return collection
    }()
    
    let filterBar: UIView = {
        let view = UIView()
        view.backgroundColor = .orange
        return view
    }()
    
    func show(_ window: UIWindow) {
        blackView.backgroundColor = UIColor(white: 1, alpha: 0.8)
        blackView.frame = window.frame
        blackView.alpha = 0.5
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleDismiss))
        blackView.addGestureRecognizer(tapGesture)
        
        window.addSubview(blackView)
        
        setUpViews(window)
    }
    
    private func setUpViews(_ window: UIView) {
        filterView.frame = CGRect(x: 0, y: window.frame.height, width: window.frame.width, height: 200)
        window.addSubview(filterView)
        
        filterView.addSubview(titleBar)
        filterView.addConstraints(format: "H:|[v0]|", views: titleBar)
        filterView.addConstraints(format: "V:|[v0(40)]", views: titleBar)
        
        filterView.addSubview(menuView)
        filterView.addConstraints(format: "H:|[v0(100)]", views: menuView)
        filterView.addConstraints(format: "V:[v0]-50-|", views: menuView)
        menuView.topAnchor.constraint(equalTo: titleBar.bottomAnchor).isActive = true
        
        filterView.addSubview(filterBar)
        filterView.addConstraints(format: "H:|[v0]|", views: filterBar)
        filterView.addConstraints(format: "V:[v0(50)]|", views: filterBar)
        
        menuView.addSubview(areaButton)
        menuView.addSubview(dateButton)
        menuView.addConstraints(format: "H:|[v0(100)]", views: areaButton)
        menuView.addConstraints(format: "H:|[v0(100)]", views: dateButton)
        menuView.addConstraints(format: "V:|[v0(40)][v1(40)]", views: areaButton, dateButton)
        
        filterView.addSubview(collectionView)
        filterView.addConstraints(format: "H:|-100-[v0]|", views: collectionView)
        collectionView.topAnchor.constraint(equalTo: titleBar.bottomAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: filterBar.topAnchor).isActive = true
        
        
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            self.blackView.alpha = 1
            self.filterView.frame = CGRect(x: 0, y: window.frame.height - 200, width: window.frame.width, height: 200)
        }, completion: nil)
    }
    
    @objc func handleDismiss() {
        print(#function)
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            self.blackView.alpha = 0
            if let window = UIApplication.shared.keyWindow {
                self.filterView.frame = CGRect(x: 0, y: window.frame.height, width: window.frame.width, height: 200)
            }
        }, completion: nil)
    }
    
    @objc func handleMenuButton(_ button: UIButton) {
        areaButton.backgroundColor = (button.tag == 1) ? .white : .darkGray
        dateButton.backgroundColor = (button.tag == 2) ? .white : .darkGray
    }
    
}
