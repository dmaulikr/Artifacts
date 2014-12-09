//
//  CardList.swift
//  Artifacts
//
//  Created by MGM on 12/7/14.
//  Copyright (c) 2014 yolaroo. All rights reserved.
//

import Foundation

class CardActionList {
    
    init() {
        
    }

    func dealDamageToTarget (damage : Int, myPlayerObject : PlayerObject) {
        myPlayerObject.currentLifeTotal = myPlayerObject.currentLifeTotal - damage
    }
    
}

