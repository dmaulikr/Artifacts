//
//  ViewObjectClass.swift
//  NewCDTest
//
//  Created by MGM on 6/8/14.
//  Copyright (c) 2014 Yolaroo. All rights reserved.
//

import UIKit
import QuartzCore

enum MyConstants: CGFloat {
    case SquareCornerRadius = 10.0
    case WideCornerRadius = 50.0
}


class ViewObjectClass: NSObject {

}

extension UIColor {
    class func shadowColor() -> UIColor {
        return UIColor(red: 0.0/255.0, green: 0.0/255.0, blue: 0.0/255.0, alpha: 0.3)
    }
    class func textShadowColor() -> UIColor {
        return UIColor(red: 50.0/255.0, green: 50.0/255.0, blue: 50.0/255.0, alpha: 0.5)
    }
    class func pastelBlueColor() -> UIColor {
        return UIColor(red: 176.0/255.0, green: 186.0/255.0, blue: 255.0/255.0, alpha: 1)
    }
    class func pastelYellowColor() -> UIColor {
        return UIColor(red: 255.0/255.0, green: 238.0/255.0, blue: 140.0/255.0, alpha: 1)
    }
}

extension UIView {
    
    func squareLayerborders() {
        let layer = self.layer
        let frame = self.frame
        let myColor = self.backgroundColor
        layer.borderColor = UIColor.whiteColor().CGColor
        layer.borderWidth = 0.8
        layer.cornerRadius = squareCornerRadiusSetter(frame.height)
    }
    
    func layerShadow() {
        layer.frame.size = self.frame.size
        layer.shadowOpacity = 1
        layer.shadowRadius = 3
        layer.shadowOffset = CGSizeMake(2.0,2.0)
        layer.shadowColor = UIColor.shadowColor().CGColor
        layer.cornerRadius = squareCornerRadiusSetter(frame.height)
    }
    
    func layerGradient() {
        let layer : CAGradientLayer = CAGradientLayer()

        layer.frame.size = self.frame.size
        layer.frame.origin = CGPointMake(0.0,0.0)
        layer.cornerRadius = squareCornerRadiusSetter(frame.height)
        
        let color0 = UIColor(red:250.0/255, green:250.0/255, blue:250.0/255, alpha:0.5).CGColor
        let color1 = UIColor(red:200.0/255, green:200.0/255, blue:200.0/255, alpha:0.1).CGColor
        let color2 = UIColor(red:150.0/255, green:150.0/255, blue:150.0/255, alpha:0.1).CGColor
        let color3 = UIColor(red:100.0/255, green:100.0/255, blue:100.0/255, alpha:0.1).CGColor
        let color4 = UIColor(red:050.0/255, green:050.0/255, blue:050.0/255, alpha:0.1).CGColor
        let color5 = UIColor(red:000.0/255, green:000.0/255, blue:000.0/255, alpha:0.1).CGColor
        let color6 = UIColor(red:150.0/255, green:150.0/255, blue:150.0/255, alpha:0.1).CGColor
        layer.colors = [color0,color1,color2,color3,color4,color5,color6]
        self.layer.insertSublayer(layer, atIndex: 0)
    }
        
    func squareCornerRadiusSetter (height : CGFloat) -> CGFloat {
        return CGFloat(height / MyConstants.SquareCornerRadius.rawValue)
    }
}

func viewshadow <T where T: UIView> (shadowObject: T)
{
    let layer = shadowObject.layer
    let radius = 50
    layer.borderColor = UIColor.whiteColor().CGColor
    layer.borderWidth = 0.8
    layer.cornerRadius = 50
    layer.shadowOpacity = 1
    layer.shadowRadius = 3
    layer.shadowOffset = CGSizeMake(2.0,2.0)
    layer.shadowColor = UIColor.shadowColor().CGColor
}
