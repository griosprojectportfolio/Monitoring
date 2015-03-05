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
    var objPaperFoldVC:PaperFoldMenuController!
    var appDelegateObj:AppDelegate = UIApplication.sharedApplication().delegate as AppDelegate

  var projectFeeds:NSArray = ["Socialintegration","gjhgjhgjhgjhgjhgjhgjhgjhgjhgjhghjghjghjghjgjhghjgjhgjhgjhgjhgjhgjhgjhgjhgjhgjhgjhgjhghjgjhgjhghjghgjhgjhfkldjshglsdkjghfldkjghlkfjdhglskhflkjhlskjhflkgjhslgkdjhslkfjhgklsjfhksjdhgldkfjghlskjhfgldksjhdlkfgjhlsdkjhgklsjghdfkljgh","XYz"]
  
  override func viewDidLoad() {
    super.viewDidLoad()
    var obj = CustomTaskViewCell()
    self.navigationItem.hidesBackButton = true
    self.title = "Task List"

    self.navigationController?.navigationBar.barTintColor = UIColor(red: 65.0/255.0, green: 104.0/255.0, blue: 183.0/255.0, alpha: 1.0)

    UINavigationBar.appearance().titleTextAttributes = [NSForegroundColorAttributeName : UIColor.whiteColor()]
    UINavigationBar.appearance().tintColor = UIColor.whiteColor()

    var backButton:UIBarButtonItem = UIBarButtonItem(title: "sideBar", style: UIBarButtonItemStyle.Plain, target: self, action: "sideBarBtnTapped:")
    self.navigationItem.setLeftBarButtonItem(backButton, animated: true)
  }

  func handleBackButtonAction(){
    self.navigationController?.popViewControllerAnimated(true)
  }

    override func viewWillAppear(animated: Bool) {
        appDelegateObj.isTogglrSideBar = false
    }

    @IBAction func sideBarBtnTapped (sender:UIButton){
        if (appDelegateObj.isTogglrSideBar == true) {
            appDelegateObj.isTogglrSideBar = false
            self.objPaperFoldVC.sideBarbtntapped(appDelegateObj.isTogglrSideBar)
        } else {
            appDelegateObj.isTogglrSideBar = true
            self.objPaperFoldVC.sideBarbtntapped(appDelegateObj.isTogglrSideBar)
        }
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
