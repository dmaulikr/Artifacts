//
//  MainFoundation.swift
//  Artifacts
//
//  Created by MGM on 12/7/14.
//  Copyright (c) 2014 yolaroo. All rights reserved.
//

import UIKit

class MainFoundation: UIViewController {

//
// MARK: - Init Properties
//

    var myGameObject = GameObject() 
    var myGameActions = GameActions()
    var myCardActionController = CardActionController()
    var myPlayerHand = PlayerHandView()
    var myFullList = CardListObject()
    
    
//
// MARK: - Life Cycle
//
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}

