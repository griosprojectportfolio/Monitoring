//
//  CustomTextFieldBlurView.swift
//  Monitoring
//
//  Created by GrepRuby on 17/02/15.
//  Copyright (c) 2015 GrepRuby. All rights reserved.
//

import UIKit

@objc protocol CustomButtonDelegate {
    // optional func btnTapped(tag)
}

class CustomButton: UIView {

     var imageVwBackground:UIImageView!

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    init(frame: CGRect, imageName:String ,tag:Int, title:String, color:UIColor) {

        super.init(frame: frame)

        self.addView(imageName, tag:tag, titleBtn:title, color:color)
    }


    func addView(imgName:String, tag:Int,  titleBtn:String, color:UIColor) {

        self.layer.cornerRadius = 4.0
        if (countElements(imgName) != 0) {

            imageVwBackground = UIImageView(frame:CGRect(x: 0, y: 0, width: self.frame.size.width, height: self.frame.size.height))
            imageVwBackground.backgroundColor = color
            self.addSubview(imageVwBackground)
            imageVwBackground.layer.cornerRadius = 4.0
            self.sendSubviewToBack(imageVwBackground)

            var imageVwLogo = UIImageView(frame:CGRect(x: 11, y: 10, width: 22, height: 22))
            var image = UIImage(named:imgName)
            imageVwLogo.image = image
            imageVwLogo.contentMode = .ScaleAspectFit
            self.addSubview(imageVwLogo)

            var btnLogo = UIButton (frame:CGRect(x: 45, y: 0, width: 200, height: 44))
            btnLogo.setTitle(titleBtn, forState: .Normal)
            btnLogo.tag = tag
            btnLogo.titleLabel?.font =  UIFont(name: "Palatino", size: 17.0)
            btnLogo.setTitleColor(UIColor.whiteColor(), forState: .Normal)
            self.addSubview(btnLogo)

        }
    }
}

