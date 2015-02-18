//
//  CustomTableViewCell.swift
//  Monitoring
//
//  Created by GrepRuby on 18/02/15.
//  Copyright (c) 2015 GrepRuby. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
  
  @IBOutlet weak var projectName: UILabel!
  @IBOutlet weak var dueDate: UILabel!
  @IBOutlet weak var logoimage: UIImageView!
  @IBOutlet weak var mainView: UIView!
  @IBOutlet weak var dotView: UIView!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    // Initialization code
    
    logoimage.frame = CGRect(x:self.contentView.frame.origin.x, y:self.contentView.frame.origin.y,width:90 , height:100)
    
    
    mainView.frame = CGRect(x:self.contentView.frame.origin.x-logoimage.frame.size.width-30, y:logoimage.frame.origin.y+self.contentView.frame.origin.y, width :180, height:logoimage.frame.size.height)
    
  }
  
  override func setSelected(selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
    
    // Configure the view for the selected stat
  }
  


}
