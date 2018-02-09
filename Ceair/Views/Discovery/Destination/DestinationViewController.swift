//
//  DestinationViewController.swift
//  Ceair
//
//  Created by Matt Tian on 03/01/2018.
//  Copyright © 2018 Bizersoft. All rights reserved.
//

import UIKit

class DestinationViewController: UIViewController, UITabBarDelegate {
    
    var viewModel: DestinationViewModel!
    
    let navView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }()
    
    lazy var backButton: UIButton = {
        let button = UIButton()
        button.setImage(#imageLiteral(resourceName: "Back"), for: .normal)
        button.tintColor = .white
        button.addTarget(self, action: #selector(handleBack), for: .touchUpInside)
        return button
    }()
    
    let navTitle: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.text = "Island"
        label.font = UIFont.boldSystemFont(ofSize: 20.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let titleView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }()
    
    let subtitle: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.text = "Sunshine Beach"
        label.font = UIFont.boldSystemFont(ofSize: 24.0)
        return label
    }()

    let subtitle2: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.text = "There is an old captain"
        label.font = UIFont.systemFont(ofSize: 20.0)
        return label
    }()
    
    let topImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.isUserInteractionEnabled = true
        imageView.image = #imageLiteral(resourceName: "TopImage")
        return imageView
    }()
    
    var previousOffSetY: CGFloat = 0
    
    var cityViewBottomConstraint: NSLayoutConstraint!
    let cityCollection: DestinationCollectionView = {
        let collection = DestinationCollectionView()
        return collection
    }()

    var themeViewTopConstraint: NSLayoutConstraint!
    let themeView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.fromHEX(string: "#F8F8F8")
        return view
    }()
    
    let themeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16.0)
        label.text = "More themes"
        return label
    }()
    
    let themeCollection: MoreThemeCollectionView = {
        let collection = MoreThemeCollectionView()
        return collection
    }()
    
    let barSeparator: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        return view
    }()
    
    let filterView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.fromHEX(string: "#F8F8F8")
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.fromHEX(string: "#F8F8F8")
        
        navigationItem.title = "Destination"
        navigationController?.isNavigationBarHidden = true
        
        setUpViews()
    }

    private func setUpViews() {
        view.addSubview(navView)
        view.addConstraints(format: "H:|[v0]|", views: navView)
        if DeviceUtility.isPhoneX {
            view.addConstraints(format: "V:|[v0(84)]", views: navView)  // +24
        } else {
            view.addConstraints(format: "V:|[v0(60)]", views: navView)
        }
        
        view.addSubview(titleView)
        view.addConstraints(format: "H:|[v0]|", views: titleView)
        view.addConstraints(format: "V:[v0(100)]", views: titleView)
        titleView.topAnchor.constraint(equalTo: navView.bottomAnchor).isActive = true
        
        titleView.addSubview(subtitle)
        titleView.addSubview(subtitle2)
        titleView.addConstraints(format: "V:|-10-[v0]-10-[v1]", views: subtitle, subtitle2)
        titleView.addConstraints(format: "H:|-40-[v0]", views: subtitle)
        titleView.addConstraints(format: "H:[v0]-40-|", views: subtitle2)
        
        navView.addSubview(topImageView)
        view.addConstraints(format: "H:|[v0]|", views: topImageView)
        topImageView.topAnchor.constraint(equalTo: navView.topAnchor).isActive = true
        topImageView.bottomAnchor.constraint(equalTo: navView.bottomAnchor, constant: 100).isActive = true
        
        topImageView.addSubview(navTitle)
        topImageView.addConstraints(format: "V:[v0(30)]-100-|", views: navTitle)
        navTitle.centerXAnchor.constraint(equalTo: topImageView.centerXAnchor).isActive = true
        
        topImageView.addSubview(backButton)
        topImageView.addConstraints(format: "H:|-15-[v0(44)]", views: backButton)
        topImageView.addConstraints(format: "V:[v0(44)]", views: backButton)
        backButton.centerYAnchor.constraint(equalTo: navTitle.centerYAnchor).isActive = true

        view.addSubview(filterView)
        view.addConstraints(format: "H:|[v0]|", views: filterView)
        view.addConstraints(format: "V:[v0]|", views: filterView)
        if DeviceUtility.isPhoneX {
            filterView.heightAnchor.constraint(equalToConstant: 0 + 34).isActive = true
        } else {
            filterView.heightAnchor.constraint(equalToConstant: 0).isActive = true
        }

        view.addSubview(barSeparator)
        view.addConstraints(format: "H:|[v0]|", views: barSeparator)
        view.addConstraints(format: "V:[v0(0.5)]", views: barSeparator)
        barSeparator.topAnchor.constraint(equalTo: filterView.topAnchor, constant: 0.5).isActive = true

        view.addSubview(themeView)
        view.addConstraints(format: "H:|[v0]|", views: themeView)
        view.addConstraints(format: "V:[v0(170)]", views: themeView)
        themeViewTopConstraint = themeView.topAnchor.constraint(equalTo: filterView.topAnchor, constant: -170)
        themeViewTopConstraint.isActive = true
        
        themeView.addSubview(themeLabel)
        themeView.addConstraints(format: "H:|-10-[v0]", views: themeLabel)
        themeView.addConstraints(format: "V:|-15-[v0]", views: themeLabel)
        
        themeView.addSubview(themeCollection)
        themeView.addConstraints(format: "H:|-10-[v0]-10-|", views: themeCollection)
        themeView.addConstraints(format: "V:[v0(120)]-10-|", views: themeCollection)

        cityCollection.viewModel = viewModel
        cityCollection.scrollDelegate = self
        view.addSubview(cityCollection)
        view.addConstraints(format: "H:|-5-[v0]-5-|", views: cityCollection)
        view.addConstraints(format: "V:[v0]", views: cityCollection)
        cityCollection.topAnchor.constraint(equalTo: titleView.bottomAnchor, constant: 10).isActive = true
        cityViewBottomConstraint = cityCollection.bottomAnchor.constraint(equalTo: filterView.topAnchor, constant: -170)
        cityViewBottomConstraint.isActive = true
        
        view.bringSubview(toFront: filterView)
    }
    
    @objc func handleBack() {
        viewModel.back()
    }
    
}

extension DestinationViewController: ScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offSetY = scrollView.contentOffset.y
        let themeTopConstant = themeViewTopConstraint!.constant
        
        // Scroll Down
        if (previousOffSetY > offSetY && previousOffSetY < (scrollView.contentSize.height - scrollView.frame.height)) {
            
            // Theme View
            let distance = previousOffSetY - offSetY
            let themeGap = themeTopConstant - distance
            let newThemeConstant = (themeGap > -170) ? themeGap : -170
            themeViewTopConstraint?.constant = newThemeConstant
            cityViewBottomConstraint?.constant = newThemeConstant
            
            // Scroll Up
        } else if (previousOffSetY < offSetY && offSetY > 0) {
            
            // Theme View
            let distance = offSetY - previousOffSetY
            let themeGap = themeTopConstant + distance
            let newThemeConstant = (themeGap < 0) ? themeGap : 0
            themeViewTopConstraint?.constant = newThemeConstant
            cityViewBottomConstraint?.constant = newThemeConstant
        }
        
        previousOffSetY = offSetY
    }
    
}
