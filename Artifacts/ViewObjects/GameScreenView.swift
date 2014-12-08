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
// MARK: - Navigation
//
        
    @IBAction func backButtonPress(sender: UIButton) {
        if let navController = self.navigationController {
            navController.popViewControllerAnimated(true)
        }
    }
  
//
// MARK: - Life Counter Test
//
    
    @IBOutlet weak var playerOneLifeCounterLabel: UILabel!
    
    
//
// MARK: - Card Action Test
//
    
    @IBAction func card01Action(sender: UIButton) {
        exampleAction()
    }
    
    func exampleAction () {
        println("click action")
        self.myGameActions.removeLifeTest(self.myGameObject.playerOne)
        self.myGameActions.updatePlayerLifeView (self.playerOneLifeCounterLabel, myPlayerObject : self.myGameObject.playerOne)
    }
    
//
// MARK: - Life Cycle
//
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initalViewSetup()
        
    }

    func initalViewSetup () {
        println("initalViewSetup")
        
        self.myGameActions.gameInitialViewLoad (self.playerOneLifeCounterLabel, myPlayerObject : self.myGameObject.playerOne)
        
        
        
    }
    

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
