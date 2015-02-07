

//
//  CardObject.swift
//  Artifacts
//
//  Created by MGM on 12/7/14.
//  Copyright (c) 2014 yolaroo. All rights reserved.
//

import Foundation

class CardObject {
    
    init() {
        
    }
    
    var cardID : String = ""
    var cardTitle : String = ""
    var cardClass : String = ""
    var cardText : String = ""
    var cardDescription : String = ""
    var cardNotes : String = ""
    var cardPowerRating : Double = 0.0
    var cardImageFileName : String = ""
    
    var cardType : String = ""
    
    var spellCardPropertyListDictionary : [NSObject: AnyObject]?
    var spellCardEffectListDictionary : [NSObject: AnyObject]?

}