//
//  GameScreenView.swift
//  Artifacts
//
//  Created by MGM on 12/7/14.
//  Copyright (c) 2014 yolaroo. All rights reserved.
//

import UIKit

class GameScreenView: MainFoundation {

//
// MARK: - Life Counter View
//
    
    @IBOutlet weak var playerOneLifeCounterLabel: UILabel!
    
//
// MARK: - Simple Single Card Action Button
//
    
    // warning must make targeting system
    @IBAction func card01Action(sender: UIButton) {
        exampleCardAction()
    }
    
    func exampleCardAction () {
        println("-- click action --")
        playerCardTestClass()
        self.myGameActions.updatePlayerLifeView (self.playerOneLifeCounterLabel, myPlayerObject : self.myGameObject.playerOne)
    }
  
//
// MARK: - Data Load On Start
//
    
    func initalViewSetup () {
        println("initalViewSetup")
        self.myGameActions.gameInitialViewLoad (self.playerOneLifeCounterLabel, myPlayerObject : self.myGameObject.playerOne)
        self.myGameActions.gameIntialLoad (self.myGameObject.playerTwo)
    }
 
//
// MARK: - Test Class
//
    
    func playerCardTestClass ()
    {
        var playerTwoCardDeck = self.myGameObject.playerTwo.playerCardDeck
        var myCardGroup = playerTwoCardDeck.cardGroup
        var mySpellCard : SpellCard = myCardGroup![0] //card needs to be chosen from hand card list object
        var mySpellCardPropertyListDictionary = mySpellCard.spellCardPropertyListDictionary
        var mySpellCardEffectListDictionary = mySpellCard.spellCardEffectListDictionary

        if let cardName : AnyObject = mySpellCardPropertyListDictionary!["cardName"] {
        }
        
        if let cardText : AnyObject = mySpellCardPropertyListDictionary!["cardText"] {
        }
        
        // warning : must make targeting system
        self.myCardActionController.cardEffectStateBuilder(mySpellCardEffectListDictionary!, withTargetList : [self.myGameObject.playerOne])
    }
    
//
// MARK: - Life Cycle
//
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initalViewSetup()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
//
// MARK: - Navigation
//

    @IBAction func backButtonPress(sender: UIButton) {
        if let navController = self.navigationController {
            navController.popViewControllerAnimated(true)
        }
    }
    
}


/*
var myCardEffect : CardEffectList?
if let cardEffectList : AnyObject = mySpellCardPropertyList!["effectlist"] {
myCardEffect = mySpellCardPropertyList!["effectlist"] as? CardEffectList
//println("The effect of the card is \(cardEffectList).")
}
*/
