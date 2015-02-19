//
//  SignUpViewController.swift
//  Monitoring
//
//  Created by GrepRuby on 18/02/15.
//  Copyright (c) 2015 GrepRuby. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController, UITextFieldDelegate  {

    @IBOutlet weak var imgVwBackground : UIImageView!

    var textFldFName:CustomTextFieldBlurView!
    var textFldLName:CustomTextFieldBlurView!
    var textFldDOB:CustomTextFieldBlurView!

    var textFldEmail:CustomTextFieldBlurView!
    var textFldPassword:CustomTextFieldBlurView!
    var textFldPhoneNum:CustomTextFieldBlurView!
  
    var signUpbutton:CustomButton!


    override func viewDidLoad() {

        super.viewDidLoad()
        self.navigationController?.navigationBarHidden = true
        self.addTestFiled()
        self.backgroundColorOfImageView()

    }

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
    }

    override func prefersStatusBarHidden() -> Bool {
        return navigationController?.navigationBarHidden == false
    }

    func addTestFiled () {
      
      var labelTitle = UILabel(frame: CGRectMake((self.view.frame.size.width-100)/2,self.view.frame.origin.y+20,100,50))

      labelTitle.textAlignment = NSTextAlignment.Center
      labelTitle.text = "SignUp"
      labelTitle.textColor = UIColor.whiteColor()
      self.view.addSubview(labelTitle)
  
      
      var profileImageView = UIImageView(frame: CGRectMake((self.view.frame.size.width-100)/2,labelTitle.frame.origin.y+50,100,100))
      profileImageView.image = UIImage(named: "profile.png")
      self.view.addSubview(profileImageView)
      
        var frame1:CGRect = CGRect(x: 0, y: 200, width:self.view.frame.size.width/2 , height: 44)

        textFldFName = CustomTextFieldBlurView(frame:frame1, imgName:"Name")
        textFldFName.delegate = self;
        textFldFName.attributedPlaceholder = NSAttributedString(string:"First Name",attributes:[NSForegroundColorAttributeName: UIColor(white: 1, alpha: 0.5)])
        self.view.addSubview(textFldFName)

        textFldLName = CustomTextFieldBlurView(frame:CGRect(x: self.view.frame.size.width/2 + 1, y: 200, width:self.view.frame.size.width/2 , height: 44), imgName:"")
        textFldLName.delegate = self;
        textFldLName.attributedPlaceholder = NSAttributedString(string:"Last Name",attributes:[NSForegroundColorAttributeName: UIColor(white: 1, alpha: 0.5)])
        self.view.addSubview(textFldLName)


        textFldEmail = CustomTextFieldBlurView(frame:CGRect(x: 0, y: 200 + 45-0.5, width:self.view.frame.size.width , height: 44), imgName:"Email")
        textFldEmail.attributedPlaceholder = NSAttributedString(string:"Email Address",attributes:[NSForegroundColorAttributeName: UIColor(white: 1, alpha: 0.5)])
        textFldEmail.delegate = self;
        textFldEmail.keyboardType = .EmailAddress
        self.view.addSubview(textFldEmail)

        textFldPassword = CustomTextFieldBlurView(frame:CGRect(x: 0, y: 200 + 90-0.7, width:self.view.frame.size.width , height: 44), imgName:"password")
        textFldPassword.delegate = self;
        textFldPassword.attributedPlaceholder = NSAttributedString(string:"Choose a Password",attributes:[NSForegroundColorAttributeName: UIColor(white: 1, alpha: 0.5)])
        self.view.addSubview(textFldPassword)

        textFldDOB = CustomTextFieldBlurView(frame:CGRect(x: 0, y: 200 + 135-0.9, width:self.view.frame.size.width , height: 44), imgName:"DOB")
        textFldDOB.delegate = self;
        textFldDOB.attributedPlaceholder = NSAttributedString(string:"Date of Birth",attributes:[NSForegroundColorAttributeName: UIColor(white: 1, alpha: 0.5)])
        self.view.addSubview(textFldDOB)

        textFldPhoneNum = CustomTextFieldBlurView(frame:CGRect(x: 0, y: 200 + 180-1.2, width:self.view.frame.size.width , height: 44), imgName:"Phone")
        textFldPhoneNum.delegate = self;
        textFldEmail.keyboardType = .NumberPad
        textFldPhoneNum.attributedPlaceholder = NSAttributedString(string:"Phone Number",attributes:[NSForegroundColorAttributeName: UIColor(white: 1, alpha: 0.5)])
        self.view.addSubview(textFldPhoneNum)
      
//      var signUpbutton = UIButton(frame: CGRectMake(-1,self.view.frame.size.height-120,self.view.frame.size.width-50,40))
//      signUpbutton.setTitle("SignUp", forState: UIControlState.Normal)
//      signUpbutton.backgroundColor = UIColor.grayColor()
//      signUpbutton.layer.cornerRadius = 2
//      signUpbutton.layer.borderWidth = 1
//      signUpbutton.layer.masksToBounds = true
      //signUpbutton = CustomButton(frame: CGRectMake(-1,self.view.frame.size.height-120,self.view.frame.size.width-50,40), imageName: nil, tag: nil, title: "SignUp", color:UIColor.blueColor())
      
      signUpbutton = CustomButton(frame:CGRect(x: -1, y: self.view.frame.size.height-120, width : self.view.frame.size.width - 50, height:40), imageName:"icon2" ,tag:1,  title:"Sign Up", color:.whiteColor())
      signUpbutton.imageVwBackground.alpha = 0.5
      self.view.addSubview(signUpbutton)

      
     // signUpbutton.addTarget(self, action:"signUpButtonPressed", forControlEvents: UIControlEvents.TouchUpInside)
      //self.view.addSubview(signUpbutton)
      
      
      var signInButton = UIButton(frame: CGRectMake(self.view.frame.size.width-100,self.view.frame.size.height-40,100,40))
     signInButton.setTitle("SignIn", forState: UIControlState.Normal)
//      signInButton.backgroundColor = UIColor.grayColor()
//      signInButton.layer.cornerRadius = 2
//      signInButton.layer.borderWidth = 1
//      signInButton.layer.masksToBounds = true
      
     signInButton.addTarget(self, action: "signInButtonPressed", forControlEvents: UIControlEvents.TouchUpInside)
      self.view.addSubview(signInButton)
      
    }
  
  //Mark: SignIn Buttton Pressed
  
  func signUpButtonPressed(){
    let projectListVC = self.storyboard?.instantiateViewControllerWithIdentifier("ProjectList")as ProjectTableViewController
   self.navigationController?.pushViewController(projectListVC, animated: true)
  }
  
 //Mark: SignIn Buttton Pressed
  
  func signInButtonPressed(){
   self.navigationController?.popViewControllerAnimated(true)
  }

    func backgroundColorOfImageView() {

        let gl:CAGradientLayer = CAGradientLayer ()
        gl.colors = [(UIColor(red: 65.0/255.0, green: 104.0/255.0, blue: 183.0/255.0, alpha: 1.0).CGColor), (UIColor(red: 68.0/255.0, green: 136.0/255.0, blue: 224.0/255.0, alpha: 1.0).CGColor),(UIColor(red: 225/255.0, green: 225/255.0, blue: 250/255.0, alpha: 1.0).CGColor)]

        gl.locations = [ 0.0, 1.0]
        self.imgVwBackground.layer.insertSublayer(gl, atIndex: 0)
        gl.frame = self.imgVwBackground.frame;
    }

    @IBAction func backBtnTapped(sender: UIButton) {

        self.navigationController?.popViewControllerAnimated(true)

    }

}
