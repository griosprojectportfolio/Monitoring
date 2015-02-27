//
//  CustomTableViewCell.swift
//  Monitoring
//
//  Created by GrepRuby on 18/02/15.
//  Copyright (c) 2015 GrepRuby. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
  
  @IBOutlet weak var projectName: UILabel!
  @IBOutlet weak var dueDate: UILabel!
  @IBOutlet weak var dateLable: UILabel!
  @IBOutlet weak var logoimage: UIImageView!
  @IBOutlet weak var mainView: UIView!
  @IBOutlet weak var dotView: UIView!
  @IBOutlet weak var hideinView: UIView!
  @IBOutlet weak var progressBar:UIProgressView!
  @IBOutlet weak var progressLabel: UILabel!
  
  @IBOutlet weak var deleteButoon:UIButton!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    // Initialization code
    
   
//    logoimage.frame = CGRect(x:self.contentView.frame.origin.x, y:self.contentView.frame.origin.y,width:100 , height:80)
    
   //  mainView.frame = CGRect(x:logoimage.frame.size.width, y:logoimage.frame.origin.y, width :self.contentView.frame.size.width, height:logoimage.frame.size.height)
    hideinView.frame = CGRect(x:0 ,y:1,width:self.contentView.frame.size.width , height:self.contentView.frame.size.height)
    
    

    
   // hideinView.backgroundColor = UIColor.grayColor()
    logoimage.frame = CGRect(x:self.hideinView.frame.origin.x, y:self.hideinView.frame.origin.y,width:80 , height:80)

      mainView.frame = CGRect(x:self.hideinView.frame.origin.x-logoimage.frame.size.width-60, y:self.logoimage.frame.origin.y, width:180, height:logoimage.frame.size.height)

    mainView.layer.cornerRadius = 1;
    mainView.layer.borderWidth = 0.5;
    var mycolor:UIColor = UIColor(red: 0, green: 0, blue: 0, alpha:0.3)
    mainView.layer.borderColor = mycolor.CGColor
    
    projectName.frame = CGRect(x:mainView.frame.origin.x+150, y:mainView.frame.origin.y,width:150 , height:40)
    projectName.font = UIFont(name: "Helvetica-Light", size:20)
    projectName.textAlignment = NSTextAlignment.Left;
    
    dateLable.frame = CGRect(x:projectName.frame.origin.x, y:projectName.frame.origin.y+20,width:40 , height:40)
    
    dueDate.frame = CGRect(x:dateLable.frame.origin.x+40, y:dateLable.frame.origin.y+2,width:80 , height:40)
    dueDate.font = UIFont(name: "Helvetica-Light", size: 12)
    
    dotView.frame = CGRect(x:dueDate.frame.size.width+85, y:dueDate.frame.origin.y+33,width:12,height:12)
    dotView.layer.cornerRadius = 2;
    dotView.layer.borderWidth = 0.5;
    var dotcolor:UIColor = UIColor(red: 0, green: 0, blue: 0, alpha:0.2)
    dotView.layer.borderColor = dotcolor.CGColor
   
     progressBar.frame = CGRect(x:dateLable.frame.origin.x, y:dueDate.frame.origin.y+40,width:120,height:2)
    
     progressLabel.frame = CGRect(x:progressBar.frame.size.width+18, y:dueDate.frame.origin.y+30,width:40,height:20)
    
  }
  
  @IBAction func handleDeleteButtonAction (sender:UIButton){
    
  }
  
  override func setSelected(selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
    
    // Configure the view for the selected stat
  }
  


}
