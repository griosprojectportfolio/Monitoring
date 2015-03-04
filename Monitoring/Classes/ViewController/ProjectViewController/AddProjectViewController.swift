//
//  AddProjectViewController.swift
//  Monitoring
//
//  Created by GrepRuby on 23/02/15.
//  Copyright (c) 2015 GrepRuby. All rights reserved.
//

import UIKit

class AddProjectViewController: UIViewController,UITextFieldDelegate,CustomButtonDelegate {
  
  
  var projectNameTextField:CustomTextFieldBlurView!
  var dueDateTextField:CustomTextFieldBlurView!
  var addProjectButton:CustomButton!
  
  @IBOutlet weak var blurImageView:UIImageView!
  @IBOutlet weak var addButton:UIButton!

  override func viewDidLoad() {

    super.viewDidLoad()
    self.backgroundColorOfImageView()
    self.title = "Add New Project"
    self.navigationItem.hidesBackButton = true
    
    var naviBackbutton = UIBarButtonItem(title: "Back", style: UIBarButtonItemStyle.Plain, target: self, action: "handelNaviBackButtonAction")
    self.navigationItem.setLeftBarButtonItem(naviBackbutton, animated: true)
    
    self.addBuleEffectImageView()
  }
  
  func handelNaviBackButtonAction(){
    self.navigationController?.popToRootViewControllerAnimated(true)
  }
  
  func addBuleEffectImageView(){
           
    var frame2:CGRect = CGRect(x:self.view.frame.origin.x, y: (self.view.frame.size.height-150)/2, width:self.view.frame.size.width , height: 44)
    projectNameTextField = CustomTextFieldBlurView(frame:frame2, imgName:"projectName")
    projectNameTextField.userInteractionEnabled = true
    projectNameTextField.delegate = self;
    projectNameTextField.attributedPlaceholder = NSAttributedString(string:"Project Name",attributes:[NSForegroundColorAttributeName: UIColor(white: 1, alpha: 0.5)])
    self.view.addSubview(projectNameTextField)
    
    var frame3:CGRect = CGRect(x:frame2.origin.x, y: frame2.origin.y+frame2.height+1, width:self.view.frame.size.width , height: 44)
    dueDateTextField = CustomTextFieldBlurView(frame:frame3, imgName:"duDate2")
    dueDateTextField.userInteractionEnabled = true
    dueDateTextField.delegate = self;
    dueDateTextField.attributedPlaceholder = NSAttributedString(string:"Due Date",attributes:[NSForegroundColorAttributeName: UIColor(white: 1, alpha: 0.5)])
    self.view.addSubview(dueDateTextField)

    addProjectButton = CustomButton(frame:CGRect(x: -1, y: frame3.origin.y + 120, width : self.view.frame.size.width - 50, height:40), imageName:"icon2" ,tag:1,  title:"Sumbit", color:.whiteColor())
    addProjectButton.imageVwBackground.alpha = 0.5
    addProjectButton.delegate = self
    self.view.addSubview(addProjectButton)
  }
  
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }
  
  //Function to set backgroundColor
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

}
