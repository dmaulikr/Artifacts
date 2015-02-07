//
//  playerDBMap.swift
//  Artifacts
//
//  Created by MGM on 2/5/15.
//  Copyright (c) 2015 yolaroo. All rights reserved.
//

import Foundation

class PlayerDBMap {
    
    init () {

    }
    
//
//
////
// MARK: Main Function
////
//
//
    
    func decodeJSON(cardFullList : CardListObject) {
        println("data start")
        
        let myData = dataReturn()
        let jsonObject : AnyObject! = NSJSONSerialization.JSONObjectWithData(myData, options: NSJSONReadingOptions.MutableContainers, error: nil)

        if jsonObject != nil {
            playerListBuilder(jsonObject, cardFullList : cardFullList)
        }
        else {
            println("json error")
        }
    }
    
//
//
////
// MARK: Support Functions
////
//
//
    
    func filePath() -> String {
        let ROOT_PATH = ""
        let FILE_NAME = "PlayerDBList"
        let fullPathString = ROOT_PATH + FILE_NAME
        return fullPathString
    }
    
    func dataReturn() -> NSData {
        let myBundle = NSBundle.mainBundle()
        let myDataPath = myBundle.pathForResource(filePath(), ofType: "json")
        let myData = NSData(contentsOfFile: myDataPath!)
        return myData!
    }
    
//
//
////
// MARK: Class Builder
////
//
//
    
    func playerListBuilder(jsonObject : AnyObject, cardFullList : CardListObject) {
        println("player builder start")
        
        let playerList = jsonObject["playerList"] as NSDictionary
        let fullList = playerList["fullList"] as NSArray
        
        var myPlayerArray : [PlayerDBObject] = []
        
        for thePlayer in fullList {
            
            //player info
            var myPlayerDBObject = PlayerDBObject()
            myPlayerDBObject.playerID = thePlayer["playerID"] as String
            myPlayerDBObject.playerName = thePlayer["playerName"] as String
            
            //fullcardlist
            let playerFullCardIDList = thePlayer["fullCardList"] as NSArray
            var myCardListObject : [CardObject] = []
            myCardListObject = playerCardListTranslator(playerFullCardIDList,cardFullList : cardFullList)
            
            myPlayerDBObject.fullCardList = myCardListObject
            
            //decklists
            let playerDeckLists = thePlayer["deckLists"] as NSArray
            var myPlayerDeckObject : [DeckObject] = []
            for deckLists in playerDeckLists {
                var myDeckObject = DeckObject()
                myDeckObject = masterDeckListBuilder(myDeckObject,deckLists:deckLists as NSDictionary,cardFullList:cardFullList)
                //append
                myPlayerDeckObject.append(myDeckObject)
            }
            myPlayerDBObject.deckLists = myPlayerDeckObject
            
            // append
            myPlayerArray.append(myPlayerDBObject)
        }
        
        //var myCardListObject = CardListObject()
        //myCardListObject.cardList = myCardArray
        //playerListTEST(myCardListObject)
        //playerListCheck(myPlayerArray)

        println("card builder end")
        
    }
    
    func playerListCheck (myPlayerArray : [PlayerDBObject] ) {
        
        let myPlayer : PlayerDBObject = myPlayerArray[0]
        let myPlayerName = myPlayer.playerName
        let myFullDeckList : [CardObject] = myPlayer.fullCardList!
        let myDeckList :[DeckObject] = myPlayer.deckLists!
        println(myPlayerName)
        deckListTEST(myDeckList[0])
    }
    
    func deckListTEST (myDeckObject : DeckObject) {
        let cardArray : [CardObject] = myDeckObject.cardCoreList!
        let cardObject : CardObject = cardArray[0]
        let cardTitle = cardObject.cardTitle
        println(cardTitle)
    }
    
    func masterDeckListBuilder (myDeckObject : DeckObject , deckLists : NSDictionary, cardFullList : CardListObject) -> DeckObject  {

        //properties
        let deckID = deckLists["deckID"] as String
        let deckName = deckLists["deckName"] as String
        let cardCount = deckLists["numberOfCards"] as String
        
        myDeckObject.deckID = deckID
        myDeckObject.deckName = deckName
        myDeckObject.cardCount = cardCount
        
        //decklists
        var myCardCoreList : [CardObject] = []
        var myCardShiftList : [CardObject] = []
        myCardCoreList = playerCardCoreListBuilder(deckLists as NSDictionary, cardFullList : cardFullList)
        myCardShiftList = playerCardShiftListBuilder(deckLists as NSDictionary, cardFullList : cardFullList)
        
        //audibles
        var myCardAudibleList : [DeckAudibleListObject] = []
        myCardAudibleList = playerCardAudibleListBuilder(deckLists as NSDictionary, cardFullList : cardFullList)

        myDeckObject.cardCoreList = myCardCoreList
        myDeckObject.cardShiftList = myCardShiftList
        myDeckObject.cardAudibleList = myCardAudibleList
        
        return myDeckObject
    }
    
