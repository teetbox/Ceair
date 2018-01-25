//
//  DiscoveryTabViewController.swift
//  Ceair
//
//  Created by Matt Tian on 02/01/2018.
//  Copyright © 2018 Bizersoft. All rights reserved.
//

import UIKit

class DiscoveryTabViewController: UIViewController {
    
    var viewModel: DiscoveryTabViewModel!
    
    let navView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.fromHEX(string: "#273B5E")
        return view
    }()
    
    let navTitle: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18.0)
        label.textAlignment = .center
        label.textColor = .white
        label.text = "Island"
        return label
    }()
    
    var searchViewBottomConstraint: NSLayoutConstraint?
    
    let searchView: UIView = {
        let search = UIView()
        search.backgroundColor = UIColor.fromHEX(string: "#273B5E")
        return search
    }()
    
    let searchStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 10
        stack.alignment = .center
        stack.distribution = .fillProportionally
        return stack
    }()
    
    let areaLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16.0)
        label.text = "From"
        label.textColor = .white
        label.textAlignment = .right
        label.clipsToBounds = true
        return label
    }()
    
    let areaTextField: UITextField = {
        let textField = UITextField()
        textField.layer.borderWidth = 0.5
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.backgroundColor = UIColor.fromHEX(string: "#465E7D")
        textField.textColor = .white
        // Cursor color
        textField.tintColor = .white
        textField.font = UIFont.systemFont(ofSize: 16.0)
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 7, height: 30))
        textField.leftViewMode = .always
        // Placeholder
        let attributedPlaceholder = NSAttributedString(string: "your place", attributes: [NSAttributedStringKey.foregroundColor: UIColor(white: 1.0, alpha: 0.5)])
        textField.attributedPlaceholder = attributedPlaceholder
        return textField
    }()
    
    let searchButton: UIButton = {
        let button = UIButton()
        button.setTitle("Search", for: .normal)
        button.layer.cornerRadius = 3
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        button.clipsToBounds = true
        button.backgroundColor = UIColor.fromHEX(string: "#D12E7D")
        return button
    }()
    
    let refreshView: UIView = {
        let refresh = UIView()
        refresh.backgroundColor = .lightGray
        return refresh
    }()
    
    var collectionViewTopConstraint: NSLayoutConstraint?
    var collectionViewBottomConstraint: NSLayoutConstraint?
    
    let collectionView: DiscoveryCollectionView = {
        let collection = DiscoveryCollectionView()
        collection.backgroundColor = UIColor.fromHEX(string: "#F8F8F8")
        return collection
    }()
    
    var themeViewTopConstraint: NSLayoutConstraint?
    
    let themeView: ThemeCollectionView = {
        let theme = ThemeCollectionView()
        theme.backgroundColor = UIColor.fromHEX(string: "#F8F8F8")
        return theme
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.isNavigationBarHidden = true
        
        setUpViews()
        
        hideKeyboardWhenTappedAround()
        
//        viewModel.fetchThemes {
//            self.themeView.reloadData()
//            print("Got themes")
//        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        UIApplication.shared.statusBarStyle = .lightContent
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        UIApplication.shared.statusBarStyle = .default
    }
    
    func setUpViews() {
        
        // 64 = 20 + 44
        // 88 = 44 + 44
        
        // 0
        // 34
        view.addSubview(navView)
        view.addConstraints(format: "H:|[v0]|", views: navView)
        if DeviceUtility.isPhoneX {
            view.addConstraints(format: "V:|[v0(84)]", views: navView)  // +24
        } else {
            view.addConstraints(format: "V:|[v0(60)]", views: navView)
        }
        
        navView.addSubview(navTitle)
        navView.addConstraints(format: "V:[v0]-10-|", views: navTitle)
        navTitle.centerXAnchor.constraint(equalTo: navView.centerXAnchor).isActive = true
        
        view.addSubview(searchView)
        view.addConstraints(format: "H:|[v0]|", views: searchView)
        view.addConstraints(format: "V:[v0(60)]", views: searchView)
        searchViewBottomConstraint = searchView.bottomAnchor.constraint(equalTo: navView.bottomAnchor, constant: 60)
        searchViewBottomConstraint?.isActive = true
        
        searchView.addSubview(areaLabel)
        searchView.addConstraints(format: "H:|[v0(70)]", views: areaLabel)
        searchView.addConstraints(format: "V:[v0(30)]-12-|", views: areaLabel)
        
        searchView.addSubview(searchButton)
        searchView.addConstraints(format: "H:[v0(60)]-10-|", views: searchButton)
        searchView.addConstraints(format: "V:[v0(30)]-12-|", views: searchButton)
        
        searchView.addSubview(areaTextField)
        searchView.addConstraints(format: "H:|-80-[v0]-80-|", views: areaTextField)
        searchView.addConstraints(format: "V:[v0(30)]-12-|", views: areaTextField)
        
        collectionView.viewModel = viewModel
        collectionView.scrollDelegate = self
        view.addSubview(collectionView)
        view.addConstraints(format: "H:|[v0]|", views: collectionView)
        collectionViewTopConstraint = collectionView.topAnchor.constraint(equalTo: navView.bottomAnchor, constant: 60)
        collectionViewTopConstraint?.isActive = true
        collectionViewBottomConstraint = collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -91)
        collectionViewBottomConstraint?.isActive = true
        
        view.addSubview(themeView)
        view.addConstraints(format: "H:|[v0]|", views: themeView)
        view.addConstraints(format: "V:[v0(91)]", views: themeView)
        themeViewTopConstraint = themeView.topAnchor.constraint(equalTo: view.bottomAnchor, constant: -91)
        themeViewTopConstraint?.isActive = true
        
        view.bringSubview(toFront: navView)
    }
    
    var previousOffSetY: CGFloat = 0
    
}

