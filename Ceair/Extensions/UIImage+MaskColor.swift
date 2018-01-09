//
//  UIImage+MaskColor.swift
//  Ceair
//
//  Created by Matt Tian on 09/01/2018.
//  Copyright © 2018 Bizersoft. All rights reserved.
//

import UIKit

extension UIImage {
    
    public func mask(with color: UIColor) -> UIImage {
        
        UIGraphicsBeginImageContextWithOptions(self.size, false, self.scale)
        let context = UIGraphicsGetCurrentContext()!
        
        let rect = CGRect(origin: CGPoint.zero, size: size)
        
        color.setFill()
        self.draw(in: rect)
        
        context.setBlendMode(.sourceIn)
        context.fill(rect)
        
        let resultImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return resultImage
    }
    
}
