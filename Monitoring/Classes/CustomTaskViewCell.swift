//
//  CustomTaskViewCell.swift
//  Monitoring
//
//  Created by GrepRuby on 24/02/15.
//  Copyright (c) 2015 GrepRuby. All rights reserved.
//

import UIKit

class CustomTaskViewCell: UITableViewCell {
  
  var verticalView = UIView()
  var taskName:UILabel = UILabel()
  var taskNameLabel:UILabel = UILabel()
  var descriptionLabel:UILabel = UILabel()
  var taskassignLabel:UILabel = UILabel()
  var taskassignName:UILabel = UILabel()
  
  var tName:String!
  var tdescription:String!
  var tAssign:String!
  
 var mainview :UIView!

    override func awakeFromNib() {
    super.awakeFromNib()
    
   
    }
  
  func getFeeds(feeds:String){
  
    
    tdescription = feeds
    
    var textsize:CGSize = CGSize(width: 300, height: 900)
    
    var subViewOnMainView:UIView!
    //var boderView:UIView!
    
    var boderImageView:UIImageView!
    
    var description:UILabel = UILabel ()
    
    
    var textframe1:CGRect = tdescription.boundingRectWithSize(textsize, options: NSStringDrawingOptions.UsesLineFragmentOrigin, attributes:  [NSFontAttributeName:description.font], context: nil)
    
    println(textframe1)

    if (mainview != nil) {
      mainview .removeFromSuperview()
      mainview = nil
    }
    mainview = UIView(frame:CGRectMake(0,0,287,textframe1.size.height + 85))
    mainview.backgroundColor = UIColor.clearColor()
    self.contentView .addSubview(mainview)
    
    
    boderImageView = UIImageView(frame: CGRectMake(mainview.frame.origin.x+20, mainview.frame.origin.y+5, mainview.frame.size.width-20, mainview.frame.size.height-10))
    boderImageView.backgroundColor = UIColor.redColor()
        //boderImageView.backgroundColor =  UIColor(red: 0, green: 0, blue: 0, alpha:0.3)
        mainview.addSubview(boderImageView)
    
//    
//    boderView = UIView(frame: CGRectMake(mainview.frame.origin.x+20, mainview.frame.origin.y+5, mainview.frame.size.width-20, mainview.frame.size.height-10))
//    boderView.backgroundColor =  UIColor(red: 0, green: 0, blue: 0, alpha:0.3)
//    mainview.addSubview(boderView)
//    
    subViewOnMainView = UIView(frame: CGRectMake(2,2, boderImageView.frame.size.width-4, boderImageView.frame.size.height-4))
     subViewOnMainView.backgroundColor = UIColor.whiteColor()
      boderImageView.addSubview(subViewOnMainView)

//   subViewOnMainView = UIView(frame: CGRectMake(mainview.frame.origin.x+20, mainview.frame.origin.y+5, mainview.frame.size.width-20, mainview.frame.size.height-10))
//    
//    subViewOnMainView.backgroundColor = UIColor.whiteColor()
//    
//    subViewOnMainView.layer.cornerRadius = 1;
//    subViewOnMainView.layer.borderWidth = 1;
//    var mycolor:UIColor = UIColor(red: 0, green: 0, blue: 0, alpha:0.3)
//    subViewOnMainView.layer.borderColor = mycolor.CGColor
//    mainview.addSubview(subViewOnMainView)

    
    
//   verticalView.frame = CGRectMake(subViewOnMainView.frame.origin.x, subViewOnMainView.frame.origin.y,5,subViewOnMainView.frame.size.height-20)
//    
//    verticalView.backgroundColor = UIColor.greenColor()
//    verticalView.layer.cornerRadius = 1;
//    verticalView.layer.borderWidth = 0.3;
//    var verticalViewcolor:UIColor = UIColor(red: 0, green: 0, blue: 0, alpha:0.3)
//    verticalView.layer.borderColor = verticalViewcolor.CGColor
//    subViewOnMainView.addSubview(verticalView)
//
//    taskName.frame = CGRectMake(verticalView.frame.origin.x+10, verticalView.frame.origin.y,80,20)
//    
//    taskName.text = "Task Name:"
//    taskName.font = UIFont(name: "Helvetica-Light", size:13)
//    taskName.textAlignment = NSTextAlignment.Left;
//    subViewOnMainView.addSubview(taskName)
//    
//    taskNameLabel.frame = CGRectMake(taskName.frame.size.width+24, taskName.frame.origin.y,200,20)
//    
//    taskNameLabel.text = tName
//    taskNameLabel.font = UIFont(name: "Helvetica-Light", size:14)
//    taskNameLabel.textAlignment = NSTextAlignment.Left;
//    subViewOnMainView.addSubview(taskNameLabel)
//
//    descriptionLabel.frame = CGRectMake(taskName.frame.origin.x,taskName.frame.origin.y+taskName.frame.size.height,100,20)
//    
//    descriptionLabel.text = "Description:"
//    descriptionLabel.font = UIFont(name: "Helvetica-Light", size:13)
//    descriptionLabel.textAlignment = NSTextAlignment.Justified;
//    subViewOnMainView.addSubview(descriptionLabel)
//
//    description.frame = CGRectMake(descriptionLabel.frame.origin.x+76,descriptionLabel.frame.origin.y,150,textframe1.height)
//    
//    description.text = tdescription
//    description.font = UIFont(name: "Helvetica-Light", size:12)
//    description.textAlignment = NSTextAlignment.Left;
//    description.numberOfLines = 0
//    description.lineBreakMode = NSLineBreakMode.ByWordWrapping
//    description.sizeToFit()
//    subViewOnMainView.addSubview(description)
//
//    taskassignLabel.frame = CGRectMake(descriptionLabel.frame.origin.x,descriptionLabel.frame.origin.y+description.frame.height,100, 20)
//    
//    taskassignLabel.text = "Assign To:"
//    taskassignLabel.font = UIFont(name: "Helvetica-Light", size:13)
//    taskassignLabel.textAlignment = NSTextAlignment.Left;
//    subViewOnMainView.addSubview(taskassignLabel)
//
//    taskassignName.frame = CGRectMake(description.frame.origin.x,taskassignLabel.frame.origin.y,200,20)
//    
//    taskassignName.text = tAssign
//    taskassignName.font = UIFont(name: "Helvetica-Light", size:13)
//    taskassignName.textAlignment = NSTextAlignment.Left;
//    subViewOnMainView.addSubview(taskassignName)
    
  
  }
  
  
  
  
  override func setSelected(selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
    
    // Configure the view for the selected stat
  }
  
}
