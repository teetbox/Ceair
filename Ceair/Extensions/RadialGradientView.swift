//
//  RadialGradientView.swift
//  Ceair
//
//  Created by Matt Tian on 22/01/2018.
//  Copyright © 2018 Bizersoft. All rights reserved.
//

import UIKit

class RadialGradientView: UIView {
    
    var insideColor = UIColor.clear
    var outsideColor = UIColor.clear
    
    override func draw(_ rect: CGRect) {
        let colors = [insideColor.cgColor, outsideColor.cgColor] as CFArray
        let endRadius = min(frame.width, frame.height) / 2
        let center = CGPoint(x: bounds.size.width / 2, y: bounds.size.height / 2)
        
        let gradient = CGGradient(colorsSpace: nil, colors: colors, locations: nil)
        
        UIGraphicsGetCurrentContext()?.drawRadialGradient(gradient!, startCenter: center, startRadius: 0.0, endCenter: center, endRadius: endRadius, options: .drawsAfterEndLocation)
    }
    
}
