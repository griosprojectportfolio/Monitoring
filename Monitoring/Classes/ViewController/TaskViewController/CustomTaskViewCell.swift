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

    @IBOutlet weak var lblProgressBarTaskComplete :UIProgressView!
    @IBOutlet weak var lblTaskComplete :UILabel!
    @IBOutlet weak var lblAssignTo :UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
      
  }
  func getFeeds(feeds:NSArray){
  
   //mainview.backgroundColor = UIColor.grayColor()
    
    var descip:NSString = feeds.objectAtIndex(1) as NSString
    
    var textsize:CGSize = CGSize(width: 300, height: 900)
    
    var subViewOnMainView = UIView()
    var description:UILabel = UILabel ()
    
    
    //var textframe1:CGRect = descip.boundingRectWithSize(textsize, options: NSStringDrawingOptions.UsesLineFragmentOrigin, attributes:  [NSFontAttributeName:description.font], context: nil)
    
  /* subViewOnMainView.frame = CGRectMake(mainview.frame.origin.x+10, mainview.frame.origin.x+10, mainview.frame.size.width-20,(mainview.frame.size.height-20)+textframe1.height-200)
    
    subViewOnMainView.layer.cornerRadius = 1;
    subViewOnMainView.layer.borderWidth = 0.5;
    var mycolor:UIColor = UIColor(red: 0, green: 0, blue: 0, alpha:0.3)
    subViewOnMainView.layer.borderColor = mycolor.CGColor
    mainview.addSubview(subViewOnMainView)

    
    var verticalView = UIView()
    var taskName:UILabel = UILabel()
    var taskNameLabel:UILabel = UILabel()
    var descriptionLabel:UILabel = UILabel()
    var taskassignLabel:UILabel = UILabel()
    var taskassignName:UILabel = UILabel()
    
   verticalView.frame = CGRectMake(subViewOnMainView.frame.origin.x+5, subViewOnMainView.frame.origin.y+5,5,100)
    
    verticalView.backgroundColor = UIColor.greenColor()
    verticalView.layer.cornerRadius = 1;
    verticalView.layer.borderWidth = 0.5;
    var verticalViewcolor:UIColor = UIColor(red: 0, green: 0, blue: 0, alpha:0.3)
    verticalView.layer.borderColor = verticalViewcolor.CGColor
    subViewOnMainView.addSubview(verticalView)
    
    taskName.frame = CGRectMake(verticalView.frame.origin.x+10, verticalView.frame.origin.y,80,20)
    
    taskName.text = "Task Name:"
    taskName.font = UIFont(name: "Helvetica-Light", size:13)
    taskName.textAlignment = NSTextAlignment.Left;
    subViewOnMainView.addSubview(taskName)
    
    taskNameLabel.frame = CGRectMake(taskName.frame.size.width+20, taskName.frame.origin.y,200,20)
    
    taskNameLabel.text = "Socialnetwork Integration"
    taskNameLabel.font = UIFont(name: "Helvetica-Light", size:14)
    taskNameLabel.textAlignment = NSTextAlignment.Left;
    subViewOnMainView.addSubview(taskNameLabel)
    
    descriptionLabel.frame = CGRectMake(taskName.frame.origin.x,taskName.frame.origin.y+taskName.frame.size.height+10,100,20)
    
    descriptionLabel.text = "Description:"
    descriptionLabel.font = UIFont(name: "Helvetica-Light", size:13)
    descriptionLabel.textAlignment = NSTextAlignment.Justified;
    subViewOnMainView.addSubview(descriptionLabel)

    description.frame = CGRectMake(descriptionLabel.frame.origin.x+76,descriptionLabel.frame.origin.y,180,textframe1.height)
    
    description.text = descip
    description.font = UIFont(name: "Helvetica-Light", size:12)
    description.textAlignment = NSTextAlignment.Left;
    description.numberOfLines = 0
    description.lineBreakMode = NSLineBreakMode.ByWordWrapping
    description.sizeToFit()
    subViewOnMainView.addSubview(description)
    
    taskassignLabel.frame = CGRectMake(3,descriptionLabel.frame.origin.y+description.frame.height+20,100, 20)
    
    taskassignLabel.text = "Task Assign To:"
    taskassignLabel.font = UIFont(name: "Helvetica-Light", size:13)
    taskassignLabel.textAlignment = NSTextAlignment.Left;
    subViewOnMainView.addSubview(taskassignLabel)
    
    taskassignName.frame = CGRectMake(taskassignLabel.frame.origin.x+taskassignLabel.frame.size.width-2,taskassignLabel.frame.origin.y,200,20)
    
    taskassignName.text = "Jason"
    taskassignName.font = UIFont(name: "Helvetica-Light", size:13)
    taskassignName.textAlignment = NSTextAlignment.Left;
    subViewOnMainView.addSubview(taskassignName) */
    
      }
  
}
