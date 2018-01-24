//
//  ChartCollectionCell.swift
//  Ceair
//
//  Created by Matt Tian on 24/01/2018.
//  Copyright © 2018 Bizersoft. All rights reserved.
//

import UIKit

class ChartCollectionCell: BaseCVCell {
    
    let priceView: UIView = {
        let view = UIView()
        return view
    }()
    
    var colors: [CGColor] = []
    
    var heightConstraint: NSLayoutConstraint?
    
    override func setUpViews() {
        addSubview(priceView)
        addConstraints(format: "H:|[v0]|", views: priceView)
        addConstraints(format: "V:[v0]|", views: priceView)
        
        heightConstraint = priceView.heightAnchor.constraint(equalToConstant: 100)
        heightConstraint?.isActive = true
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        priceView.roundCorners([.topLeft, .topRight], radius: 7.0)
        priceView.gradient(colors: colors, startPoint: CGPoint.init(x: 0.5, y: 0.0), endPoint: CGPoint.init(x: 0.5, y: 1.0), opacity: 1.0, location: [0,1])
    }
    
}

extension UIView {
    
    func gradient(colors: [CGColor], startPoint: CGPoint, endPoint: CGPoint, opacity: Float, location: [NSNumber]?) {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = bounds
        gradientLayer.colors = colors
        gradientLayer.startPoint = startPoint
        gradientLayer.endPoint = endPoint
        gradientLayer.opacity = opacity
        gradientLayer.locations = location
        layer.addSublayer(gradientLayer)
    }
    
    func roundCorners(_ corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        self.layer.mask = mask
    }
    
}
