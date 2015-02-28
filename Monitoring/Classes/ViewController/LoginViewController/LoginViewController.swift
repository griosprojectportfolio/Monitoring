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

        var yAxis:CGFloat = 230
        for var iBlurVwCount = 0 ;iBlurVwCount < 2 ; iBlurVwCount++ {
            var blur:UIBlurEffect = UIBlurEffect(style: UIBlurEffectStyle.Light)//ExtraLight
            var visualEffectView:UIVisualEffectView = UIVisualEffectView (effect: blur)
            let color: UIColor! = UIColor(red: 65.0/255.0, green: 104.0/255.0, blue: 183.0/255.0, alpha: 1.0)
            //visualEffectView.backgroundColor = color
            visualEffectView.userInteractionEnabled = true
            visualEffectView.frame = CGRect(x: 0, y:yAxis , width: self.view.frame.size.width, height: 44)
            yAxis = yAxis + 45
            visualEffectView.userInteractionEnabled = true
            self.view.addSubview(visualEffectView)
        }

        var frame1:CGRect = CGRect(x: 0, y: 230, width:self.view.frame.size.width , height: 44)
        textFldEmail = CustomTextFieldBlurView(frame:frame1, imgName:"Email")
        textFldEmail.attributedPlaceholder = NSAttributedString(string:"Email",attributes:[NSForegroundColorAttributeName: UIColor(white: 1, alpha: 0.5)])
        // textFldEmail.returnKeyType = UIReturnType.Done
        textFldEmail.delegate = self;
        textFldEmail.returnKeyType = UIReturnKeyType.Done
        textFldEmail.clearButtonMode = UITextFieldViewMode.Always
        textFldEmail.keyboardType = .EmailAddress
        self.view.addSubview(textFldEmail)

        var frame2:CGRect = CGRect(x: 0, y: frame1.origin.y + 45, width:self.view.frame.size.width , height: 44)
        textFldPassword = CustomTextFieldBlurView(frame:frame2, imgName:"password")
        textFldPassword.delegate = self;
        textFldPassword.attributedPlaceholder = NSAttributedString(string:"Password",attributes:[NSForegroundColorAttributeName: UIColor(white: 1, alpha: 0.5)])
        textFldPassword.secureTextEntry = true
        textFldPassword.returnKeyType = UIReturnKeyType.Done
        textFldPassword.clearButtonMode = UITextFieldViewMode.Always
        self.view.addSubview(textFldPassword)

        //frame: CGRect, imageName:String ,tag:Int, title:String
        btnLogin = CustomButton(frame:CGRect(x: -1, y: frame2.origin.y + 70, width : self.view.frame.size.width - 50, height:40), imageName:"icon2" ,tag:1,  title:"Log Into Monitoring", color:.whiteColor())
        btnLogin.imageVwBackground.alpha = 0.5
        btnLogin.delegate = self
        self.view.addSubview(btnLogin)

        btnLoginStackOver = CustomButton(frame:CGRect(x: -1, y: frame2.origin.y + 112, width : self.view.frame.size.width - 50, height:40) ,imageName:"stack" ,tag:2,  title:"StackOverFlow", color:.orangeColor())
        self.view.addSubview(btnLoginStackOver)

        btnLoginLinkedIn = CustomButton(frame:CGRect(x: -1, y: frame2.origin.y + 154, width : self.view.frame.size.width - 50, height:40) ,imageName:"linkedIn" ,tag:3,  title:"Linked In", color:UIColor(red: 52.0/255.0, green: 112.0/255.0, blue: 163.0/255.0, alpha: 1.0))
        self.view.addSubview(btnLoginLinkedIn)

          btnSignUp.addTarget(self, action: "signUpButtonPressed", forControlEvents: UIControlEvents.TouchUpInside)
      
        //btnSignUp.frame = CGRect(x: (self.view.frame.size.width-100), y: self.view.frame.size.height - 70, width : 100, height:30)
        //btnForgotPassword.frame = CGRect(x: (self.view.frame.size.width-200), y:self.view.frame.size.height - 40, width : 200, height:30)
    }

   override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
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
    }
    else{
      //self.lblMessage.text = "Welcome back!"
    }
  }




}
