//
//  DestinationFilterView.swift
//  Ceair
//
//  Created by Matt Tian on 03/01/2018.
//  Copyright © 2018 Bizersoft. All rights reserved.
//

import UIKit

class DestinationFilterView: UIView, UITabBarDelegate {
    
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
        view.backgroundColor = UIColor.fromHEX(string: "#273B5E")
        return view
    }()
    
    lazy var cancelButton: UIButton = {
        let button = UIButton()
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16.0)
        button.setTitle("Cancel", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.setTitleColor(.gray, for: .highlighted)
        button.addTarget(self, action: #selector(handleCancel), for: .touchUpInside)
        return button
    }()
    
    lazy var confirmButton: UIButton = {
        let button = UIButton()
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16.0)
        button.setTitle("Confirm", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.setTitleColor(.gray, for: .highlighted)
        button.addTarget(self, action: #selector(handleConfirm), for: .touchUpInside)
        return button
    }()
    
    lazy var clearButton: UIButton = {
        let button = UIButton()
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16.0)
        let deleteImage = UIImage(named: "Trash")?.mask(with: .white)
        button.setImage(deleteImage, for: .normal)
        button.setTitle("Clear", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.setTitleColor(.gray, for: .highlighted)
        button.addTarget(self, action: #selector(handleClear), for: .touchUpInside)
        button.centerImageAndTitle(with: 5)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let menuView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.fromHEX(string: "#F8F8F8")
        return view
    }()
    
    let memuSeparator: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        return view
    }()
    
    lazy var areaButton:  UIButton = {
        let button = UIButton()
        button.tag = 1
        button.setTitle("Area", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = UIColor.fromHEX(string: "#F8F8F8")
        button.addTarget(self, action: #selector(handleMenuButton), for: .touchUpInside)
        return button
    }()
    
    lazy var dateButton:  UIButton = {
        let button = UIButton()
        button.tag = 2
        button.setTitle("Date", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = UIColor.fromHEX(string: "#F8F8F8")
        button.addTarget(self, action: #selector(handleMenuButton), for: .touchUpInside)
        return button
    }()
    
    let collectionView: FilterCollectionView = {
        let collection = FilterCollectionView()
        return collection
    }()
    
    let barSeparator: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        return view
    }()
    
    lazy var filterBar: UITabBar = {
        let tabBar = UITabBar()
        let sortItem = UITabBarItem(title: "Sort", image: UIImage(named: "Sort"), tag: 1)
        let filterItem = UITabBarItem(title: "Filter", image: UIImage(named: "Filter"), tag: 2)
        tabBar.tintColor = UIColor.fromHEX(string: COLORS.BarTintColor)
        tabBar.backgroundColor = UIColor.fromHEX(string: "#F8F8F8")
        tabBar.delegate = self
        tabBar.items = [sortItem, filterItem]
        return tabBar
    }()
    
    func show(_ window: UIWindow) {
        blackView.backgroundColor = UIColor(white: 0.5, alpha: 0.5)
        blackView.frame = window.frame
        blackView.alpha = 0.5
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleDismiss))
        blackView.addGestureRecognizer(tapGesture)
        
        collectionView.viewModel = viewModel
        collectionView.viewModel.getFilters {}
        
        window.addSubview(blackView)
        
        setUpViews(window)
    }
    
    private func setUpViews(_ window: UIView) {
        filterView.frame = CGRect(x: 0, y: window.frame.height, width: window.frame.width, height: 240)
        window.addSubview(filterView)
        
        filterView.addSubview(titleBar)
        filterView.addConstraints(format: "H:|[v0]|", views: titleBar)
        filterView.addConstraints(format: "V:|[v0(40)]", views: titleBar)
        
        titleBar.addSubview(cancelButton)
        titleBar.addSubview(confirmButton)
        titleBar.addSubview(clearButton)
        titleBar.addConstraints(format: "H:|-15-[v0]", views: cancelButton)
        titleBar.addConstraints(format: "H:[v0]-15-|", views: confirmButton)
        cancelButton.centerYAnchor.constraint(equalTo: titleBar.centerYAnchor).isActive = true
        confirmButton.centerYAnchor.constraint(equalTo: titleBar.centerYAnchor).isActive = true
        clearButton.centerYAnchor.constraint(equalTo: titleBar.centerYAnchor).isActive = true
        clearButton.centerXAnchor.constraint(equalTo: titleBar.centerXAnchor).isActive = true
        
        filterView.addSubview(menuView)
        filterView.addConstraints(format: "H:|[v0(100)]", views: menuView)
        filterView.addConstraints(format: "V:[v0]-50-|", views: menuView)
        menuView.topAnchor.constraint(equalTo: titleBar.bottomAnchor).isActive = true
        
        menuView.addSubview(areaButton)
        menuView.addSubview(dateButton)
        menuView.addSubview(memuSeparator)
        menuView.addConstraints(format: "H:|[v0(100)]", views: areaButton)
        menuView.addConstraints(format: "H:|[v0(100)]", views: dateButton)
        menuView.addConstraints(format: "H:|[v0(100)]", views: memuSeparator)
        menuView.addConstraints(format: "V:|[v0(40)][v1(40)][v2(0.5)]", views: areaButton, dateButton, memuSeparator)
        
        filterView.addSubview(filterBar)
        filterView.addConstraints(format: "H:|[v0]|", views: filterBar)
        filterView.addConstraints(format: "V:[v0(50)]|", views: filterBar)
        
        filterView.addSubview(collectionView)
        filterView.addConstraints(format: "H:|-100-[v0]|", views: collectionView)
        collectionView.topAnchor.constraint(equalTo: titleBar.bottomAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: filterBar.topAnchor).isActive = true
        
        filterView.addSubview(barSeparator)
        filterView.addConstraints(format: "H:|[v0]|", views: barSeparator)
        filterView.addConstraints(format: "V:[v0(0.5)]", views: barSeparator)
        barSeparator.topAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: -0.5).isActive = true
        
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            self.blackView.alpha = 1
            self.filterView.frame = CGRect(x: 0, y: window.frame.height - 240, width: window.frame.width, height: 240)
        }, completion: nil)
    }
    
    @objc func handleDismiss() {
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            self.blackView.alpha = 0
            if let window = UIApplication.shared.keyWindow {
                self.filterView.frame = CGRect(x: 0, y: window.frame.height, width: window.frame.width, height: 240)
            }
        }, completion: { _ in
            self.filterView.removeFromSuperview()
        })
        
        viewModel.dismiss()
    }
    
    @objc func handleCancel() {
        handleDismiss()
    }
    
    @objc func handleConfirm() {
        handleDismiss()
    }
    
    @objc func handleClear() {
        print(#function)
    }
    
    @objc func handleMenuButton(_ button: UIButton) {
        handleFilter(with: button.tag)
    }
    
    // UITabBar Delegate
    func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        handleFilter(with: item.tag)
    }
    
    func handleFilter(with tag: Int) {
        if tag == 1 {
            filterBar.selectedItem = filterBar.items?[0]
            areaButton.backgroundColor = .white
            dateButton.backgroundColor = UIColor.fromHEX(string: "#F8F8F8")
        } else if tag == 2 {
            filterBar.selectedItem = filterBar.items?[1]
            areaButton.backgroundColor = UIColor.fromHEX(string: "#F8F8F8")
            dateButton.backgroundColor = .white
        }
        
        viewModel.updateFilter(with: tag) {
            collectionView.reloadData()
        }
    }
    
}
