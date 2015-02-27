//
//  CustomSegue.swift
//  Monitoring
//
//  Created by GrepRuby on 20/02/15.
//  Copyright (c) 2015 GrepRuby. All rights reserved.
//

import UIKit

class CustomSegue: UIStoryboardSegue {

  override func perform() {
    self.sourceViewController.presentViewController(self.destinationViewController as UIViewController, animated: false, completion: nil)
  }
  

}
