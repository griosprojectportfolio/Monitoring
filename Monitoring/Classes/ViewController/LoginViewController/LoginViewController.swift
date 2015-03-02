//
//  LoginViewController.swift
//  Monitoring
//
//  Created by GrepRuby on 17/02/15.
//  Copyright (c) 2015 GrepRuby. All rights reserved.
//

import UIKit

class LoginViewController:UIViewController, UITextFieldDelegate, CustomButtonDelegate {

   let sourceViewController:LoginViewController!
   let destinationViewController:SignUpViewController!
  
    @IBOutlet weak var gameLabel: UILabel!
    @IBOutlet weak var lblLine: UILabel!

    var visualEffectVwEmail:UIVisualEffectView!
    var visualEffectVwPasswrd:UIVisualEffectView!

    var btnLogin : CustomButton!
    var btnLoginStackOver : CustomButton!
    var btnLoginLinkedIn : CustomButton!

    @IBOutlet weak var btnSignUp : UIButton!
    @IBOutlet weak var btnForgotPassword : UIButton!

    @IBOutlet weak var imgVwIcon : UIImageView!
    @IBOutlet weak var imgVwBackground : UIImageView!

    var textFldEmail:CustomTextFieldBlurView!
    var textFldPassword:CustomTextFieldBlurView!


    override func viewDidLoad() {

        super.viewDidLoad()
       self.navigationController?.navigationBarHidden = true
        self.backgroundColorOfImageView()

        self.navigationController?.navigationBarHidden = true

        var blur:UIBlurEffect = UIBlurEffect(style: UIBlurEffectStyle.Light)//ExtraLight
        visualEffectVwEmail =  UIVisualEffectView (effect: blur)
        let color: UIColor! = UIColor(red: 65.0/255.0, green: 104.0/255.0, blue: 183.0/255.0, alpha: 1.0)
        //visualEffectView.backgroundColor = color
        visualEffectVwEmail.userInteractionEnabled = true
        visualEffectVwEmail.frame = CGRect(x: self.view.frame.size.width, y:230 , width: self.view.frame.size.width, height: 44)
        visualEffectVwEmail.userInteractionEnabled = true
        self.view.addSubview(visualEffectVwEmail)

        var frameEmail:CGRect = CGRect(x: self.view.frame.size.width, y: self.visualEffectVwEmail.frame.origin.y, width:self.view.frame.size.width , height: 44)
        textFldEmail = CustomTextFieldBlurView(frame:frameEmail, imgName:"Email")
        textFldEmail.attributedPlaceholder = NSAttributedString(string:"Email",attributes:[NSForegroundColorAttributeName: UIColor(white: 1, alpha: 0.5)])
        // textFldEmail.returnKeyType = UIReturnType.Done
        textFldEmail.delegate = self;
        textFldEmail.returnKeyType = UIReturnKeyType.Done
        textFldEmail.clearButtonMode = UITextFieldViewMode.Always
        textFldEmail.keyboardType = .EmailAddress
        self.view.addSubview(textFldEmail)

        var blur1:UIBlurEffect = UIBlurEffect(style: UIBlurEffectStyle.Light)//ExtraLight
        visualEffectVwPasswrd = UIVisualEffectView (effect: blur1)
        visualEffectVwPasswrd.userInteractionEnabled = true
        visualEffectVwPasswrd.frame = CGRect(x: self.view.frame.size.width, y:frameEmail.origin.y + 45 ,width: self.view.frame.size.width, height: 44)
        visualEffectVwPasswrd.userInteractionEnabled = true
        self.view.addSubview(visualEffectVwPasswrd)

        var frame2:CGRect = CGRect(x: self.view.frame.size.width, y:visualEffectVwPasswrd.frame.origin.y , width:self.view.frame.size.width , height: 44)
        textFldPassword = CustomTextFieldBlurView(frame:frame2, imgName:"password")
        textFldPassword.delegate = self;
        textFldPassword.attributedPlaceholder = NSAttributedString(string:"Password",attributes:[NSForegroundColorAttributeName: UIColor(white: 1, alpha: 0.5)])
        textFldPassword.secureTextEntry = true
        textFldPassword.returnKeyType = UIReturnKeyType.Done
        textFldPassword.clearButtonMode = UITextFieldViewMode.Always
        self.view.addSubview(textFldPassword)

        //frame: CGRect, imageName:String ,tag:Int, title:String
        btnLogin = CustomButton(frame:CGRect(x: -self.view.frame.size.width, y: frame2.origin.y + 70, width : self.view.frame.size.width - 50, height:40), imageName:"icon2" ,tag:1,  title:"Log Into Monitoring", color:.whiteColor())
        btnLogin.imageVwBackground.alpha = 0.5
        btnLogin.delegate = self
        self.view.addSubview(btnLogin)

        btnLoginStackOver = CustomButton(frame:CGRect(x: -self.view.frame.size.width, y: frame2.origin.y + 112, width : self.view.frame.size.width - 50, height:40) ,imageName:"stack" ,tag:2,  title:"StackOverFlow", color:.orangeColor())
        self.view.addSubview(btnLoginStackOver)

        btnLoginLinkedIn = CustomButton(frame:CGRect(x: -self.view.frame.size.width, y: frame2.origin.y + 154, width : self.view.frame.size.width - 50, height:40) ,imageName:"linkedIn" ,tag:3,  title:"Linked In", color:UIColor(red: 52.0/255.0, green: 112.0/255.0, blue: 163.0/255.0, alpha: 1.0))
        self.view.addSubview(btnLoginLinkedIn)

          btnSignUp.addTarget(self, action: "signUpButtonPressed", forControlEvents: UIControlEvents.TouchUpInside)
      
        //btnSignUp.frame = CGRect(x: (self.view.frame.size.width-100), y: self.view.frame.size.height - 70, width : 100, height:30)
        //btnForgotPassword.frame = CGRect(x: (self.view.frame.size.width-200), y:self.view.frame.size.height - 40, width : 200, height:30)
    }

