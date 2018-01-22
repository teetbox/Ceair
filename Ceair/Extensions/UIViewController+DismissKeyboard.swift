//
//  UIViewController+DismissKeyboard.swift
//  Ceair
//
//  Created by Matt Tian on 22/01/2018.
//  Copyright © 2018 Bizersoft. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func hideKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
}