    func playerCardCoreListBuilder (deckLists : NSDictionary, cardFullList : CardListObject) ->  [CardObject]{
        var myCardCoreList : [CardObject] = []
        let cardCoreList = deckLists["cardCoreList"] as NSArray
        myCardCoreList = playerCardListTranslator(cardCoreList,cardFullList : cardFullList)
        return myCardCoreList
    }
    
    func playerCardShiftListBuilder (deckLists : NSDictionary, cardFullList : CardListObject) ->  [CardObject]{
        var myCardShiftList : [CardObject] = []
        let cardShiftList = deckLists["cardShiftList"] as NSArray
        myCardShiftList = playerCardListTranslator(cardShiftList,cardFullList : cardFullList)
        return myCardShiftList
    }
    
    func playerCardAudibleListBuilder (deckLists : NSDictionary, cardFullList : CardListObject) ->  [DeckAudibleListObject] {
        var myCardAudibleList : [DeckAudibleListObject] = []
        if let cardAudibleListArray = deckLists["cardAudibleList"] as? NSArray {
            var myCounter = 0
            
            for audibleLists in cardAudibleListArray {
                
                let audibleID = audibleLists["audibleID"] as String
                let audibleName = audibleLists["audibleName"] as String
                
                //list
                let audibleCardList = audibleLists["audibleCardList"] as NSArray
                var myAudibleCardList : [CardObject] = []
                myAudibleCardList = playerCardListTranslator(audibleCardList,cardFullList : cardFullList)
                
                let myDeckAudibleListObject = DeckAudibleListObject()
                myDeckAudibleListObject.audibleID = audibleID
                myDeckAudibleListObject.audibleName = audibleName
                myDeckAudibleListObject.cardList = myAudibleCardList
                
                //write to audible array
                myCardAudibleList.append(myDeckAudibleListObject)
                
                myCounter++
            }
        }
        return myCardAudibleList
    }
    
    func playerCardListTranslator (playerFullCardIDList:NSArray, cardFullList : CardListObject) -> [CardObject] {
        var myCardListObject : [CardObject] = []
        for theCardID in playerFullCardIDList {
            let myNewCard = cardFullList.getCardFromCardID(theCardID as String, cardList: cardFullList.cardList!)
            myCardListObject.append(myNewCard!)
        }
        //println(myCardListObject)
        return myCardListObject
    }
    
//
//
////
// MARK: Test
////
//
//
    
    func playerListTEST (myCardListObject : CardListObject){
        if let aCardList = myCardListObject.cardList {
            let theCard = aCardList[0]
            println(theCard.cardTitle)
        }
        else {
            println("error?")
        }
    }
    
    func dictionaryUnwrapTEST (propertyDictionary : AnyObject, effectDictionary : AnyObject) {
        if let aProperty: AnyObject = propertyDictionary as? NSDictionary {
            if let theProperty = aProperty["damage"] as? String {
                println(theProperty)
            }
        }
        if let aEffect: AnyObject = effectDictionary as? NSDictionary {
            if let theEffect = aEffect["01"] as? String {
                println(theEffect)
            }
        }
    }
    
    func cardDecodeTEST (jsonObject : AnyObject) {
        let cardList = jsonObject["cardList"] as NSDictionary
        let fullList = cardList["fullList"] as NSArray
        
        let firstCard = fullList[0] as NSDictionary
        
        let cardTitle = firstCard["cardTitle"] as String
        let cardID = firstCard["cardID"] as String
        let cardActionText = firstCard["cardActionText"] as String
        let cardImageFile = firstCard["cardImageFile"] as String
        
        let dictionaryLists = firstCard["dictionaryLists"] as NSArray
        
        let theDictionaryLists = dictionaryLists[0] as NSDictionary
        
        let propertyList = theDictionaryLists["propertyList"] as NSArray
        let propertyDictionary = propertyList[0] as NSDictionary
        let damage = propertyDictionary["damage"] as String
        
        let effectList = theDictionaryLists["effectList"] as NSArray
        let effectDictionary = effectList[0] as NSDictionary
        let firstFunction = effectDictionary["01"] as String
        println(firstFunction)
    }
    
    
    
}
