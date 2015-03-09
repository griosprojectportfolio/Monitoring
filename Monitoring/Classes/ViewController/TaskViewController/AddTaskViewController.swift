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
  var visualEffectVwTaskName:UIVisualEffectView!
  var visualEffectVwTaskAssign:UIVisualEffectView!
  var visualEffectVwDescription:UIVisualEffectView!
  
  var addTaskButton:CustomButton!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    //self.navigationController?.navigationBar.hidden = true
    
    self.backgroundColorOfImageView()
    self.addDefaultContentOnView()
  }
  
  override func viewDidAppear(animated: Bool) {
    super.viewDidAppear(animated)
    self.animationOfTextField()
  }
  
  func addDefaultContentOnView(){
    
    self.title = "Add Task"
    
    self.navigationItem.hidesBackButton = true
    
    var backButton = UIBarButtonItem(title: "Back", style: UIBarButtonItemStyle.Plain, target: self, action: "handleBackButton")
    self.navigationItem.setLeftBarButtonItem(backButton, animated: true)
    
    var frame2:CGRect = CGRect(x:self.view.frame.size.width, y:120, width:self.view.frame.size.width , height: 44)
    taskNameTextFeild = CustomTextFieldBlurView(frame:frame2, imgName:"projectName")
    taskNameTextFeild.userInteractionEnabled = true
    taskNameTextFeild.delegate = self;
    taskNameTextFeild.attributedPlaceholder = NSAttributedString(string:"Task Name",attributes:[NSForegroundColorAttributeName: UIColor(white: 1, alpha: 0.5)])
    
    var blur1:UIBlurEffect = UIBlurEffect(style: UIBlurEffectStyle.Light)//ExtraLight
    visualEffectVwTaskName = UIVisualEffectView (effect: blur1)
    visualEffectVwTaskName.frame = taskNameTextFeild.frame

    self.view.addSubview(visualEffectVwTaskName)
     self.view.addSubview(taskNameTextFeild)
    
    descriptionTextView = UITextView(frame: CGRectMake(frame2.origin.x, frame2.origin.y+frame2.size.height+1, frame2.size.width,88))
    descriptionTextView.backgroundColor = UIColor.clearColor()
    
    var blur2:UIBlurEffect = UIBlurEffect(style: UIBlurEffectStyle.Light)//ExtraLight
    visualEffectVwDescription = UIVisualEffectView (effect: blur2)
    visualEffectVwDescription.frame = descriptionTextView.frame
    
    self.view.addSubview(visualEffectVwDescription)

    self.view.addSubview(visualEffectVwDescription)
    self.view.addSubview(descriptionTextView)

    var placeLabel = UILabel(frame: CGRectMake(descriptionTextView.frame.origin.x+45,(descriptionTextView.frame.size.height-20)/2, 100, 20))
    placeLabel.text="Description"
    placeLabel.font = UIFont(name: "Palatino", size: 17.0)
    placeLabel.textColor = UIColor.lightTextColor()
    descriptionTextView.addSubview(placeLabel)
    self.descriptionTextView.bringSubviewToFront(placeLabel)
    
    
    var frame3:CGRect = CGRect(x:self.view.frame.size.width, y:(descriptionTextView.frame.origin.y+descriptionTextView.frame.size.height+1), width:self.view.frame.size.width , height: 44)
    
    taskAssignTextFeild = CustomTextFieldBlurView(frame:frame3, imgName:"projectName")
    taskAssignTextFeild.userInteractionEnabled = true
    taskAssignTextFeild.delegate = self;
    taskAssignTextFeild.attributedPlaceholder = NSAttributedString(string:"Task Assign",attributes:[NSForegroundColorAttributeName: UIColor(white: 1, alpha: 0.5)])
    
    var blur3:UIBlurEffect = UIBlurEffect(style: UIBlurEffectStyle.Light)//ExtraLight
    visualEffectVwTaskAssign = UIVisualEffectView (effect: blur3)
    visualEffectVwTaskAssign.frame = taskAssignTextFeild.frame
    
    self.view.addSubview(visualEffectVwTaskAssign)
    
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
    gl.colors = [(UIColor(red: 65.0/255.0, green: 104.0/255.0, blue: 183.0/255.0, alpha: 1.0).CGColor), (UIColor(red: 68.0/255.0, green: 136.0/255.0, blue: 224.0/255.0, alpha: 1.0).CGColor),(UIColor(red: 225/255.0, green: 225/255.0, blue: 250/255.0, alpha: 1.0).CGColor)]
    gl.locations = [ 0.0, 1.0]
    self.view.layer.insertSublayer(gl, atIndex: 0)
    gl.frame = self.view.frame;
  }
  
  func animationOfTextField () {
    
    UIView.animateWithDuration(0.3, animations: { () -> Void in
      self.taskNameTextFeild.frame = CGRect(x: 0, y: self.taskNameTextFeild.frame.origin.y, width:self.view.frame.size.width , height: 44)
      self.visualEffectVwTaskName.frame = CGRect(x: 0, y: self.taskNameTextFeild.frame.origin.y, width:self.view.frame.size.width , height: 44)
      }) { (Bool) -> Void in
        
        UIView.animateWithDuration(0.3, animations: { () -> Void in
           self.descriptionTextView.frame = CGRect(x: 0, y: self.descriptionTextView.frame.origin.y, width:self.view.frame.size.width , height: 44)
        self.visualEffectVwDescription.frame = CGRect(x: 0, y: self.descriptionTextView.frame.origin.y, width:self.view.frame.size.width , height:self.descriptionTextView.frame.size.height)
          }) { (Bool) -> Void in
            
            UIView.animateWithDuration(0.3, animations: { () -> Void in
              self.taskAssignTextFeild.frame = CGRect(x:0, y: self.addTaskButton.frame.origin.y, width:self.view.frame.width, height:44)
            })
        }
        

    }
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }


}
