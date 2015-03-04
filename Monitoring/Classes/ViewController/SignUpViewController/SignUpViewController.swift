//
//  SignUpViewController.swift
//  Monitoring
//
//  Created by GrepRuby on 18/02/15.
//  Copyright (c) 2015 GrepRuby. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController, UITextFieldDelegate, CustomButtonDelegate {

    @IBOutlet weak var imgVwBackground : UIImageView!

    var textFldFName:CustomTextFieldBlurView!
    var textFldLName:CustomTextFieldBlurView!
    var textFldDOB:CustomTextFieldBlurView!
    var textFldEmail:CustomTextFieldBlurView!
    var textFldPassword:CustomTextFieldBlurView!
    var textFldPhoneNum:CustomTextFieldBlurView!

    var visualEffectVwFirstName:UIVisualEffectView!
    var visualEffectVwLastName:UIVisualEffectView!
    var visualEffectVwEmail:UIVisualEffectView!
    var visualEffectVwPassword:UIVisualEffectView!
    var visualEffectVwDOB:UIVisualEffectView!
    var visualEffectVwPhoneNum:UIVisualEffectView!

    var signUpbutton:CustomButton!

    override func viewDidLoad() {

        super.viewDidLoad()
        self.navigationController?.navigationBarHidden = true
        self.addTestFiled()
        self.backgroundColorOfImageView()
    }

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        self.animationOfTextField()
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
      
        var frame1:CGRect = CGRect(x: self.view.frame.size.width, y: 200, width:self.view.frame.size.width/2 , height: 44)
        textFldFName = CustomTextFieldBlurView(frame:frame1, imgName:"Name")
        textFldFName.delegate = self;
        textFldFName.attributedPlaceholder = NSAttributedString(string:"First Name",attributes:[NSForegroundColorAttributeName: UIColor(white: 1, alpha: 0.5)])
        textFldFName.returnKeyType = UIReturnKeyType.Done
        textFldFName.clearButtonMode = UITextFieldViewMode.Always

        var blur1:UIBlurEffect = UIBlurEffect(style: UIBlurEffectStyle.Light)//ExtraLight
        visualEffectVwFirstName = UIVisualEffectView (effect: blur1)
        visualEffectVwFirstName.frame = textFldFName.frame

        self.view.addSubview(visualEffectVwFirstName)
        self.view.addSubview(textFldFName)

        textFldLName = CustomTextFieldBlurView(frame:CGRect(x: self.view.frame.size.width, y: 200, width:self.view.frame.size.width/2 , height: 44), imgName:"")
        textFldLName.delegate = self;
        textFldLName.attributedPlaceholder = NSAttributedString(string:"Last Name",attributes:[NSForegroundColorAttributeName: UIColor(white: 1, alpha: 0.5)])
        textFldLName.returnKeyType = UIReturnKeyType.Done
        textFldLName.clearButtonMode = UITextFieldViewMode.Always

        visualEffectVwLastName = UIVisualEffectView (effect: blur1)
        visualEffectVwLastName.frame = textFldLName.frame

        self.view.addSubview(visualEffectVwLastName)
        self.view.addSubview(textFldLName)

        textFldEmail = CustomTextFieldBlurView(frame:CGRect(x: self.view.frame.size.width, y: 200 + 45-0.5, width:self.view.frame.size.width , height: 44), imgName:"Email")
        textFldEmail.attributedPlaceholder = NSAttributedString(string:"Email Address",attributes:[NSForegroundColorAttributeName: UIColor(white: 1, alpha: 0.5)])
        textFldEmail.delegate = self;
        textFldEmail.returnKeyType = UIReturnKeyType.Done
        textFldEmail.clearButtonMode = UITextFieldViewMode.Always
        textFldEmail.keyboardType = .EmailAddress

        visualEffectVwEmail = UIVisualEffectView (effect: blur1)
        visualEffectVwEmail.frame = textFldEmail.frame

        self.view.addSubview(visualEffectVwEmail)
        self.view.addSubview(textFldEmail)

        textFldPassword = CustomTextFieldBlurView(frame:CGRect(x: self.view.frame.size.width, y: 200 + 90-0.7, width:self.view.frame.size.width , height: 44), imgName:"password")
        textFldPassword.delegate = self;
        textFldPassword.attributedPlaceholder = NSAttributedString(string:"Choose a Password",attributes:[NSForegroundColorAttributeName: UIColor(white: 1, alpha: 0.5)])
        textFldPassword.secureTextEntry = true
        textFldPassword.returnKeyType = UIReturnKeyType.Done
        textFldPassword.clearButtonMode = UITextFieldViewMode.Always

        visualEffectVwPassword = UIVisualEffectView (effect: blur1)
        visualEffectVwPassword.frame = textFldPassword.frame

        self.view.addSubview(visualEffectVwPassword)
        self.view.addSubview(textFldPassword)

        textFldDOB = CustomTextFieldBlurView(frame:CGRect(x: self.view.frame.size.width, y: 200 + 135-0.9, width:self.view.frame.size.width , height: 44), imgName:"DOB")
        textFldDOB.delegate = self;
        textFldDOB.attributedPlaceholder = NSAttributedString(string:"Date of Birth",attributes:[NSForegroundColorAttributeName: UIColor(white: 1, alpha: 0.5)])
        textFldDOB.keyboardType = UIKeyboardType.NumberPad
        textFldDOB.returnKeyType = UIReturnKeyType.Done
        textFldDOB.clearButtonMode = UITextFieldViewMode.Always

        visualEffectVwDOB = UIVisualEffectView (effect: blur1)
        visualEffectVwDOB.frame = textFldDOB.frame

        self.view.addSubview(visualEffectVwDOB)
        self.view.addSubview(textFldDOB)

        textFldPhoneNum = CustomTextFieldBlurView(frame:CGRect(x: self.view.frame.size.width, y: 200 + 180-1.2, width:self.view.frame.size.width , height: 44), imgName:"Phone")
        textFldPhoneNum.delegate = self;
        textFldPhoneNum.keyboardType = .NumberPad
        textFldPhoneNum.attributedPlaceholder = NSAttributedString(string:"Phone Number",attributes:[NSForegroundColorAttributeName: UIColor(white: 1, alpha: 0.5)])

        visualEffectVwPhoneNum = UIVisualEffectView (effect: blur1)
        visualEffectVwPhoneNum.frame = textFldPhoneNum.frame

        self.view.addSubview(visualEffectVwPhoneNum)
        self.view.addSubview(textFldPhoneNum)

        signUpbutton = CustomButton(frame:CGRect(x: -400, y: self.view.frame.size.height-120, width : self.view.frame.size.width - 50, height:40),    imageName:"icon2" ,tag:1,  title:"Sign Up", color:.whiteColor())
        signUpbutton.imageVwBackground.alpha = 0.5
        signUpbutton.delegate = self
        self.view.addSubview(signUpbutton)

        var signInButton = UIButton(frame: CGRectMake(self.view.frame.size.width-100,self.view.frame.size.height-40,100,40))
        signInButton.setTitle("SignIn", forState: UIControlState.Normal)
      
        signInButton.addTarget(self, action: "showFirstViewController", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(signInButton)
    }

  
    //Mark: SignIn Buttton Pressed
  
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    
    if segue.identifier == "idFirstSegueUnwind" {
      let firstViewController = segue.destinationViewController as LoginViewController
      //firstViewController.lblMessage.text = "You just came back from the 2nd VC"
    }
  }
  

  
  @IBAction func showFirstViewController() {
    self.performSegueWithIdentifier("idFirstSegueUnwind", sender: self)
  }


  
  func backgroundColorOfImageView() {
    
    let gl:CAGradientLayer = CAGradientLayer ()
    gl.colors = [(UIColor(red: 65.0/255.0, green: 104.0/255.0, blue: 183.0/255.0, alpha: 1.0).CGColor), (UIColor(red: 68.0/255.0, green: 136.0/255.0, blue: 224.0/255.0, alpha: 1.0).CGColor),(UIColor(red: 225/255.0, green: 225/255.0, blue: 250/255.0, alpha: 1.0).CGColor)]
    
    gl.locations = [ 0.0, 1.0]
    self.imgVwBackground.layer.insertSublayer(gl, atIndex: 0)
    gl.frame = self.imgVwBackground.frame;
  }
  
 //Mark:Custom Button Pressed
  
  func btnTapped(tag: Int) {
    self.performSegueWithIdentifier("sinuptonavigationRootID", sender: self )
  }

    func animationOfTextField () {

        UIView.animateWithDuration(0.3, animations: { () -> Void in
            self.textFldFName.frame = CGRect(x: 0, y: self.textFldFName.frame.origin.y, width:self.textFldFName.frame.size.width , height: 44)
            self.visualEffectVwFirstName.frame = CGRect(x: 0, y: self.visualEffectVwFirstName.frame.origin.y, width:self.textFldFName.frame.size.width , height: 44)
            }) { (Bool) -> Void in

                UIView.animateWithDuration(0.3, animations: { () -> Void in
                    self.textFldLName.frame = CGRect(x:self.view.frame.size.width/2 + 1, y: self.textFldLName.frame.origin.y, width:self.textFldLName.frame.size.width , height: 44)
                    self.visualEffectVwLastName.frame = CGRect(x: self.view.frame.size.width/2 + 1, y: self.visualEffectVwLastName.frame.origin.y, width:self.textFldLName.frame.size.width , height: 44)
                    }) { (Bool) -> Void in

                        UIView.animateWithDuration(0.3, animations: { () -> Void in
                            self.textFldEmail.frame = CGRect(x: 0, y: self.textFldEmail.frame.origin.y, width:self.view.frame.size.width , height: 44)
                            self.visualEffectVwEmail.frame = CGRect(x: 0, y: self.visualEffectVwEmail.frame.origin.y, width:self.view.frame.size.width , height: 44)
                            }){ (Bool) -> Void in

                                UIView.animateWithDuration(0.3, animations: { () -> Void in
                                    self.textFldPassword.frame = CGRect(x: 0, y: self.textFldPassword.frame.origin.y, width:self.view.frame.size.width , height: 44)
                                    self.visualEffectVwPassword.frame = CGRect(x: 0, y: self.visualEffectVwPassword.frame.origin.y, width:self.view.frame.size.width , height: 44)
                                    }) { (Bool) -> Void in

                                        UIView.animateWithDuration(0.3, animations: { () -> Void in
                                            self.textFldDOB.frame = CGRect(x: 0, y: self.textFldDOB.frame.origin.y, width:self.view.frame.size.width , height: 44)
                                            self.visualEffectVwDOB.frame = CGRect(x: 0, y: self.visualEffectVwDOB.frame.origin.y, width:self.view.frame.size.width , height: 44)
                                            }) { (Bool) -> Void in

                                                UIView.animateWithDuration(0.3, animations: { () -> Void in
                                                    self.textFldPhoneNum.frame = CGRect(x: 0, y: self.textFldPhoneNum.frame.origin.y, width:self.view.frame.size.width , height: 44)
                                                    self.visualEffectVwPhoneNum.frame = CGRect(x: 0, y: self.visualEffectVwPhoneNum.frame.origin.y, width:self.view.frame.size.width , height: 44)
                                                    }) { (Bool)-> Void in
                                                        UIView.animateWithDuration(0.3, animations: { () -> Void in

                                                        self.signUpbutton.frame =  CGRect(x: -2, y: self.view.frame.size.height-120, width : self.view.frame.size.width - 50, height:40)
                                                        })
                                                }
                                        }
                                }
                        }
                }
        }
    }
}
