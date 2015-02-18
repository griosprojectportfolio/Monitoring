//
//  CustomTextFieldBlurView.swift
//  Monitoring
//
//  Created by GrepRuby on 17/02/15.
//  Copyright (c) 2015 GrepRuby. All rights reserved.
//

import UIKit


class CustomTextFieldBlurView: UITextField {

    // weak var txtFld: UITextField!

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    init(frame: CGRect, imgName:String) {

        super.init(frame: frame)

        self.addBlurViewWithTextField(imgName)
    }


    func addBlurViewWithTextField(imgName: String) {

         if (countElements(imgName) != 0) {

            var imageName = imgName
            var image = UIImage(named:imageName)
            var imageView = UIImageView(image: image!)
            imageView.frame = CGRect(x: 11, y: 11, width: 22, height: 22)
            imageView.contentMode = UIViewContentMode.ScaleAspectFit

            var vwImage = UIView(frame:CGRect(x: 0, y: 0, width: 44, height: 44))
            vwImage.addSubview(imageView)

            self.leftView = vwImage
            self.leftViewMode = UITextFieldViewMode.Always;
            self.font = UIFont(name: "Palatino", size: 17.0)
            self.textColor = UIColor.whiteColor()
            self.clearButtonMode = UITextFieldViewMode.WhileEditing;

            var blur:UIBlurEffect = UIBlurEffect(style: UIBlurEffectStyle.Light)//ExtraLight
            var effectView:UIVisualEffectView = UIVisualEffectView (effect: blur)
            effectView.frame = CGRect(x: 0, y: 0, width: self.frame.size.width, height: self.frame.size.height)
            self.addSubview(effectView)
         } else {

            var vwImage = UIView(frame:CGRect(x: 0, y: 0, width: 10, height: 5))
            self.leftView = vwImage
            self.leftViewMode = UITextFieldViewMode.Always;

            var blur:UIBlurEffect = UIBlurEffect(style: UIBlurEffectStyle.Light)//ExtraLight
            var effectView:UIVisualEffectView = UIVisualEffectView (effect: blur)
            effectView.frame = CGRect(x: 0, y: 0, width: self.frame.size.width, height: self.frame.size.height)
            self.addSubview(effectView)
        }

    }
}


//            var imageVwBackground = UIImageView(frame:CGRect(x: 0, y: 0, width: self.frame.size.width, height: self.frame.size.height))
//            imageVwBackground.backgroundColor = UIColor.whiteColor()
//            imageVwBackground.alpha = 0.2;

//               self.addSubview(imageVwBackground)
//
