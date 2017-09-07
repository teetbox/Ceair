//
//  UIButton+CenterSpace.swift
//  Ceair
//
//  Created by Tong Tian on 9/8/17.
//  Copyright © 2017 Bizersoft. All rights reserved.
//

import UIKit

extension UIButton {
    
    func centerImageAndTitle(with space: CGFloat) {
        let inset = space / 2
        imageEdgeInsets = UIEdgeInsets(top: 0, left: -inset, bottom: 0, right: inset)
        titleEdgeInsets = UIEdgeInsets(top: 0, left: inset, bottom: 0, right: -inset)
        contentEdgeInsets = UIEdgeInsets(top: 0, left: inset, bottom: 0, right: inset)
    }
    
}
