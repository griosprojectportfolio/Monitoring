//
//  CustomTaskViewCell.swift
//  Monitoring
//
//  Created by GrepRuby on 24/02/15.
//  Copyright (c) 2015 GrepRuby. All rights reserved.
//

import UIKit

class CustomTaskViewCell: UITableViewCell {
  
 @IBOutlet weak var mainview :UIView!
  //@IBOutlet weak var subViewOnMainView:UIView!
  
  override func awakeFromNib() {
    super.awakeFromNib()
   
    
  }
  
  
  override func setSelected(selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
    
    // Configure the view for the selected stat
  }
  
}
