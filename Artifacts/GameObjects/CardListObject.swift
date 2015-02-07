//
//  CardListObject.swift
//  Artifacts
//
//  Created by MGM on 2/4/15.
//  Copyright (c) 2015 yolaroo. All rights reserved.
//

import Foundation

class CardListObject {
    
    init() {
        
    }
    
    var cardList : [CardObject]?
    var cardCount : Int = 0
    var deckStyle : String = ""
    var cardListID : String = ""
    
    func getCardFromCardID (cardID : String, cardList : [CardObject]) -> CardObject? {
        
        for theCardObject : CardObject in cardList {
            if (theCardObject.cardID == cardID) {
                //println("card returned: " + theCardObject.cardTitle)
                return theCardObject
            } else {
                // empty
            }
        }
        println("nil cardID - ERROR")
        return nil
    }
    
    func cardFromIDTEST () {
        let test01CardID  = "000001"
        self.getCardFromCardID(test01CardID, cardList: self.cardList!)
        let test02CardID  = "000002"
        self.getCardFromCardID(test02CardID, cardList: self.cardList!)
    }
    
}