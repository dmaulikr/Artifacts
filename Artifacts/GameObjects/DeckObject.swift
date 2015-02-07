//
//  CardList.swift
//  Artifacts
//
//  Created by MGM on 12/8/14.
//  Copyright (c) 2014 yolaroo. All rights reserved.
//

import Foundation


class DeckObject {
    
    init() {
        
    }
    
    var cardCount : String = ""
    var deckStyle : String = ""
    var deckID : String = ""
    var deckName : String = ""

    var cardCoreList : [CardObject]? = []
    var cardShiftList : [CardObject]? = []
    var cardAudibleList : [DeckAudibleListObject]? = []
    
}