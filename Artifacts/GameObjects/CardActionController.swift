//
//  CardActionController.swift
//  Artifacts
//
//  Created by MGM on 12/8/14.
//  Copyright (c) 2014 yolaroo. All rights reserved.
//

import Foundation

class CardActionController {

    init() {
        
    }
    
    func cardEffectStateBuilder (mySpellCardEffectListDictionary : [String:AnyObject], withTargetList : [AnyObject] )
    {
        var myEffectStateStack = EffectStateStack()
        
        if let damageCheck : AnyObject = mySpellCardEffectListDictionary["damage"] {
            myEffectStateStack.damageAmount = damageCheck as Int
        }
        
        if let functionCheck : AnyObject = mySpellCardEffectListDictionary["firstFunction"] {
            let myString : String = functionCheck as String
            
            if let myArray = myEffectStateStack.effectArray {
                println("array not empty - error")
            }
            else {
                myEffectStateStack.effectArray = [myString]
            }
            
        }
        //println("effect info : \(myEffectStateStack.effectArray)")
        
        // warning : must make targeting system
        myEffectStateStack.targetArray = withTargetList
        
        cardEffectResolution(myEffectStateStack)
        
    }

    func cardEffectResolution ( myEffectStateStack : EffectStateStack)
    {
        if let myEventArray = myEffectStateStack.effectArray {
            for item in myEventArray {
                //println(item)
                cardResolutionEventList(myEffectStateStack, eventItem : item)
            }
        }
        else {
            println("effect - error")
        }
    }

    func cardResolutionEventList (myEffectStateStack : EffectStateStack, eventItem : String) {
        
        let myCardActionList = CardActionList()
        //let myPlayerObject = self.myGameObject.playerOne
        let myPlayerObject : PlayerObject = myEffectStateStack.targetArray![0] as PlayerObject
        if eventItem == "dealDamageToTarget"{
            myCardActionList.dealDamageToTarget(myEffectStateStack.damageAmount, myPlayerObject : myPlayerObject)
            
            println("action complete")
        }
    }

}