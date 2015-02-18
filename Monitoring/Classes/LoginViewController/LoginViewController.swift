//
//  LoginViewController.swift
//  Monitoring
//
//  Created by GrepRuby on 17/02/15.
//  Copyright (c) 2015 GrepRuby. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var gameLabel: UILabel!
    @IBOutlet weak var lblLine: UILabel!

    @IBOutlet weak var btnLogin : UIButton!
    @IBOutlet weak var btnSignUp : UIButton!
    @IBOutlet weak var btnForgotPassword : UIButton!

    @IBOutlet weak var imgVwIcon : UIImageView!


    var textFldEmail:CustomTextFieldBlurView!
    var textFldPassword:CustomTextFieldBlurView!


    @IBOutlet weak var imgVwBackground : UIImageView!

    override func viewDidLoad() {

        super.viewDidLoad()
        self.backgroundColorOfImageView()

        var frame1:CGRect = CGRect(x: 0, y: 230, width:self.view.frame.size.width , height: 44)
        textFldEmail = CustomTextFieldBlurView(frame:frame1, imgName:"message")
        textFldEmail.attributedPlaceholder = NSAttributedString(string:"Email",attributes:[NSForegroundColorAttributeName: UIColor.whiteColor()])
        // textFldEmail.returnKeyType = UIReturnType.Done
        textFldEmail.delegate = self;
        textFldEmail.keyboardType = .EmailAddress
        self.view.addSubview(textFldEmail)

        var frame2:CGRect = CGRect(x: 0, y: frame1.origin.y + 45, width:self.view.frame.size.width , height: 44)
        textFldPassword = CustomTextFieldBlurView(frame:frame2, imgName:"message")
        textFldPassword.delegate = self;
        textFldPassword.attributedPlaceholder = NSAttributedString(string:"Password",attributes:[NSForegroundColorAttributeName: UIColor.whiteColor()])

        //textFldPassword.secureTextEntry = YES
        self.view.addSubview(textFldPassword)

        btnLogin.frame = CGRect(x: -4, y: frame2.origin.y + 70, width : self.view.frame.size.width - 100, height:40)
        btnLogin.layer.cornerRadius = 5.0

        btnSignUp.frame = CGRect(x: (self.view.frame.size.width-200)/2, y: self.view.frame.size.height - 100, width : 200, height:40)
        btnSignUp.layer.cornerRadius = 3.0

        btnForgotPassword.frame = CGRect(x: (self.view.frame.size.width-200)/2, y:self.view.frame.size.height - 50, width : 200, height:40)
        lblLine.frame = CGRect(x: (self.view.frame.size.width-200)/2, y: self.view.frame.size.height - 20, width : 200, height:1)
        //
          self.addblurViewObButton()
    }

   override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
    }


    //Function to set backgroundColor
    func backgroundColorOfImageView() {

        let gl:CAGradientLayer = CAGradientLayer ()
        // gl.colors = [(UIColor(red: 58/255.0, green: 127/255.0, blue: 199/255.0, alpha: 1.0).CGColor), (UIColor(red: 94.0/255.0, green: 219.0/255.0, blue: 223.0/255.0, alpha: 1.0).CGColor),  (UIColor(red: 169.0/255.0, green: 225.0/255.0, blue: 212.0/255.0, alpha: 1.0).CGColor)]

        // gl.colors = [ (UIColor(red: 35.0/255.0, green: 85.0/255.0, blue: 120.0/255.0, alpha: 1.0).CGColor),  (UIColor(red: 53.0/255.0, green: 121.0/255.0, blue: 166.0/255.0, alpha: 1.0).CGColor),(UIColor(red: 200/255.0, green: 212/255.0, blue: 223/255.0, alpha: 1.0).CGColor)]

         gl.colors = [(UIColor(red: 65.0/255.0, green: 104.0/255.0, blue: 183.0/255.0, alpha: 1.0).CGColor), (UIColor(red: 68.0/255.0, green: 136.0/255.0, blue: 224.0/255.0, alpha: 1.0).CGColor),(UIColor(red: 225/255.0, green: 225/255.0, blue: 250/255.0, alpha: 1.0).CGColor)]

        // gl.colors = [ (UIColor(red: 58/255.0, green: 127/255.0, blue: 191/255.0, alpha: 1.0).CGColor),  (UIColor(red: 73/255.0, green: 168/255.0, blue: 199/255.0, alpha: 1.0).CGColor)]

        gl.locations = [ 0.0, 1.0]
        self.imgVwBackground.layer.insertSublayer(gl, atIndex: 0)
        gl.frame = self.imgVwBackground.frame;
    }


    func addblurViewObButton () {

        var blur:UIBlurEffect = UIBlurEffect(style: UIBlurEffectStyle.Light)//ExtraLight
        var effectView:UIVisualEffectView = UIVisualEffectView (effect: blur)
        effectView.frame = CGRect(x: 0, y: 0, width: btnLogin.frame.size.width, height: btnLogin.frame.size.height)
        effectView.layer.cornerRadius = 5.0

        btnLogin.background (effectView)

    }

    func addblurViewObButtonForLinkedIn () {

        var blur:UIBlurEffect = UIBlurEffect(style: UIBlurEffectStyle.Light)//ExtraLight
        var effectView:UIVisualEffectView = UIVisualEffectView (effect: blur)
        effectView.frame = CGRect(x: 0, y: 0, width: btnLogin.frame.size.width, height: btnLogin.frame.size.height)
        effectView.layer.cornerRadius = 5.0

        btnLogin.addSubview(effectView)
        
    }

    func addblurViewObButtonFoeStackOverFlow () {

        var blur:UIBlurEffect = UIBlurEffect(style: UIBlurEffectStyle.Light)//ExtraLight
        var effectView:UIVisualEffectView = UIVisualEffectView (effect: blur)
        effectView.frame = CGRect(x: 0, y: 0, width: btnLogin.frame.size.width, height: btnLogin.frame.size.height)
        effectView.layer.cornerRadius = 5.0

        btnLogin.addSubview(effectView)
        
    }



}
