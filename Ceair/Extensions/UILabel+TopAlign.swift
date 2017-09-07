//
//  UILabel+TopAlign.swift
//  Ceair
//
//  Created by Tong Tian on 9/7/17.
//  Copyright © 2017 Bizersoft. All rights reserved.
//

import UIKit

class TopAlignLabel: UILabel {

    override func drawText(in rect: CGRect) {
        guard let _text = text else {
            return super.drawText(in: rect)
        }
        
        let attributedText = NSAttributedString(string: _text, attributes: [NSAttributedStringKey.font: font])
        var _rect = rect
        _rect.size.height = attributedText.boundingRect(with: rect.size, options: .usesLineFragmentOrigin, context: nil).size.height
        
        if numberOfLines != 0 {
            _rect.size.height = min(_rect.size.height, CGFloat(numberOfLines) * font.lineHeight)
        }
        
        super.drawText(in: _rect)
    }

}
