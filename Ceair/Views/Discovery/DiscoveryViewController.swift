//
//  DiscoveryViewController.swift
//  Ceair
//
//  Created by Matt Tian on 02/01/2018.
//  Copyright © 2018 Bizersoft. All rights reserved.
//

import UIKit

class DiscoveryViewController: UIViewController {
    
    var viewModel: DiscoveryViewModel!
    
    var cartoonInitialCenter = CGPoint() {
        didSet {
            print(cartoonInitialCenter)
        }
    }
    var cartoonPreviousCenter = CGPoint()
    var cartoonViewBottomConstraint: NSLayoutConstraint?
    var isCartoonDisplayed = false
    
    var cartoonSearchViewBottomConstraint: NSLayoutConstraint?
    lazy var cartoonSearchView: CartoonSearchView = {
        let view = CartoonSearchView()
        view.delegate = self
        return view
    }()
    
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
    
    var cityViewTopConstraint: NSLayoutConstraint?
    var cityViewBottomConstraint: NSLayoutConstraint?
    var previousOffSetY: CGFloat = 0
    
    let cityView: ActivityCollectionView = {
        let collection = ActivityCollectionView()
        collection.backgroundColor = UIColor.fromHEX(string: "#F8F8F8")
        return collection
    }()
    
    var themeViewTopConstraint: NSLayoutConstraint?
    
    let themeView: ThemeCollectionView = {
        let theme = ThemeCollectionView()
        theme.backgroundColor = UIColor.fromHEX(string: "#F8F8F8")
        return theme
    }()
    
    let dimView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(white: 0.2, alpha: 0.8)
        view.alpha = 0
        return view
    }()
    
    let loadingView: LoadingView = {
        let view = LoadingView()
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.isNavigationBarHidden = true
        hideKeyboardWhenTappedAround()

        setUpViews()
        fetchData()
    }
    
    private func fetchData() {
        loadingView.startAnimating()
        
        viewModel.fetchThemes {
            self.themeView.reloadData()
        }
        
        viewModel.fetchCities {
            self.cityView.reloadData()
        }
        
        DispatchQueue.main.async {
            sleep(1)
            self.loadingView.stopAnimating()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        UIApplication.shared.statusBarStyle = .lightContent
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if !isCartoonDisplayed {
            cartoonInitialCenter = cartoonSearchView.center
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        if isCartoonDisplayed {
            cartoonSearchView.center = view.center
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        UIApplication.shared.statusBarStyle = .default
    }
    
    @objc func handlePanGesture(_ gestureRecognizer : UIPanGestureRecognizer) {
        let panView = gestureRecognizer.view!
        let point = gestureRecognizer.translation(in: view)
        
        if gestureRecognizer.state == .began {
            cartoonPreviousCenter = panView.center
        }
        
        if gestureRecognizer.state != .cancelled {
            let newCenter = CGPoint(x: cartoonPreviousCenter.x, y: cartoonPreviousCenter.y + point.y)
            panView.center = newCenter
        } else {
            panView.center = cartoonPreviousCenter
        }
        
        if gestureRecognizer.state == .ended {
            let distance = panView.center.y - cartoonInitialCenter.y
            
            if isCartoonDisplayed {
                if cartoonPreviousCenter.y - panView.center.y > 20 {
                    UIView.animate(withDuration: 0.4, animations: {
                        print(self.cartoonInitialCenter)
                        self.cartoonSearchView.center = self.cartoonInitialCenter
                        self.dimView.alpha = 0
                    }, completion: { (true) in
                        self.isCartoonDisplayed = false
                    })
                } else {
                    UIView.animate(withDuration: 0.4, animations: {
                        self.cartoonSearchView.center = self.view.center
                        self.dimView.alpha = 1
                    }, completion: { (true) in
                        self.isCartoonDisplayed = true
                    })
                }
            } else {
                if distance > 50 {
                    UIView.animate(withDuration: 0.4, animations: {
                        self.cartoonSearchView.center = self.view.center
                        self.dimView.alpha = 1
                    }, completion: { (true) in
                        self.isCartoonDisplayed = true
                    })
                } else {
                    UIView.animate(withDuration: 0.4, animations: {
                        self.cartoonSearchView.center = self.cartoonInitialCenter
                        self.dimView.alpha = 0
                    }, completion: { (true) in
                        self.isCartoonDisplayed = false
                    })
                }
                
                self.cartoonPreviousCenter = panView.center
            }
        }
    }
    
    func setUpViews() {
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

        view.addSubview(cartoonSearchView)
        view.addConstraints(format: "H:[v0(320)]", views: cartoonSearchView)
        view.addConstraints(format: "V:[v0(569)]", views: cartoonSearchView)
        cartoonSearchView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        cartoonSearchViewBottomConstraint = cartoonSearchView.bottomAnchor.constraint(equalTo: navView.bottomAnchor, constant: 60)
        cartoonSearchViewBottomConstraint?.isActive = true
        
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(handlePanGesture))
        cartoonSearchView.addGestureRecognizer(panGesture)
        
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
        
        cityView.viewModel = viewModel
        cityView.scrollDelegate = self
        view.addSubview(cityView)
        view.addConstraints(format: "H:|[v0]|", views: cityView)
        cityViewTopConstraint = cityView.topAnchor.constraint(equalTo: navView.bottomAnchor, constant: 60)
        cityViewTopConstraint?.isActive = true
        cityViewBottomConstraint = cityView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -105)
        cityViewBottomConstraint?.isActive = true
        
        themeView.viewModel = viewModel
        view.addSubview(themeView)
        view.addConstraints(format: "H:|[v0]|", views: themeView)
        view.addConstraints(format: "V:[v0(105)]", views: themeView)
        themeViewTopConstraint = themeView.topAnchor.constraint(equalTo: view.bottomAnchor, constant: -105)
        themeViewTopConstraint?.isActive = true
    
        view.addSubview(dimView)
        view.addConstraints(format: "H:|[v0]|", views: dimView)
        view.addConstraints(format: "V:|[v0]|", views: dimView)
        
        view.bringSubview(toFront: navView)
        view.bringSubview(toFront: dimView)
        view.bringSubview(toFront: cartoonSearchView)
        
        view.addSubview(loadingView)
        view.addConstraints(format: "H:|[v0]|", views: loadingView)
        view.addConstraints(format: "V:|[v0]|", views: loadingView)
    }

}

