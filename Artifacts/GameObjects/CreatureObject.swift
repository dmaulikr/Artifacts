//
//  CreatureObject.swift
//  Artifacts
//
//  Created by MGM on 1/26/15.
//  Copyright (c) 2015 yolaroo. All rights reserved.
//

import Foundation

class CreatureObject {
    
    init() {
        
    }

    var currentLifeTotal = 10
    var damageTaken = 0
    var healingTaken = 0
    
    var turnsInPlay = 0
    var creatureLevel = 0

    var creatureEnergy = 0
    var creatureAttack = 0
    var creatureArmor = 0
    
    func resetPlayer () {
        self.currentLifeTotal = 10
        self.damageTaken = 0
        self.healingTaken = 0
        
        self.turnsInPlay = 0
        self.creatureLevel = 0
        
        self.creatureEnergy = 0
        self.creatureAttack = 0
        self.creatureArmor = 0
    }
    
    
}