//
//  TaskTableViewController.swift
//  Monitoring
//
//  Created by GrepRuby on 24/02/15.
//  Copyright (c) 2015 GrepRuby. All rights reserved.
//

import UIKit

class TaskTableViewController: UIViewController , UITableViewDataSource, UITableViewDelegate {
  
    @IBOutlet weak var addTaskButton:UIBarButtonItem!
    @IBOutlet weak var tbleVwTask:UITableView!

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
  
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 6
  }
  
func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    var cell = tableView.dequeueReusableCellWithIdentifier("taskCell")as CustomTaskViewCell
    cell.contentsDefaultSettings(self.tbleVwTask.frame)
    return cell
  }

    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 90
    }
}