extension DiscoveryTabViewController: ScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offSetY = scrollView.contentOffset.y
        let searchBottomConstant = searchViewBottomConstraint!.constant
        let themeTopConstant = themeViewTopConstraint!.constant

        // Scroll Down
        if (previousOffSetY > offSetY && previousOffSetY < (scrollView.contentSize.height - scrollView.frame.height)) {
            
            // Search View
            let distance = previousOffSetY - offSetY
            let gap = searchBottomConstant + distance
            let newSearchConstant = (gap < 60) ? gap : 60
            searchViewBottomConstraint?.constant = newSearchConstant
            collectionViewTopConstraint?.constant = newSearchConstant
            
            // Theme View
            let themeGap = themeTopConstant - distance
            let newThemeConstant = (themeGap > -91) ? themeGap : -91
            themeViewTopConstraint?.constant = newThemeConstant
            collectionViewBottomConstraint?.constant = newThemeConstant
            
        // Scroll Up
        } else if (previousOffSetY < offSetY && offSetY > 0) {
            
            // Search View
            let distance = offSetY - previousOffSetY
            let gap = searchBottomConstant - distance
            let newSearchConstant = (gap > 0) ? gap : 0
            searchViewBottomConstraint?.constant = newSearchConstant
            collectionViewTopConstraint?.constant = newSearchConstant
            
            // Theme View
            let themeGap = themeTopConstant + distance
            let newThemeConstant = (themeGap < 0) ? themeGap : 0
            themeViewTopConstraint?.constant = newThemeConstant
            collectionViewBottomConstraint?.constant = newThemeConstant
        }
        
        previousOffSetY = offSetY
    }
    
}

extension UIView {
    
    var safeTopAnchor: NSLayoutYAxisAnchor {
        if #available(iOS 11.0, *) {
            return self.safeAreaLayoutGuide.topAnchor
        } else {
            return self.topAnchor
        }
    }
    
    var safeLeftAnchor: NSLayoutXAxisAnchor {
        if #available(iOS 11.0, *){
            return self.safeAreaLayoutGuide.leftAnchor
        }else {
            return self.leftAnchor
        }
    }
    
    var safeRightAnchor: NSLayoutXAxisAnchor {
        if #available(iOS 11.0, *){
            return self.safeAreaLayoutGuide.rightAnchor
        }else {
            return self.rightAnchor
        }
    }
    
    var safeBottomAnchor: NSLayoutYAxisAnchor {
        if #available(iOS 11.0, *) {
            return self.safeAreaLayoutGuide.bottomAnchor
        } else {
            return self.bottomAnchor
        }
    }
}
