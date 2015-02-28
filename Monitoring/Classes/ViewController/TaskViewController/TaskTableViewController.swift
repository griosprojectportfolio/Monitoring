//
//  TaskTableViewController.swift
//  Monitoring
//
//  Created by GrepRuby on 24/02/15.
//  Copyright (c) 2015 GrepRuby. All rights reserved.
//

import UIKit

class TaskTableViewController: UITableViewController {
  
  @IBOutlet weak var addTaskButton:UIBarButtonItem!
  var i:Int = 1
  var projectFeeds:NSArray = ["Socialintegration","gjhgjhgjhgjhgjhgjhgjhgjhgjhgjhghjghjghjghjgjhghjgjhgjhgjhgjhgjhgjhgjhgjhgjhgjhgjhgjhghjgjhgjhghjghgjhgjhfkldjshglsdkjghfldkjghlkfjdhglskhflkjhlskjhflkgjhslgkdjhslkfjhgklsjfhksjdhgldkfjghlskjhfgldksjhdlkfgjhlsdkjhgklsjghdfkljgh","XYz"]
  
  override func viewDidLoad() {
    super.viewDidLoad()
    var obj = CustomTaskViewCell()
    self.navigationItem.hidesBackButton = true
    self.title = "Task List"
    
    var backButton:UIBarButtonItem = UIBarButtonItem(title: "Back", style: UIBarButtonItemStyle.Plain, target: self, action: "handleBackButtonAction")
    self.navigationItem.setLeftBarButtonItem(backButton, animated: true)
    
  }
  
  func handleBackButtonAction(){
    self.navigationController?.popViewControllerAnimated(true)
  }
  
  
  @IBAction func handleAddButtonAction(sender:UIBarButtonItem){
    
  }
  
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }
  
  override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 1
  }
  
  override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    var cell = tableView.dequeueReusableCellWithIdentifier("taskCell")as CustomTaskViewCell
    
    return cell
  }

//  override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
//    
//    var textsize:NSString = projectFeeds.objectAtIndex(1) as NSString
//    
////    CGRect frame = textsize.boundingRectWithSize(<#size: CGSize#>, options: <#NSStringDrawingOptions#>, attributes: <#[NSObject : AnyObject]!#>, context: <#NSStringDrawingContext!#>)
//    
//    return UITableViewAutomaticDimension
//  }
  
  
}
