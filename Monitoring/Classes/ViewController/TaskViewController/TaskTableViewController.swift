//
//  TaskTableViewController.swift
//  Monitoring
//
//  Created by GrepRuby on 24/02/15.
//  Copyright (c) 2015 GrepRuby. All rights reserved.
//

import UIKit

class TaskTableViewController: UIViewController , UITableViewDataSource, UITableViewDelegate {
  
    var addTaskButton:UIBarButtonItem!
    @IBOutlet weak var tbleVwTask:UITableView!
    var objPaperFoldVC:PaperFoldMenuController!
    var appDelegateObj:AppDelegate = UIApplication.sharedApplication().delegate as AppDelegate
    var arryTaskList:[Task]!

    override func viewDidLoad() {
        super.viewDidLoad()
        var obj = CustomTaskViewCell()
        self.navigationItem.hidesBackButton = true
        self.title = "Task List"

        let taskList = [Task(taskName:"Task Name 1", taskDueDate: "15/02/2015", taskAssignTo: "qwertyuiop"), Task(taskName:"Task Name 1", taskDueDate: "15/02/2015", taskAssignTo: "qwertyuiop"), Task(taskName:"Task Name 1", taskDueDate: "15/02/2015", taskAssignTo: "qwertyuiop"), Task(taskName:"Task Name 1", taskDueDate: "15/02/2015", taskAssignTo: "qwertyuiop"), Task(taskName:"Task Name 1", taskDueDate: "15/02/2015", taskAssignTo: "qwertyuiop"), Task(taskName:"Task Name 1", taskDueDate: "15/02/2015", taskAssignTo: "qwertyuiop")]
        arryTaskList = taskList

        self.navigationController?.navigationBar.barTintColor = UIColor(red: 65.0/255.0, green: 104.0/255.0, blue: 183.0/255.0, alpha: 1.0)
        UINavigationBar.appearance().titleTextAttributes = [NSForegroundColorAttributeName : UIColor.whiteColor()]
        UINavigationBar.appearance().tintColor = UIColor.whiteColor()

        var backButton:UIBarButtonItem = UIBarButtonItem(title: "sideBar", style: UIBarButtonItemStyle.Plain, target: self, action: "sideBarBtnTapped:")
        self.navigationItem.setLeftBarButtonItem(backButton, animated: true)
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        appDelegateObj.isTogglrSideBar = false

        //arryTaskList.removeAll(keepCapacity: true)
        //println(arryProject)
        //self.getTaskList()
    }

    //MARk - Send request to get task list
    func getTaskList () {
        var params:Dictionary<String, String> = ["AuthenticationId":"", "projectId":""]
        SharedAFHTTPManager.sharedAFHTTPManager().getCallRequest("_FetchTaskList", param:params, ownerClassRef: self, success: "successInResult", failure:"failureInResult")
    }

    func successInResult(timer: NSTimer) {
        if let dictResponce = timer.userInfo as Dictionary<String, AnyObject>? {
            for (key, value) in dictResponce {
                var key:String = key
                let task = Task(taskName: dictResponce[key]  as String, taskDueDate: dictResponce[key] as String, taskAssignTo: dictResponce[key] as String)
                arryTaskList.append(task)
            }
        }
    }

    func handleBackButtonAction(){
        self.navigationController?.popViewControllerAnimated(true)
    }
  
    func handleRightNaviButtonAction(){
        var vc = self.storyboard?.instantiateViewControllerWithIdentifier("AddTaskView") as AddTaskViewController
        self.navigationController?.pushViewController(vc, animated: true)
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
        return arryTaskList.count
    }
  
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("taskCell")as CustomTaskViewCell

        let taskInfo = arryTaskList[indexPath.row] as Task
        cell.setValueOfTaskList(self.tbleVwTask.frame, taskInfo:taskInfo)
        return cell
    }

    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 86
    }
}
