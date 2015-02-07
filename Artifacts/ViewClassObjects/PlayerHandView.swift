//
//  PlayerHandView.swift
//  Artifacts
//
//  Created by MGM on 1/23/15.
//  Copyright (c) 2015 yolaroo. All rights reserved.
//

import UIKit

enum MyPlayerHandConstants: CGFloat {
    case Width = 0.7
    case Height = 0.2
}

class PlayerHandView: UIView {
    
    override init (frame : CGRect) {
        super.init(frame : frame)
        initLoad()
    }
    
    convenience override init () {
        println("conv init")
        self.init(frame:CGRectZero)
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("PLayerHandView NSCoder Error")
    }
    
    func initLoad (){
        self.backgroundColor = UIColor.darkGrayColor()
        self.squareLayerborders()
        self.layerShadow()
        self.layerGradient()
        println("PlayerHandView initLoad")
    }
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
override func drawRect(rect: CGRect) {
// Drawing code
}
*/
