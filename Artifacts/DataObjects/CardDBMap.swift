//
//  CardDBMap.swift
//  Artifacts
//
//  Created by MGM on 2/3/15.
//  Copyright (c) 2015 yolaroo. All rights reserved.
//

import Foundation

class CardDBMap {
        
    init () {
        
    }

//
//
////
// MARK: Main Function
////
//
//
    
    func decodeJSON() -> CardListObject? {
        println("data start")
        
        let myData = dataReturn()
        let jsonObject : AnyObject! = NSJSONSerialization.JSONObjectWithData(myData, options: NSJSONReadingOptions.MutableContainers, error: nil)

        if jsonObject != nil {
            return cardListBuilder(jsonObject)
        }
        else {
            println("json error")
            return nil
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
        let FILE_NAME = "CardDBList"
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
    
    func cardListBuilder(jsonObject : AnyObject) -> CardListObject {
        println("card builder start")
        
        let cardList = jsonObject["cardList"] as NSDictionary
        let fullList = cardList["fullList"] as NSArray
        
        var myCardArray : [CardObject] = []
        
        for theCard in fullList {
            //println(theCard["cardTitle"])
            
            var myCardObject = CardObject()
            myCardObject.cardID = theCard["cardID"] as String
            myCardObject.cardTitle = theCard["cardTitle"] as String
            myCardObject.cardText = theCard["cardActionText"] as String
            myCardObject.cardImageFileName = theCard["cardImageFile"] as String
            
            var dictionaryLists = theCard["dictionaryLists"] as NSArray
            
            var theDictionaryLists = dictionaryLists[0] as NSDictionary

            var propertyList = theDictionaryLists["propertyList"] as NSArray
            var effectList = theDictionaryLists["effectList"] as NSArray

            myCardObject.spellCardPropertyListDictionary = propertyList[0] as NSDictionary
            myCardObject.spellCardEffectListDictionary = effectList[0] as NSDictionary
        
            //println(myCardObject.cardID)
            myCardArray.append(myCardObject)
            
        }
        
        var myCardListObject = CardListObject()
        myCardListObject.cardList = myCardArray
        
        println("card builder end")
        //cardListTEST(myCardListObject)

        return myCardListObject

    }

//
//
////
// MARK: Test
////
//
//
    
    func cardListTEST (myCardListObject : CardListObject){
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