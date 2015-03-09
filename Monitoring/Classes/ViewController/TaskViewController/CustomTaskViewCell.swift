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

    @IBOutlet weak var vwToDo:UIView!
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
  
    func setValueOfTaskList (frame:CGRect, taskInfo:Task){
        vwBackgound.frame = CGRectMake(0, 0,frame.size.width ,100)

        vwDescription.layer.cornerRadius = 1
        vwDescription.layer.borderWidth = 0.5
        vwDescription.layer.borderColor = UIColor.lightGrayColor().CGColor
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

        self.vwBackgound.frame = CGRectMake(0, 0, frame.size.width,self.contentView.frame.size.height)
        // imgVwBackground.frame = CGRectMake(frame.size.width - 120, 2, 75, 96)

        lblAssignToHeading.font = UIFont(name: "HelveticaNeue", size: 13)
        lblAssignToHeading.frame = CGRectMake (lblAssignToHeading.frame.origin.x, lblAssignToHeading.frame.origin.y, 65, lblAssignToHeading.frame.size.height)
        lblAssignToHeading.textColor = UIColor.lightGrayColor()

        lblAssignTo.frame = CGRectMake (lblAssignToHeading.frame.origin.x + lblAssignToHeading.frame.size.width , lblAssignToHeading.frame.origin.y, lblAssignTo.frame.size.width, lblAssignToHeading.frame.size.height)
        

        lblTaskComplete.font = UIFont(name: "HelveticaNeue", size: 13)
        lblTaskComplete.textColor = UIColor.lightGrayColor()
        lblToDoRemaining.font = UIFont(name: "HelveticaNeue", size: 13)

        vwToDo.frame = CGRectMake(5, vwToDo.frame.origin.y,vwToDo.frame.size.width,70)
        //  progressBarTaskComplete.frame = CGRectMake(progressBarTaskComplete.frame.origin.x, progressBarTaskComplete.frame.origin.y,(self.vwBackgound.frame.size.width - 150),self.progressBarTaskComplete.frame.size.height)
        // lblTaskComplete.frame = CGRectMake(self.vwBackgound.frame.size.width - 130, lblTaskComplete.frame.origin.y, self.lblTaskComplete.frame.size.width, self.lblTaskComplete.frame.size.height)
  }

    func backgroundColorOfImageView() {

        let gl:CAGradientLayer = CAGradientLayer ()
        gl.colors = [(UIColor(red: 65.0/255.0, green: 104.0/255.0, blue: 183.0/255.0, alpha: 1.0).CGColor), (UIColor(red: 68.0/255.0, green: 136.0/255.0, blue: 224.0/255.0, alpha: 1.0).CGColor),(UIColor(red: 225/255.0, green: 225/255.0, blue: 250/255.0, alpha: 1.0).CGColor)]
        gl.locations = [ 0.0, 1.0]
        self.imgVwBackground.layer.insertSublayer(gl, atIndex: 0)
        gl.frame = self.imgVwBackground.frame;
    }
    
}
