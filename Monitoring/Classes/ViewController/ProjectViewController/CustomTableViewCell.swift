//
//  CustomTableViewCell.swift
//  Monitoring
//
//  Created by GrepRuby on 18/02/15.
//  Copyright (c) 2015 GrepRuby. All rights reserved.
//

import UIKit

@objc protocol CustomProjectCellDelegate {

    func handleDeleteCell(btnTag:Int)
    func handleSwipeLeft(gestureRecognizer:UISwipeGestureRecognizer)
    func handleSwipeRight(gestureRecognizer:UISwipeGestureRecognizer)
    func handleUpButtonEvent(btnTag:Int)
    func handleDownButtonEvent(btnTag:Int)
}

class CustomTableViewCell: UITableViewCell, UIGestureRecognizerDelegate {

    var delegate:CustomProjectCellDelegate?

    var vwBackgroundVw: UIView!
    var imgVwLogo: UIImageView!
    var vwDescription: UIView!
    var btnDelete:UIButton!
    var btnCellUp:UIButton!
    var btnCellDown:UIButton!
    var currentrow:NSInteger!

    var heightOfVw:CGFloat = 80
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected stat
    }

    func setValueOfProjectList (project:Project,row:Int, frame:CGRect) {

        let leftSwipe = UISwipeGestureRecognizer(target: self, action:"handleSwipeLeft:")
        leftSwipe.direction=UISwipeGestureRecognizerDirection.Left
        self.addGestureRecognizer(leftSwipe)

        let rightSwipe = UISwipeGestureRecognizer(target: self, action:"handleSwipeRight:")
        rightSwipe.direction=UISwipeGestureRecognizerDirection.Right
        self.addGestureRecognizer(rightSwipe)

        println(frame)
      
        self.tag = row
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
        btnDelete.addTarget(self, action: "qwertty", forControlEvents: UIControlEvents.TouchUpInside)
        self.vwBackgroundVw.addSubview(btnDelete)
      
        btnCellUp = UIButton(frame: CGRect(x:btnDelete.frame.origin.x-61, y:0 ,width:60 , height:42))
        btnCellUp.backgroundColor = UIColor.redColor()
        btnCellUp.tag = row
        //btnCellUp .setTitle("Up", forState:UIControlState.Normal)
        btnCellUp.setImage(UIImage(named: "up.png"), forState: UIControlState.Normal)
        btnCellUp.userInteractionEnabled = true
        self.vwBackgroundVw.addSubview(btnCellUp)
          
        btnCellDown = UIButton(frame: CGRect(x:btnDelete.frame.origin.x-61, y:btnCellUp.frame.size.height+1,width:60 , height:42))
        btnCellDown.backgroundColor = UIColor.redColor()
        //btnCellDown .setTitle("Down", forState:UIControlState.Normal)
        btnCellDown.setImage(UIImage(named: "down.png"), forState: UIControlState.Normal)
        self.vwBackgroundVw.addSubview(btnCellDown)

        var panGesture:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "handleTapGesture:")
        panGesture.delegate = self
        self.addGestureRecognizer(panGesture)

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

    //handle gesture
    func handleTapGesture (tapgesture:UITapGestureRecognizer) {
         var point:CGPoint = tapgesture.locationInView(self)
        if (CGRectIntersectsRect(CGRectMake(60, 0, 60, 70),CGRectMake(point.x, point.y, 10, 10))) {
            delegate?.handleDeleteCell(self.tag)
        } else if (CGRectIntersectsRect(CGRectMake(0, 0, 60, 42),CGRectMake(point.x, point.y, 10, 10))) {
            delegate?.handleUpButtonEvent(self.tag)
            self.tag = self.tag-1//update cell index
        } else if (CGRectIntersectsRect(CGRectMake(0, 42, 60, 42),CGRectMake(point.x, point.y, 10, 10))) {
            delegate?.handleDownButtonEvent(self.tag)
            self.tag = self.tag+1//update cell index
        }
    }

    //handle swipe delegate
    func handleSwipeLeft(gestureRecognizer:UISwipeGestureRecognizer) {
       delegate?.handleSwipeLeft(gestureRecognizer)
    }

    func handleSwipeRight(gestureRecognizer:UISwipeGestureRecognizer) {
        delegate?.handleSwipeRight(gestureRecognizer)
    }
}
