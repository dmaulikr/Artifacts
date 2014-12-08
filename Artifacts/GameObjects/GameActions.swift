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
    
    func gameIntialLoad () {
        
    }
    
    func gameInitialViewLoad (playerOneLabel : UILabel, myPlayerObject : PlayerObject) {
        updatePlayerOneLifeView(playerOneLabel, myPlayerObject : myPlayerObject)
    }
    
    func updatePlayerLifeView (playerOneLabel : UILabel, myPlayerObject : PlayerObject) {
        let playerOneLifeTotal = String(myPlayerObject.currentLifeTotal)
        playerOneLabel.text = playerOneLifeTotal
    }
    
    func removeLifeTest (myPlayerObject : PlayerObject) {
        myPlayerObject.currentLifeTotal = myPlayerObject.currentLifeTotal - 3
    }
    
}