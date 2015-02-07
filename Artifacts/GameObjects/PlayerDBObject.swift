//
//  File.swift
//  Artifacts
//
//  Created by MGM on 2/5/15.
//  Copyright (c) 2015 yolaroo. All rights reserved.
//

import Foundation


class PlayerDBObject {
    
    init() {
        
    }
    
    var playerID : String = ""
    var playerName : String = ""
    
    var fullCardList : [CardObject]? = []
    var deckLists : [DeckObject]? = []
    
}