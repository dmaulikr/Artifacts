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
    
    @IBAction func card01Action(sender: UIButton) {
        exampleAction()
    }
    
    func exampleAction () {
        println("click action")
        //self.myGameActions.removeLifeTest(self.myGameObject.playerOne)
        self.myGameActions.updatePlayerLifeView (self.playerOneLifeCounterLabel, myPlayerObject : self.myGameObject.playerOne)
    }
  
//
// MARK: - Data Load On Start
//
    
    func initalViewSetup () {
        println("initalViewSetup")
        
        self.myGameActions.gameInitialViewLoad (self.playerOneLifeCounterLabel, myPlayerObject : self.myGameObject.playerOne)
        self.myGameActions.gameIntialLoad (self.myGameObject.playerTwo)
        
        
        playerCardTestClass()
        
    }
 
//
// MARK: - Test Class
//
    
    func playerCardTestClass () {
        var playerTwoCardDeck = self.myGameObject.playerTwo.playerCardDeck
        var myCardGroup = playerTwoCardDeck.cardGroup
        var mySpellCard : SpellCard = myCardGroup![0]
        var mySpellCardPropertyListDictionary = mySpellCard.spellCardPropertyListDictionary
        var mySpellCardEffectListDictionary = mySpellCard.spellCardEffectListDictionary

        if let cardName : AnyObject = mySpellCardPropertyListDictionary!["cardName"] {
            println("The name of the card is \(cardName).")
        }
        
        if let cardText : AnyObject = mySpellCardPropertyListDictionary!["cardText"] {
            println("The text of the card is \(cardText).")
        }
        
        cardEffectState(mySpellCardEffectListDictionary!)
        
        
    }
    
    func cardEffectState (mySpellCardEffectListDictionary : [String:AnyObject]) {
        

        var myEffectStateStack = EffectStateStack()
        
        if let damageCheck : AnyObject = mySpellCardEffectListDictionary["damage"] {
            myEffectStateStack.damageAmount = damageCheck as Int
            println("The effect damage is : \(damageCheck)")
        }
        
        if let functionCheck : AnyObject = mySpellCardEffectListDictionary["functionName"] {
            let myString : String = functionCheck as String
            println("The effect damage is : \(myString)")

            var myEffectArray
            if let myArray = myEffectStateStack.effectArray {
                println("xxx")
            }
            else {
                println("yyy")
            }
            
            /*
            if myArray.isEmpty {
                println("empty array")
                myEffectStateStack.effectArray = [myString]
            }
            else {
                println("non empty array")
                myEffectStateStack.effectArray?.append(myString)
            }
            */
            
           // myEffectStateStack.effectArray!.append(myString)
            
        }
        
        println("Extra info : \(myEffectStateStack.effectArray)")

        //if let effectDamage : AnyObject = myCardEffect["damage"] {
            //println("The effect damage is : \(effectDamage)")
        //}
        
        
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
