//
//  File.swift
//  Artifacts
//
//  Created by MGM on 1/26/15.
//  Copyright (c) 2015 yolaroo. All rights reserved.
//

import UIKit

class CardView: UIView {
    
    var theTitleLabel = UILabel()
    var theActionTextLabel = UILabel()
    var theDescriptionTextLabel = UILabel()
    var theIcon = UIImageView()
    
    var theTitleText : String = ""
    var theActionText :  String = ""
    var theImageFileName : String = ""
    var theDescriptionText : String = ""
    var theUUID : String = ""
    
//
//
////
// MARK: Init
////
//
//

    override init (frame : CGRect) {
        super.init(frame : frame)
        initLoad()
    }
    
    convenience override init () {
        println("conv init")
        self.init(frame:CGRectZero)
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("CardView NSCoder Error")
    }
    
    deinit {
        removeNotifications()
        println("Card deinit")
    }
 
//
//
////
// MARK: Load
////
//
//

    func initLoad (){
        println("CardView initLoad")

        self.theTitleText = "Title"
        self.theImageFileName = "icon"
        self.theActionText = "Action Text"
        self.theUUID = myUUIDMaker()
        addNotifications()
        
        self.backgroundColor = UIColor.grayColor()
        self.squareLayerborders()
        self.layerShadow()
        self.layerGradient()

        var heightOffset : CGFloat = 0.0
        
        self.theTitleLabel = myLabelMaker(self, heightOffSet: 0.0)
        self.theTitleLabel.text = self.theTitleText
        
        heightOffset += theTitleLabel.frame.height
            
        self.theIcon = myImageMaker(self, heightOffSet: heightOffset, imageName: self.theImageFileName)
        
        heightOffset += self.theIcon.frame.height

        self.theActionTextLabel = myLabelMaker(self, heightOffSet: heightOffset)
        self.theActionTextLabel.text = self.theActionText
        
    }
 
//
//
////
// MARK: Notifications
////
//
//
  
    func addNotifications() {
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "methodOFReceivedNotication:", name:self.theUUID, object: nil)
    }
    
    func removeNotifications() {
        NSNotificationCenter.defaultCenter().removeObserver(self, name: "NotificationIdentifier", object: nil)
    }
    
    func methodOFReceivedNotication(notification: NSNotification){
        println("notified!!")
    }
    
//
//
////
// MARK: Touch
////
//
//
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        super.touchesBegan(touches, withEvent: event)
        for touch: AnyObject in touches {
            runNotification()
            println("touch")
        }
    }
    
    func runNotification() {
        NSNotificationCenter.defaultCenter().postNotificationName(self.theUUID, object: nil)
    }
    
//
//
////
// MARK: View Builders
////
//
//
    
    func myImageMaker (myView : UIView, heightOffSet : CGFloat, imageName : String ) -> UIImageView {
        let myImageFrame = CGRectMake(0 , heightOffSet, myView.frame.width, myView.frame.height * 0.50)
        let theImage = UIImage(named: imageName)
        let imageView = UIImageView(frame: myImageFrame)
        imageView.image = theImage
        imageView.contentMode = .Center;
        imageView.contentMode = .ScaleAspectFit;
        myView.addSubview(imageView)
        return imageView
    }
    
    func myLabelMaker (myView:UIView , heightOffSet : CGFloat) -> UILabel {
        let myLabelFrame = CGRectMake(0 , heightOffSet, myView.frame.width, myView.frame.height * 0.25)
        let myLabel = UILabel(frame: myLabelFrame)
        myLabel.numberOfLines = 1
        myLabel.textAlignment = .Center
        myLabel.textColor = UIColor.whiteColor()
        //myLabel.backgroundColor = UIColor.orangeColor()
        myView.addSubview(myLabel)
        return myLabel
    }
 
    func myUUIDMaker() -> String {
        return NSUUID().UUIDString
    }

    
}

//override func drawRect(rect: CGRect) {}
