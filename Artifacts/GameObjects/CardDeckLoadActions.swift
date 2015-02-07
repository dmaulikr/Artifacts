//
//  GameDeckLoad.swift
//  Artifacts
//
//  Created by MGM on 12/8/14.
//  Copyright (c) 2014 yolaroo. All rights reserved.
//

import Foundation


class CardDeckLoadActions {

    init() {
        
    }
    
    func loadExampleDeck () -> DeckObject {
        println("deck card loaded")
        
        
        
        
        
        
        
        
        
        
        var mySpellCard = CardObject()
        mySpellCard.spellCardPropertyListDictionary = ["cardName" : "Lightning Bolt",
                                                       "cardText" : "Deal 3 damage"]
        
        //may change
        mySpellCard.spellCardEffectListDictionary = ["damage" : 3,
                                              "functionCount" : 1,
                                              "firstFunction" : "dealDamageToTarget"]
        
        var myCardDeck = DeckObject()
        myCardDeck.cardCount = "1"
        //myCardDeck.cardGroup = [mySpellCard]
        
        return myCardDeck
    }
    
}