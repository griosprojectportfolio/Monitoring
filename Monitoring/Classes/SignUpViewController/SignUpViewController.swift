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

        var frame1:CGRect = CGRect(x: 0, y: 200, width:self.view.frame.size.width/2 , height: 44)

        textFldFName = CustomTextFieldBlurView(frame:frame1, imgName:"Name")
        textFldFName.delegate = self;
        textFldFName.attributedPlaceholder = NSAttributedString(string:"First Name",attributes:[NSForegroundColorAttributeName: UIColor(white: 1, alpha: 0.5)])
        self.view.addSubview(textFldFName)

        textFldLName = CustomTextFieldBlurView(frame:CGRect(x: self.view.frame.size.width/2 + 1, y: 200, width:self.view.frame.size.width/2 , height: 44), imgName:"")
        textFldLName.delegate = self;
        textFldLName.attributedPlaceholder = NSAttributedString(string:"Last Name",attributes:[NSForegroundColorAttributeName: UIColor(white: 1, alpha: 0.5)])
        self.view.addSubview(textFldLName)


        textFldEmail = CustomTextFieldBlurView(frame:CGRect(x: 0, y: 200 + 45, width:self.view.frame.size.width , height: 44), imgName:"Email")
        textFldEmail.attributedPlaceholder = NSAttributedString(string:"Email Address",attributes:[NSForegroundColorAttributeName: UIColor(white: 1, alpha: 0.5)])
        textFldEmail.delegate = self;
        textFldEmail.keyboardType = .EmailAddress
        self.view.addSubview(textFldEmail)

        textFldPassword = CustomTextFieldBlurView(frame:CGRect(x: 0, y: 200 + 90, width:self.view.frame.size.width , height: 44), imgName:"password")
        textFldPassword.delegate = self;
        textFldPassword.attributedPlaceholder = NSAttributedString(string:"Choose a Password",attributes:[NSForegroundColorAttributeName: UIColor(white: 1, alpha: 0.5)])
        self.view.addSubview(textFldPassword)

        textFldDOB = CustomTextFieldBlurView(frame:CGRect(x: 0, y: 200 + 135, width:self.view.frame.size.width , height: 44), imgName:"DOB")
        textFldDOB.delegate = self;
        textFldDOB.attributedPlaceholder = NSAttributedString(string:"Date of Birth",attributes:[NSForegroundColorAttributeName: UIColor(white: 1, alpha: 0.5)])
        self.view.addSubview(textFldDOB)

        textFldPhoneNum = CustomTextFieldBlurView(frame:CGRect(x: 0, y: 200 + 180, width:self.view.frame.size.width , height: 44), imgName:"Phone")
        textFldPhoneNum.delegate = self;
        textFldEmail.keyboardType = .NumberPad
        textFldPhoneNum.attributedPlaceholder = NSAttributedString(string:"Phone Number",attributes:[NSForegroundColorAttributeName: UIColor(white: 1, alpha: 0.5)])
        self.view.addSubview(textFldPhoneNum)
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