   override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        self.animationOfTextField()
    }

    override func prefersStatusBarHidden() -> Bool {
        return navigationController?.navigationBarHidden == false
    }
  
    func textFieldShouldBeginEditing(textField: UITextField) -> Bool {
        return true
    }

    func textFieldShouldEndEditing(textField: UITextField) -> Bool {
        return true
    }

  //MARK:SignUp Button Pressed
  
    func signUpButtonPressed(){
        self.performSegueWithIdentifier("idFirstSegue", sender: self)
    }

    func loginButtonPressed(){
        let secondViewController = self.storyboard?.instantiateViewControllerWithIdentifier("tableviewid") as ProjectTableViewController
        self.navigationController?.pushViewController(secondViewController, animated: true)
      }

  
    //Function to set backgroundColor
    func backgroundColorOfImageView() {

        let gl:CAGradientLayer = CAGradientLayer ()
      
       gl.colors = [(UIColor(red: 65.0/255.0, green: 104.0/255.0, blue: 183.0/255.0, alpha: 1.0).CGColor), (UIColor(red: 68.0/255.0, green: 136.0/255.0, blue: 224.0/255.0, alpha: 1.0).CGColor),(UIColor(red: 225/255.0, green: 225/255.0, blue: 250/255.0, alpha: 1.0).CGColor)]
      
        // gl.colors = [(UIColor(red: 58/255.0, green: 127/255.0, blue: 199/255.0, alpha: 1.0).CGColor), (UIColor(red: 94.0/255.0, green: 219.0/255.0, blue: 223.0/255.0, alpha: 1.0).CGColor),  (UIColor(red: 169.0/255.0, green: 225.0/255.0, blue: 212.0/255.0, alpha: 1.0).CGColor)]

        // gl.colors = [ (UIColor(red: 35.0/255.0, green: 85.0/255.0, blue: 120.0/255.0, alpha: 1.0).CGColor),  (UIColor(red: 53.0/255.0, green: 121.0/255.0, blue: 166.0/255.0, alpha: 1.0).CGColor),(UIColor(red: 200/255.0, green: 212/255.0, blue: 223/255.0, alpha: 1.0).CGColor)]

        // gl.colors = [(UIColor(red: 65.0/255.0, green: 104.0/255.0, blue: 183.0/255.0, alpha: 1.0).CGColor), (UIColor(red: 68.0/255.0, green: 136.0/255.0, blue: 224.0/255.0, alpha: 1.0).CGColor),(UIColor(red: 225/255.0, green: 225/255.0, blue: 250/255.0, alpha: 1.0).CGColor)]
        self.imgVwBackground.layer.insertSublayer(gl, atIndex: 0)
        gl.frame = self.imgVwBackground.frame;
    }

    func addblurViewOnLoginButton () {

        var blur:UIBlurEffect = UIBlurEffect(style: UIBlurEffectStyle.Light)//ExtraLight
        var effectView:UIVisualEffectView = UIVisualEffectView (effect: blur)
        effectView.frame = CGRect(x: 0, y: 0, width: btnLogin.frame.size.width, height: btnLogin.frame.size.height)
        effectView.layer.cornerRadius = 5.0

       // btnLogin.background (effectView)

    }
  
  func btnTapped(tag:Int) {
        
    if(tag == 1){
     
      self.performSegueWithIdentifier("navigationRoot", sender: self)
     
    }
    
  }
  
  
  override func segueForUnwindingToViewController(toViewController: UIViewController, fromViewController: UIViewController, identifier: String?) -> UIStoryboardSegue {
    
    if let id = identifier{
      if id == "idFirstSegueUnwind" {
        let unwindSegue = CustomSegueUnwind(identifier: id, source: fromViewController, destination: toViewController, performHandler: { () -> Void in
          
        })
        return unwindSegue
      }
      else if id == "idSecondSegueUnwind" {
        let unwindSegue = CustomSegueUnwind(identifier: id,
          source: fromViewController,
          destination: toViewController,
          performHandler: { () -> Void in
            
        })
        
        return unwindSegue
      }
    }
    
    return super.segueForUnwindingToViewController(toViewController, fromViewController: fromViewController, identifier: identifier)
  }

  
  @IBAction func returnFromSegueActions(sender: UIStoryboardSegue){

    if sender.identifier == "idFirstSegueUnwind" {
      let originalColor = self.view.backgroundColor
      self.view.backgroundColor = UIColor.redColor()
      
      UIView.animateWithDuration(1.0, animations: { () -> Void in
        self.view.backgroundColor = originalColor
          })
    } else {
          //self.lblMessage.text = "Welcome back!"
    }
  }

    func animationOfTextField () {

        UIView.animateWithDuration(0.2, animations: { () -> Void in
            self.textFldEmail.frame = CGRect(x: 0, y: self.textFldEmail.frame.origin.y, width:self.view.frame.size.width , height: 44)
            self.visualEffectVwEmail.frame = CGRect(x: 0, y: self.visualEffectVwEmail.frame.origin.y, width:self.view.frame.size.width , height: 44)
        }) { (Bool) -> Void in

            UIView.animateWithDuration(0.2, animations: { () -> Void in
            self.textFldPassword.frame = CGRect(x: 0, y: self.textFldPassword.frame.origin.y, width:self.view.frame.size.width , height: 44)
            self.visualEffectVwPasswrd.frame = CGRect(x: 0, y: self.visualEffectVwPasswrd.frame.origin.y, width:self.view.frame.size.width , height: 44)
            }) { (Bool) -> Void in

                UIView.animateWithDuration(0.2, animations: { () -> Void in
                self.btnLogin.frame = CGRect(x: -2, y: self.btnLogin.frame.origin.y, width:self.btnLogin.frame.size.width , height: self.btnLogin.frame.size.height)
                    }){ (Bool) -> Void in

                        UIView.animateWithDuration(0.2, animations: { () -> Void in
                            self.btnLoginStackOver.frame = CGRect(x: -2, y: self.btnLoginStackOver.frame.origin.y, width:self.btnLoginStackOver.frame.size.width , height: self.btnLoginStackOver.frame.size.height)
                            }) { (Bool) -> Void in

                                UIView.animateWithDuration(0.2, animations: { () -> Void in
                                    self.btnLoginLinkedIn.frame = CGRect(x: -2, y: self.btnLoginLinkedIn.frame.origin.y, width:self.btnLoginLinkedIn.frame.size.width , height: self.btnLoginLinkedIn.frame.size.height)
                                })
                        }
                    }
                }
            }

        }
}
