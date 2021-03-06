//
//  File.swift
//  Artifacts
//
//  Created by MGM on 12/7/14.
//  Copyright (c) 2014 yolaroo. All rights reserved.
//

import Foundation

class PlayerObject  {

    init() {
        
    }
    
    var playerID : Int = 0
    var playerName : String = ""

    var currentLifeTotal = 100
    var damageTaken = 0
    var healingTaken = 0
    
    var cardsPlayed = 0
    var playerLevel = 0
    var playerEnergy = 0
    var playerAttack = 0
    var playerArmor = 0
    var playerCardDeck = DeckObject()
    var playerHandObject = PlayerHandObject()
    
    func resetPlayer () {
        self.currentLifeTotal = 100
        self.damageTaken = 0
        self.healingTaken = 0
        self.cardsPlayed = 0
        self.playerLevel = 0
        self.playerEnergy = 0
        self.playerAttack = 0
        self.playerArmor = 0
    }
    
}