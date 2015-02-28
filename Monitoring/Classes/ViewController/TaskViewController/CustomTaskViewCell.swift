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

    @IBOutlet weak var progressBarTaskComplete :UIProgressView!
    @IBOutlet weak var lblTaskComplete :UILabel!
    @IBOutlet weak var lblAssignTo :UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
      
  }
  func getFeeds(feeds:NSArray){
  
  }
  
  func contentsDefaultSettings(){
    
//    vwDescription.layer.cornerRadius = 1
//    vwDescription.layer.borderWidth = 0.5
//    vwDescription.layer.borderColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1).CGColor
//    vwDescription.layer.masksToBounds = true
//    
//    
//    imgVwToDoRemaining.layer.cornerRadius = 2
//    imgVwToDoRemaining.layer.borderWidth = 0.5
//    imgVwToDoRemaining.layer.borderColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1).CGColor
//    imgVwToDoRemaining.layer.masksToBounds = true
//    
//    imgVwToDoDone.layer.cornerRadius = 2
//    imgVwToDoDone.layer.borderWidth = 0.5
//    imgVwToDoDone.layer.borderColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1).CGColor
//    imgVwToDoDone.layer.masksToBounds = true
//    
//    imgVwToDoCurrent.layer.cornerRadius = 2
//    imgVwToDoCurrent.layer.borderWidth = 0.5
//    imgVwToDoCurrent.layer.borderColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1).CGColor
//    imgVwToDoCurrent.layer.masksToBounds = true
//    
//    
//    lblTaskName.font = UIFont(name: "HelveticaNeue", size: 15)
//    lblAssignTo.font = UIFont(name: "HelveticaNeue", size: 15)
//    
//    lblToDoHeading.font = UIFont(name: "HelveticaNeue-Light", size: 13)
//    lblAssignToHeading.font = UIFont(name: "HelveticaNeue-Light", size: 13)
//    lblTaskComplete.font = UIFont(name: "HelveticaNeue-Light", size: 13)
//    
//    lblToDoRemaining.font = UIFont(name: "HelveticaNeue", size: 13)
//    lblToDoDone.font = UIFont(name: "HelveticaNeue", size: 13)
//    lblToDoCurrent.font = UIFont(name: "HelveticaNeue", size: 13)
    
  }
    
}
