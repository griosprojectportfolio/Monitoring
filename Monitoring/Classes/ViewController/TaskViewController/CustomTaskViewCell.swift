//
//  CustomTaskViewCell.swift
//  Monitoring
//
//  Created by GrepRuby on 24/02/15.
//  Copyright (c) 2015 GrepRuby. All rights reserved.
//

import UIKit

class CustomTaskViewCell: UITableViewCell {

    @IBOutlet weak var vwBackgound:UIView!
    @IBOutlet weak var vwDescription :UIView!

    @IBOutlet weak var imgVwToDoRemaining :UIImageView!
    @IBOutlet weak var imgVwToDoDone :UIImageView!
    @IBOutlet weak var imgVwToDoCurrent :UIImageView!

    @IBOutlet weak var lblToDoRemaining :UILabel!
    @IBOutlet weak var lblToDoDone :UILabel!
    @IBOutlet weak var lblToDoCurrent :UILabel!
    @IBOutlet weak var lblToDoHeading :UILabel!
    @IBOutlet weak var lblAssignToHeading :UILabel!
  
    @IBOutlet weak var lblTaskName :UILabel!
    @IBOutlet weak var imgVwBackground:UIImageView!

    @IBOutlet weak var progressBarTaskComplete :UIProgressView!
    @IBOutlet weak var lblTaskComplete :UILabel!
    @IBOutlet weak var lblAssignTo :UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColorOfImageView()
      
  }
  func getFeeds(feeds:NSArray){
  
  }
  
    func contentsDefaultSettings(frame:CGRect){

    println("***\(frame)")

    vwDescription.layer.cornerRadius = 1
    vwDescription.layer.borderWidth = 0.5
    vwDescription.layer.borderColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1).CGColor
    vwDescription.layer.masksToBounds = true

    self.imgVwBackground.layer.cornerRadius = 5.0
    self.imgVwBackground.layer.masksToBounds = true

    imgVwToDoRemaining.layer.cornerRadius = 2
    imgVwToDoRemaining.layer.borderWidth = 0.5
    imgVwToDoRemaining.layer.borderColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1).CGColor
    imgVwToDoRemaining.layer.masksToBounds = true

    imgVwToDoDone.layer.cornerRadius = 2
    imgVwToDoDone.layer.borderWidth = 0.5
    imgVwToDoDone.layer.borderColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1).CGColor
    imgVwToDoDone.layer.masksToBounds = true

    imgVwToDoCurrent.layer.cornerRadius = 2
    imgVwToDoCurrent.layer.borderWidth = 0.5
    imgVwToDoCurrent.layer.borderColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1).CGColor
    imgVwToDoCurrent.layer.masksToBounds = true

    self.vwBackgound.frame = frame
    imgVwBackground.frame = CGRectMake(frame.size.width - 80, 2, 75, 96)

    //make mutable string
    var strName:NSString =  "Jason Var"
    var mutableStrAssignName = NSMutableAttributedString()
    mutableStrAssignName = NSMutableAttributedString(string: strName)

    mutableStrAssignName.addAttribute(NSFontAttributeName, value: UIFont(name: "Helvetica-Bold", size: 15.0)!, range: NSRange(location:0,length:1))
    mutableStrAssignName.addAttribute(NSForegroundColorAttributeName, value: UIColor.redColor(), range: NSRange(location:0,length:1))

    var rangeLastName:NSRange = strName.rangeOfString(" ")

    mutableStrAssignName.addAttribute(NSForegroundColorAttributeName, value: UIColor.redColor(), range: NSRange(location:0,length:1))
    mutableStrAssignName.addAttribute(NSForegroundColorAttributeName, value: UIColor.greenColor(), range: NSRange(location:rangeLastName.location,length:1))

    self.lblAssignTo.attributedText = mutableStrAssignName

//    lblTaskName.font = UIFont(name: "HelveticaNeue", size: 15)
//    lblAssignTo.font = UIFont(name: "HelveticaNeue", size: 15)
//    
//    lblToDoHeading.font = UIFont(name: "HelveticaNeue-Light", size: 13)
//    lblAssignToHeading.font = UIFont(name: "HelveticaNeue-Light", size: 13)
//    lblTaskComplete.font = UIFont(name: "HelveticaNeue-Light", size: 13)
//    

    lblTaskName.font = UIFont(name: "HelveticaNeue", size: 18)
    lblTaskName.textColor = UIColor.darkGrayColor()
    
    lblAssignTo.font = UIFont(name: "HelveticaNeue", size: 15)
    lblAssignTo.textColor = UIColor.darkGrayColor()
    lblAssignTo.textAlignment = NSTextAlignment.Left
    
    
    
    lblAssignToHeading.font = UIFont(name: "HelveticaNeue", size: 13)
    lblAssignToHeading.textColor = UIColor.lightGrayColor()
    
    lblTaskComplete.font = UIFont(name: "HelveticaNeue", size: 13)
    lblTaskComplete.textColor = UIColor.lightGrayColor()
//
//    lblToDoRemaining.font = UIFont(name: "HelveticaNeue", size: 13)
//    lblToDoDone.font = UIFont(name: "HelveticaNeue", size: 13)
//    lblToDoCurrent.font = UIFont(name: "HelveticaNeue", size: 13)
    
  }

    func backgroundColorOfImageView() {

        let gl:CAGradientLayer = CAGradientLayer ()
        gl.colors = [(UIColor(red: 65.0/255.0, green: 104.0/255.0, blue: 183.0/255.0, alpha: 1.0).CGColor), (UIColor(red: 68.0/255.0, green: 136.0/255.0, blue: 224.0/255.0, alpha: 1.0).CGColor),(UIColor(red: 225/255.0, green: 225/255.0, blue: 250/255.0, alpha: 1.0).CGColor)]
        gl.locations = [ 0.0, 1.0]
        self.imgVwBackground.layer.insertSublayer(gl, atIndex: 0)
        gl.frame = self.imgVwBackground.frame;
    }
    
}
