//
//  CustomTableViewCell.swift
//  Monitoring
//
//  Created by GrepRuby on 18/02/15.
//  Copyright (c) 2015 GrepRuby. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    var vwBackgroundVw: UIView!
    var imgVwLogo: UIImageView!
    var vwDescription: UIView!
    var btnDelete:UIButton!

    var heightOfVw:CGFloat = 80
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func setValueOfProjectList (project:Project,row:Int, frame:CGRect) {

        println(frame)
        vwBackgroundVw = UIView(frame:CGRect(x:5 ,y:1 ,width:frame.size.width - 10 , height:84))
        self.contentView.addSubview(vwBackgroundVw)
        //vwBackgroundVw.backgroundColor = UIColor.redColor()
        vwBackgroundVw.layer.cornerRadius = 1;
        vwBackgroundVw.layer.borderWidth = 0.5;
        vwBackgroundVw.layer.borderColor = UIColor.clearColor().CGColor
        var mycolor:UIColor = UIColor(red: 0, green: 0, blue: 0, alpha:0.3)
        vwBackgroundVw.layer.borderColor = mycolor.CGColor

        imgVwLogo = UIImageView(frame: CGRect(x:4, y:0 ,width:80 , height:heightOfVw))
        imgVwLogo.image = UIImage(named: "blue-frame")
        imgVwLogo.backgroundColor = UIColor.greenColor()
        self.vwBackgroundVw.addSubview(imgVwLogo)

        var imgVwArrow: UIImageView = UIImageView(frame: CGRect(x:self.vwBackgroundVw.frame.size.width - 25, y:30 ,width:20 , height:25))
        imgVwArrow.image = UIImage(named: "discloserarrow")
        self.vwBackgroundVw.addSubview(imgVwArrow)

        btnDelete = UIButton(frame: CGRect(x:-65, y:0 ,width:60 , height:84))
        btnDelete.backgroundColor = UIColor.redColor()
        btnDelete .setTitle("Delete", forState:UIControlState.Normal)
        self.vwBackgroundVw.addSubview(btnDelete)

        if (vwDescription != nil) {
            vwDescription.removeFromSuperview()
            vwDescription = nil
        }
        vwDescription  = UIView(frame: CGRect(x:imgVwLogo.frame.size.width+imgVwLogo.frame.origin.x, y:4, width:self.vwBackgroundVw.frame.size.width - (self.imgVwLogo.frame.size.width + 5), height:heightOfVw-1))
        self.vwBackgroundVw.addSubview(vwDescription)

        var lblProjectName: UILabel! = UILabel(frame:CGRect(x:10, y:3,width:150 , height:30))
        lblProjectName.font = UIFont(name: "Helvetica-Light", size:20)
        lblProjectName.textAlignment = NSTextAlignment.Left;
        lblProjectName.text = project.projectName
        vwDescription.addSubview(lblProjectName)

        var lblDuedateHeading: UILabel! = UILabel(frame:CGRect(x:lblProjectName.frame.origin.x, y:lblProjectName.frame.origin.y+29,width:40 , height:30))
        lblDuedateHeading.text = "Due:"
        lblDuedateHeading.font = UIFont(name: "Helvetica-Light", size: 15)
        vwDescription.addSubview(lblDuedateHeading)

        var lblDueDate: UILabel! = UILabel(frame:CGRect(x:lblDuedateHeading.frame.origin.x+40, y:lblDuedateHeading.frame.origin.y+1,width:80 , height:30))
        lblDueDate.font = UIFont(name: "Helvetica-Light", size: 12)
        lblDueDate.text = project.projectDueDate
        vwDescription.addSubview(lblDueDate)

        var progressBar:UIProgressView! = UIProgressView(frame: CGRect(x:lblDuedateHeading.frame.origin.x, y:lblDueDate.frame.origin.y+40,width:self.vwDescription.frame.size.width - 60,height:2))
        progressBar.tintColor = UIColor.blueColor()
        vwDescription.addSubview(progressBar)

        var lblProgress: UILabel! = UILabel (frame:CGRect(x:progressBar.frame.size.width+20, y:lblDueDate.frame.origin.y+30,width:40,height:20))
        lblProgress.text = "0%"
        lblProgress.font = UIFont(name: "Helvetica-Light", size: 12)
        vwDescription.addSubview(lblProgress)

        var dotView: UIView! = UIView(frame:CGRect(x:lblProgress.frame.origin.x+24, y:lblDueDate.frame.origin.y+33,width:12,height:12))
        dotView.backgroundColor = UIColor.redColor()
        dotView.layer.cornerRadius = 2;
        dotView.layer.borderWidth = 0.5;
        var dotcolor:UIColor = UIColor(red: 0, green: 0, blue: 0, alpha:0.2)
        dotView.layer.borderColor = dotcolor.CGColor
        vwDescription.addSubview(dotView)
    }

  @IBAction func handleDeleteButtonAction (sender:UIButton){
    
  }
  
  override func setSelected(selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
    
    // Configure the view for the selected stat
  }

}
