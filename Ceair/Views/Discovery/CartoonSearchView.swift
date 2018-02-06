//
//  CartoonSearchView.swift
//  Ceair
//
//  Created by Matt Tian on 06/02/2018.
//  Copyright © 2018 Bizersoft. All rights reserved.
//

import UIKit

protocol CartoonSearchViewDelegate {
    func textFieldBeginEditing(tag: Int)
}

class CartoonSearchView: UIView {
    
    var delegate: CartoonSearchViewDelegate?
    
    let backgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(white: 0, alpha: 0.5)
        return view
    }()
    
    let searchView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.fromHEX(string: "#F8F8F8")
        return view
    }()
    
    let fromLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18.0)
        label.text = "From"
        label.textColor = .black
        label.textAlignment = .right
        return label
    }()
    
    lazy var fromTextfield: UITextField = {
        let textfield = UITextField()
        textfield.tag = 1
        textfield.delegate = self
        textfield.layer.borderWidth = 0.5
        textfield.layer.borderColor = UIColor.lightGray.cgColor
        textfield.backgroundColor = UIColor.fromHEX(string: "#F8F8F8")
        return textfield
    }()
    
    let toLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18.0)
        label.text = "To"
        label.textColor = .black
        label.textAlignment = .right
        return label
    }()
    
    lazy var toTextfield: UITextField = {
        let textfield = UITextField()
        textfield.tag = 2
        textfield.delegate = self
        textfield.layer.borderWidth = 0.5
        textfield.layer.borderColor = UIColor.lightGray.cgColor
        textfield.backgroundColor = UIColor.fromHEX(string: "#F8F8F8")
        return textfield
    }()
    
    let dateLabel: UILabel = {
        let label = UILabel()
        label.text = "Date"
        label.font = UIFont.systemFont(ofSize: 18.0)
        label.textColor = .black
        label.textAlignment = .right
        return label
    }()
    
    lazy var dateTextfield: UITextField = {
        let textfield = UITextField()
        textfield.tag = 3
        textfield.delegate = self
        textfield.layer.borderWidth = 0.5
        textfield.layer.borderColor = UIColor.lightGray.cgColor
        textfield.backgroundColor = UIColor.fromHEX(string: "#F8F8F8")
        return textfield
    }()
    
    lazy var searchButton: UIButton = {
        let button = UIButton()
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20.0)
        button.setTitle("Search", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor.fromHEX(string: "#2F4263")
        button.addTarget(self, action: #selector(handleSearch), for: .touchUpInside)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
    }
    
    @objc func handleSearch() {
        
    }
    
    private func setupViews() {
        addSubview(backgroundView)
        addConstraints(format: "H:|[v0]|", views: backgroundView)
        addConstraints(format: "V:|[v0]|", views: backgroundView)
        
        addSubview(searchView)
        addConstraints(format: "H:[v0(300)]", views: searchView)
        addConstraints(format: "V:[v0(215)]", views: searchView)
        searchView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        searchView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
        searchView.addSubview(fromLabel)
        searchView.addSubview(fromTextfield)
        addConstraints(format: "H:|[v0]-10-[v1(180)]-20-|", views: fromLabel, fromTextfield)
        addConstraints(format: "V:|-20-[v0(30)]", views: fromLabel)
        addConstraints(format: "V:[v0(35)]", views: fromTextfield)
        fromTextfield.centerYAnchor.constraint(equalTo: fromLabel.centerYAnchor).isActive = true
        
        searchView.addSubview(toLabel)
        searchView.addSubview(toTextfield)
        addConstraints(format: "H:|[v0]-10-[v1(180)]-20-|", views: toLabel, toTextfield)
        addConstraints(format: "V:|-65-[v0(30)]", views: toLabel)
        addConstraints(format: "V:[v0(35)]", views: toTextfield)
        toTextfield.centerYAnchor.constraint(equalTo: toLabel.centerYAnchor).isActive = true
        
        searchView.addSubview(dateLabel)
        searchView.addSubview(dateTextfield)
        addConstraints(format: "H:|[v0]-10-[v1(180)]-20-|", views: dateLabel, dateTextfield)
        addConstraints(format: "V:|-110-[v0(30)]", views: dateLabel)
        addConstraints(format: "V:[v0(35)]", views: dateTextfield)
        dateTextfield.centerYAnchor.constraint(equalTo: dateLabel.centerYAnchor).isActive = true
        
        searchView.addSubview(searchButton)
        searchView.addConstraints(format: "H:|-20-[v0]-20-|", views: searchButton)
        searchView.addConstraints(format: "V:[v0(40)]-20-|", views: searchButton)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

extension CartoonSearchView: UITextFieldDelegate {
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        delegate?.textFieldBeginEditing(tag: textField.tag)
        return false
    }
}
