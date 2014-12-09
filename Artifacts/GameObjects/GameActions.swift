//
//  GameActions.swift
//  Artifacts
//
//  Created by MGM on 12/7/14.
//  Copyright (c) 2014 yolaroo. All rights reserved.
//

import Foundation
import UIKit

class GameActions : GameObject {
    
    func gameIntialLoad (myPlayerObject : PlayerObject) {
        var myCardDeckLoadActions = CardDeckLoadActions()
        myPlayerObject.playerCardDeck = myCardDeckLoadActions.loadExampleDeck()
    }
    
    func gameInitialViewLoad (playerOneLabel : UILabel, myPlayerObject : PlayerObject) {
        updatePlayerLifeView(playerOneLabel, myPlayerObject : myPlayerObject)
    }
    
    func updatePlayerLifeView (playerLabel : UILabel, myPlayerObject : PlayerObject) {
        let playerLifeTotal = String(myPlayerObject.currentLifeTotal)
        playerLabel.text = playerLifeTotal
    }
    
}