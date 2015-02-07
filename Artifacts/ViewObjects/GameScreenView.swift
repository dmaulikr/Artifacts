//
//  GameScreenView.swift
//  Artifacts
//
//  Created by MGM on 12/7/14.
//  Copyright (c) 2014 yolaroo. All rights reserved.
//

import UIKit

class GameScreenView : MainFoundation {

//
//
////
// MARK: Life Counter View
////
//
//
    
    @IBOutlet weak var playerOneLifeCounterLabel: UILabel!
    
//
//
////
// MARK: Button Action
////
//
//
        
    // warning must make targeting system
    @IBAction func card01Action(sender: UIButton) {
  
        //addCardToHand()
        
        buildCardList()
        
        buildPlayerList()
        
        //exampleCardAction()
        //runNotification()
    }
  
    func buildCardList () {
        let myCardDBMap = CardDBMap()
        self.myFullList = myCardDBMap.decodeJSON()!
        //self.myFullList.cardFromIDTEST()
        //println(self.myFullList.cardList)
    }
        
    func buildPlayerList() {
        let myPlayerDBMap = PlayerDBMap()
        myPlayerDBMap.decodeJSON(self.myFullList)
    }
    
    func addCardToHand () {
        addPlayerHandObjectTEST()
        addCardViewsTEST()
        //self.myPlayerHand.addSubview(myCard)
        //let myRect = CGRectMake(10, 10, 100, 135)
        //let myCard = CardView(frame: myRect)
    }
    
    func addPlayerHandObjectTEST () {
    
        println("adding cards")

        
        let card01 = CardObject()
        let card02 = CardObject()
        let card03 = CardObject()
        
        self.myGameObject.playerTwo.playerHandObject.cardsInHand = [card01,card02,card03]
        
        
    }
    
    func addCardViewsTEST () {
        println("iterating")
        if let myHand = self.myGameObject.playerTwo.playerHandObject.cardsInHand {
            var count : Int = 0
            for myCard:CardObject in myHand {
                addNewTEST(count)
                ++count
            }
        }
        
    }

    func addNewTEST (count : Int) {
        println("adding")
        let myPadding : CGFloat = 10.0
        let myCardHeight : CGFloat = 135.0
        let myCardWidth : CGFloat = 100.0
        let myOffset = myPadding + CGFloat(count) * (myCardWidth + myPadding)
        let myRect = CGRectMake(myOffset, myPadding, myCardWidth, myCardHeight)
        let myCard = CardView(frame: myRect)
        self.myPlayerHand.addSubview(myCard)
    }
    
    
    //
    ////
    //
    
    func runNotification() {
        NSNotificationCenter.defaultCenter().postNotificationName("NotificationIdentifier", object: nil)
    }
    
//
//
////
// MARK: Initial Actions
////
//
//
 

    
    func initalViewSetup () {
        println("initalViewSetup")
        self.myGameActions.gameInitialViewLoad (self.playerOneLifeCounterLabel, myPlayerObject : self.myGameObject.playerOne)
        self.myGameActions.gameIntialLoad (self.myGameObject.playerTwo)
        addExtraViews()
        addNotifications()
    }
    
    func addExtraViews() {
        self.myPlayerHand = addPlayerHand()
        self.view.addSubview(self.myPlayerHand)
    }
    
    func addPlayerHand() -> PlayerHandView {
        
        var playerHandRect : CGRect = frameSetter(self.view)
        var myPlayerHand = PlayerHandView(frame: playerHandRect)
    
        return myPlayerHand
    }
 
    func frameSetter(mainVew:UIView) -> CGRect {
        let theScreenWidth = mainVew.frame.width
        let theScreenHeight = mainVew.frame.height
        let myWidth = theScreenWidth * MyPlayerHandConstants.Width.rawValue
        let myHeight = theScreenHeight * MyPlayerHandConstants.Height.rawValue
        let myRect = CGRectMake(0.5*theScreenWidth - 0.5*myWidth, theScreenHeight - 1.25*myHeight, myWidth, myHeight)
        return myRect
    }
    
//
//
////
// MARK: Notification Action
////
//
//
    
    func methodOFReceivedNotication(notification: NSNotification){
        println("notified!!")
    }
    
    func addNotifications() {
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "methodOFReceivedNotication:", name:"NotificationIdentifier", object: nil)
    }
    
    func removeNotifications() {
        NSNotificationCenter.defaultCenter().removeObserver(self, name: "NotificationIdentifier", object: nil)
    }
    
//
//
////
// MARK: Life Cycle
////
//
//
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initalViewSetup()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    deinit {
        println("GameScreenView deinit")
    }
    
//
//
////
// MARK: Navigation
////
//
//

    @IBAction func backButtonPress(sender: UIButton) {
        if let navController = self.navigationController {
            navController.popViewControllerAnimated(true)
        }
    }
    
//
//
////
// MARK: Test Class - Effect resolution
////
//
//
    
    func exampleCardAction () {
        println("-- click action --")
        playerCardTestClass()
        self.myGameActions.updatePlayerLifeView (self.playerOneLifeCounterLabel, myPlayerObject : self.myGameObject.playerOne) //view update class
    }
  
    func playerCardTestClass ()
    {
        var playerTwoCardDeck = self.myGameObject.playerTwo.playerCardDeck
        var myCardGroup = playerTwoCardDeck.cardCoreList
        var mySpellCard : CardObject = myCardGroup![0] //card needs to be chosen from hand card list object
        var mySpellCardPropertyListDictionary = mySpellCard.spellCardPropertyListDictionary
        var mySpellCardEffectListDictionary = mySpellCard.spellCardEffectListDictionary
        
        if let cardName : AnyObject = mySpellCardPropertyListDictionary!["cardName"] {
        }
        
        if let cardText : AnyObject = mySpellCardPropertyListDictionary!["cardText"] {
        }
        
        // TODO: must make targeting system - here
        //self.myCardActionController.cardEffectStateBuilder(mySpellCardEffectListDictionary!, withTargetList : [self.myGameObject.playerOne])
    }
    
//end of class
}






/*
var myCardEffect : CardEffectList?
if let cardEffectList : AnyObject = mySpellCardPropertyList!["effectlist"] {
myCardEffect = mySpellCardPropertyList!["effectlist"] as? CardEffectList
//println("The effect of the card is \(cardEffectList).")
}
*/