extension DiscoveryViewController: ScrollViewDelegate {
    
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
            cityViewTopConstraint?.constant = newSearchConstant
            
            // Theme View
            let themeGap = themeTopConstant - distance
            let newThemeConstant = (themeGap > -105) ? themeGap : -105
            themeViewTopConstraint?.constant = newThemeConstant
            cityViewBottomConstraint?.constant = newThemeConstant
            
        // Scroll Up
        } else if (previousOffSetY < offSetY && offSetY > 0) {
            
            // if scroll view reach the bottom, stop to update the constraint
            let bottomGap = scrollView.contentSize.height - scrollView.frame.size.height
            if (offSetY >= bottomGap) {
                return
            }
            
            // Search View
            let distance = offSetY - previousOffSetY
            let gap = searchBottomConstant - distance
            let newSearchConstant = (gap > 0) ? gap : 0
            searchViewBottomConstraint?.constant = newSearchConstant
            cityViewTopConstraint?.constant = newSearchConstant
            
            // Theme View
            let themeGap = themeTopConstant + distance
            let newThemeConstant = (themeGap < 0) ? themeGap : 0
            themeViewTopConstraint?.constant = newThemeConstant
            cityViewBottomConstraint?.constant = newThemeConstant
        }
        
        previousOffSetY = offSetY
    }

}

extension DiscoveryViewController: CartoonSearchViewDelegate {
    
    func textFieldBeginEditing(tag: Int) {
        print(tag)
        let newViewController = NewViewController()
        newViewController.didSelect = { (text) in
            self.cartoonSearchView.dateTextfield.text = text
        }
        navigationController?.pushViewController(newViewController, animated: true)
    }
    
}

class NewViewController: UIViewController {
    
    typealias CallBack = (String) -> Void
    
    var didSelect: CallBack?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationController?.isNavigationBarHidden = false
        
        let button = UIButton()
        button.backgroundColor = .green
        button.addTarget(self, action: #selector(handleShow), for: .touchUpInside)
        view.addSubview(button)
        button.setTitle("Show", for: .normal)
        view.addConstraints(format: "H:[v0(60)]", views: button)
        view.addConstraints(format: "V:[v0(30)]", views: button)
        button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        button.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = true
    }
    
    @objc func handleShow() {
        navigationController?.popViewController(animated: true)
        if let callBack = didSelect {
            callBack("TTSY")
        }
    }
    
}
