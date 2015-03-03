//
//  SideBarViewController.swift
//  Monitoring
//
//  Created by GrepRuby on 02/03/15.
//  Copyright (c) 2015 GrepRuby. All rights reserved.
//

import UIKit


@objc
protocol SideBarlViewControllerDelegate {
  
}

class SideBarViewController: UIViewController {
  
  
  var delegate: SideBarlViewControllerDelegate?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.backgroundColorOfImageView()
  }
  
//  
//  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//    return 2
//  }
  
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }
  
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
