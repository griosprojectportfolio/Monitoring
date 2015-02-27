//
//  AddTaskViewController.swift
//  Monitoring
//
//  Created by GrepRuby on 25/02/15.
//  Copyright (c) 2015 GrepRuby. All rights reserved.
//

import UIKit

class AddTaskViewController: UIViewController,UITextFieldDelegate,UITextViewDelegate,CustomButtonDelegate{
  
  var taskNameTextFeild:CustomTextFieldBlurView!
  var taskAssignTextFeild:CustomTextFieldBlurView!
  var descriptionTextView:UITextView!
  
  var addTaskButton:CustomButton!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    //self.navigationController?.navigationBar.hidden = true
    
    self.backgroundColorOfImageView()
    self.addDefaultContentOnView()
  }
  
  func addDefaultContentOnView(){
    
    self.title = "Add Task"
    
    self.navigationItem.hidesBackButton = true
    
    var backButton = UIBarButtonItem(title: "Back", style: UIBarButtonItemStyle.Plain, target: self, action: "handleBackButton")
    self.navigationItem.setLeftBarButtonItem(backButton, animated: true)
    
    var frame2:CGRect = CGRect(x:self.view.frame.origin.x, y: (self.view.frame.size.height-150)/3, width:self.view.frame.size.width , height: 44)
    taskNameTextFeild = CustomTextFieldBlurView(frame:frame2, imgName:"projectName")
    taskNameTextFeild.userInteractionEnabled = true
    taskNameTextFeild.delegate = self;
    taskNameTextFeild.attributedPlaceholder = NSAttributedString(string:"Task Name",attributes:[NSForegroundColorAttributeName: UIColor(white: 1, alpha: 0.5)])
    self.view.addSubview(taskNameTextFeild)
    
    
    descriptionTextView = UITextView(frame: CGRectMake(frame2.origin.x, frame2.origin.y+frame2.size.height+1, frame2.size.width,88))
   // descriptionTextView.backgroundColor = UIColor(red: 115/255.0, green:155/255.0, blue:255/255.0, alpha:1)
    
   // descriptionTextView.backgroundColor = UIColor.blueColor()
    
    let gl:CAGradientLayer = CAGradientLayer ()
    gl.colors = [(UIColor(red: 65.0/255.0, green: 104.0/255.0, blue: 183.0/255.0, alpha: 1.0).CGColor), (UIColor(red: 68.0/255.0, green: 136.0/255.0, blue: 224.0/255.0, alpha: 1.0).CGColor),(UIColor(red: 225/255.0, green: 225/255.0, blue: 250/255.0, alpha: 1.0).CGColor)]

    gl.locations = [ 0.0, 1.0]
    descriptionTextView.layer.insertSublayer(gl, atIndex: 0)
    gl.frame = descriptionTextView.bounds;
    
   self.view.addSubview(descriptionTextView)

    
    var blur:UIBlurEffect = UIBlurEffect(style: UIBlurEffectStyle.Light)//ExtraLight
    var effectView:UIVisualEffectView = UIVisualEffectView (effect: blur)
    //effectView.frame = CGRect(x: 0, y: 0, width:descriptionTextView.frame.size.width, height:descriptionTextView.frame.size.height)
    effectView.frame = CGRect(x: 0, y: 0, width:320, height:descriptionTextView.frame.size.height)
    self.descriptionTextView.addSubview(effectView)
    self.descriptionTextView.bringSubviewToFront(effectView)
    
    var placeLabel = UILabel(frame: CGRectMake(descriptionTextView.frame.origin.x+45,(descriptionTextView.frame.size.height-20)/2, 100, 20))
    placeLabel.text="Description"
    placeLabel.font = UIFont(name: "Palatino", size: 17.0)
    placeLabel.textColor = UIColor.lightTextColor()
    descriptionTextView.addSubview(placeLabel)
    self.descriptionTextView.bringSubviewToFront(placeLabel)
    
    
    var frame3:CGRect = CGRect(x:self.view.frame.origin.x, y:(descriptionTextView.frame.origin.y+descriptionTextView.frame.size.height+1), width:self.view.frame.size.width , height: 44)
    taskAssignTextFeild = CustomTextFieldBlurView(frame:frame3, imgName:"projectName")
    taskAssignTextFeild.userInteractionEnabled = true
    taskAssignTextFeild.delegate = self;
    taskAssignTextFeild.attributedPlaceholder = NSAttributedString(string:"Task Assign",attributes:[NSForegroundColorAttributeName: UIColor(white: 1, alpha: 0.5)])
    self.view.addSubview(taskAssignTextFeild)
    
    addTaskButton = CustomButton(frame:CGRect(x: -1, y: frame3.origin.y + 120, width : self.view.frame.size.width - 50, height:40), imageName:"icon2" ,tag:1,  title:"Add", color:.whiteColor())
    addTaskButton.imageVwBackground.alpha = 0.5
    addTaskButton.delegate = self
    self.view.addSubview(addTaskButton)


  }
  
  func handleBackButton(){
    self.navigationController?.popViewControllerAnimated(true)
  }
  
  func backgroundColorOfImageView() {
    
    let gl:CAGradientLayer = CAGradientLayer ()
    // gl.colors = [(UIColor(red: 58/255.0, green: 127/255.0, blue: 199/255.0, alpha: 1.0).CGColor), (UIColor(red: 94.0/255.0, green: 219.0/255.0, blue: 223.0/255.0, alpha: 1.0).CGColor),  (UIColor(red: 169.0/255.0, green: 225.0/255.0, blue: 212.0/255.0, alpha: 1.0).CGColor)]
    
    // gl.colors = [ (UIColor(red: 35.0/255.0, green: 85.0/255.0, blue: 120.0/255.0, alpha: 1.0).CGColor),  (UIColor(red: 53.0/255.0, green: 121.0/255.0, blue: 166.0/255.0, alpha: 1.0).CGColor),(UIColor(red: 200/255.0, green: 212/255.0, blue: 223/255.0, alpha: 1.0).CGColor)]
    
    gl.colors = [(UIColor(red: 65.0/255.0, green: 104.0/255.0, blue: 183.0/255.0, alpha: 1.0).CGColor), (UIColor(red: 68.0/255.0, green: 136.0/255.0, blue: 224.0/255.0, alpha: 1.0).CGColor),(UIColor(red: 225/255.0, green: 225/255.0, blue: 250/255.0, alpha: 1.0).CGColor)]
    
    // gl.colors = [ (UIColor(red: 58/255.0, green: 127/255.0, blue: 191/255.0, alpha: 1.0).CGColor),  (UIColor(red: 73/255.0, green: 168/255.0, blue: 199/255.0, alpha: 1.0).CGColor)]
    
    gl.locations = [ 0.0, 1.0]
    self.view.layer.insertSublayer(gl, atIndex: 0)
    gl.frame = self.view.frame;
  }

  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }


}
