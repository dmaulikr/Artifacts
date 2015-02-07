//
//  CardList.swift
//  Artifacts
//
//  Created by MGM on 2/3/15.
//  Copyright (c) 2015 yolaroo. All rights reserved.
//


//
// not needed
//

import Foundation

class CardList {

    init() {
        
    }
    
    func card01x () -> CardObject {
        println("card 01")
        
        var myCard = CardObject()
        myCard.spellCardPropertyListDictionary = ["cardTitle" : "Lightning Bolt",
                                             "cardActionText" : "Deal 3 damage",
                                              "cardImageFile" : "icon"]
        
        myCard.spellCardEffectListDictionary = ["damage" : 3,
                                         "functionCount" : 1,
                                         "firstFunction" : "dealDamageToTarget"]
        
        return myCard
    }
    
    func card02x () -> CardObject {
        println("card 02")
        
        var myCard = CardObject()
        myCard.spellCardPropertyListDictionary = ["cardTitle" : "Frost Bolt",
            "cardActionText" : "Deal 4 damage",
            "cardImageFile" : "icon"]
        
        myCard.spellCardEffectListDictionary = ["damage" : 4,
            "functionCount" : 1,
            "firstFunction" : "dealDamageToTarget"]
        
        return myCard
    }
    
    
    

}