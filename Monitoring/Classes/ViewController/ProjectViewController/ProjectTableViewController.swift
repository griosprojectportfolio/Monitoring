//
//  ProjectTableViewController.swift
//  Monitoring
//
//  Created by GrepRuby on 18/02/15.
//  Copyright (c) 2015 GrepRuby. All rights reserved.
//

import Foundation
import UIKit

@objc class ProjectTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, CustomProjectCellDelegate {

    var cellobj:CustomTableViewCell!
    @IBOutlet var vwOverTable:UIView!
    @IBOutlet var tableView:UITableView!
    var isRightSwipe : Bool = false
    var arryOfSelectedCell:NSMutableArray = []
    var arryProject:[Project]!
    var objPaperFoldVC:PaperFoldMenuController!
    var btnBarButtonItemRightNavi:UIBarButtonItem!
    var appDelegateObj:AppDelegate = UIApplication.sharedApplication().delegate as AppDelegate

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.whiteColor()
        self.title = "Project List"
        self.navigationController?.navigationBar.hidden = false
        self.tableView.separatorColor = UIColor.clearColor()
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 65.0/255.0, green: 104.0/255.0, blue: 183.0/255.0, alpha: 1.0)
        UINavigationBar.appearance().titleTextAttributes = [NSForegroundColorAttributeName : UIColor.whiteColor()]
        UINavigationBar.appearance().tintColor = UIColor.whiteColor()

        self.navigationController?.navigationBar.translucent = false

        let project = [Project (projectName: "Kindergarton1", projectDueDate: "15/02/2015"),  Project (projectName: "Kindergarton2", projectDueDate: "15/02/2015")
        ,Project (projectName: "Kindergarton3", projectDueDate: "15/02/2015"),Project (projectName: "Kindergarton4", projectDueDate: "15/02/2015"), Project(projectName: "Kindergarton5", projectDueDate: "15/02/2015"), Project (projectName: "Kindergarton6", projectDueDate: "15/02/2015"), Project(projectName: "Kindergarton7", projectDueDate: "15/02/2015"), Project(projectName: "Kindergarton8", projectDueDate: "15/02/2015")]

         arryProject = project
        println(arryProject)
        self.tableView.editing = false
        self.addNavigationRightButton()
        self.insertProjectListFromApi()

    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)

        //arryProject.removeAll(keepCapacity: true)
        //println(arryProject)
        //self.getProjectInformation()
        self.vwOverTable.hidden = true
        self.tableView.hidden = false
        appDelegateObj.isTogglrSideBar = false
    }

    func insertProjectListFromApi() {
        let projectEntity = ProjectEntity.createEntity() as ProjectEntity
        var dictResponse:NSDictionary = self.demoData()
        var arryData:NSArray = dictResponse.objectForKey("data") as NSArray
        println(" **** \(arryData)")
        ProjectEntity.importFromArray(arryData) //  importFromObject:responseObject inContext:localContext];
    }

    func demoData ()-> NSDictionary {

        var data1:NSDictionary = ["id":1,"pName":"project1", "pDueDate":"23/02/2025", "pProgress":"56%"]
        var data2:NSDictionary = ["id":2,"pName":"project1", "pDueDate":"23/02/2025", "pProgress":"56%"]
        var data3:NSDictionary = ["id":3,"pName":"project1", "pDueDate":"23/02/2025", "pProgress":"56%"]
        var data4:NSDictionary = ["id":4,"pName":"project1", "pDueDate":"23/02/2025", "pProgress":"56%"]
        var data5:NSDictionary = ["id":5,"pName":"project1", "pDueDate":"23/02/2025", "pProgress":"56%"]

        var arryProjectList:NSArray = [data1, data2, data3, data4, data5]
        var responseData:NSDictionary = ["data":arryProjectList]
        return responseData
    }

    //MARk - Send request to get project list
    func getProjectInformation () {
        var params:Dictionary<String, String> = ["AuthenticationId":""]
        SharedAFHTTPManager.sharedAFHTTPManager().getCallRequest("_FetchProjectList", param:params, ownerClassRef: self, success: "successInResult", failure:"failureInResult")
    }
    func successInResult(timer: NSTimer) {

        if let dictResponseWithMethod =  timer.userInfo as? NSDictionary{
            var method:NSString = dictResponseWithMethod.valueForKey("method") as NSString
            if let dictResponse = dictResponseWithMethod.valueForKey("response") as? NSDictionary {
                let arryData = dictResponse.valueForKey("data") as? NSArray

                var iLoopCount:Int
                for (iLoopCount=0; iLoopCount<arryData?.count; iLoopCount++) {

                    let dictData:NSDictionary = arryData?.objectAtIndex(iLoopCount) as NSDictionary
                    let project = Project(projectName: dictData.valueForKey("") as String, projectDueDate: dictData.valueForKey("") as String)
                    arryProject.append(project)
                }
            }
        }
    }
  
  //Mark:Add NavigationRightButton
  func addNavigationRightButton(){
    btnBarButtonItemRightNavi = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Add, target: self, action: "handleNaviRightButtonAction")
    //btnBarButtonItemRightNavi.tintColor = UIColor.whiteColor()
    self.navigationItem.setRightBarButtonItem(btnBarButtonItemRightNavi, animated: true)
  }
  
  func handleNaviRightButtonAction(){
  var vc = self.storyboard?.instantiateViewControllerWithIdentifier("AddProject") as AddProjectViewController
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

 @IBAction func addProjectBtnTapped (sender:UIButton){
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    var vwController:AddProjectViewController = storyboard.instantiateViewControllerWithIdentifier("AddProjectStoryBoardID") as AddProjectViewController
    self.navigationController?.pushViewController(vwController, animated:true)
  }
        
    func handleSwipeLeft(gestureRecognizer:UISwipeGestureRecognizer) { //animation to go to next view
        var location = gestureRecognizer.locationInView(self.tableView)
        var indexPath = self.tableView.indexPathForRowAtPoint(location)

        if((indexPath) != nil) {
            var cell:CustomTableViewCell = self.tableView.cellForRowAtIndexPath(indexPath!) as CustomTableViewCell
            cell.isSwipe = false
            //Update the cell or model
    
            let row = indexPath?.row
            let yAxis:CGFloat = CGFloat(row!*90)
    
            UIView.animateWithDuration(0.5, animations: { () -> Void in
                var frame = self.tableView.frame

                for var iLoop:Int = 0 ; iLoop<self.arryOfSelectedCell.count; iLoop++ {
                if (self.arryOfSelectedCell.objectAtIndex(iLoop).integerValue == row ) {
                    cell.vwBackgroundVw.frame = CGRectMake(0 ,cell.vwBackgroundVw.frame.origin.y, frame.size.width, cell.vwBackgroundVw.frame.size.height)
                    self.arryOfSelectedCell.removeObjectAtIndex(iLoop)
                    self.isRightSwipe = true
                    return
                    }
                }
                cell.frame = CGRectMake(-frame.size.width ,cell.frame.origin.y, frame.size.width, 90)

        }, completion: { (Bool) -> Void in

           if(self.isRightSwipe == true) {
                self.isRightSwipe = false
                return
            }
            self.vwOverTable.hidden = false
            self.view.bringSubviewToFront(self.vwOverTable)
            var vc = self.storyboard?.instantiateViewControllerWithIdentifier("taskStorayBoardID") as TaskTableViewController
            self.navigationController?.pushViewController(vc, animated: true)
          })
        }
  }
  
  func handleSwipeRight(gestureRecognizer:UISwipeGestureRecognizer) {
    var location = gestureRecognizer.locationInView(self.tableView)
    var indexPath = self.tableView.indexPathForRowAtPoint(location)
    
    if((indexPath) != nil) {
        var cell:CustomTableViewCell = self.tableView.cellForRowAtIndexPath(indexPath!) as CustomTableViewCell
        cell.isSwipe = true

        let row = indexPath?.row
        UIView.animateWithDuration(0.5, animations: { () -> Void in
        
        var frame = self.tableView.frame
        cell.vwBackgroundVw.frame = CGRectMake((frame.size.width-250),cell.vwBackgroundVw.frame.origin.y, frame.size.width, cell.vwBackgroundVw.frame.size.height)
        }, completion: { (Bool) -> Void in
            self.arryOfSelectedCell.addObject(row!)
      })
    }
  }

    //MARK - UICustomTableViewCell Delegates to delete, up and down cell

    func handleDeleteCell(btnTag:Int) {

        for (var index:AnyObject) in (self.arryOfSelectedCell) {
            var index1:Int = index as Int
            if (index1 == btnTag) {
                var indexPath = NSIndexPath (forRow:btnTag, inSection:0)
                self.arryProject.removeAtIndex(btnTag)
                self.arryOfSelectedCell.removeAllObjects()
                self.tableView.reloadData()
                break
            }
        }
    }

    func handleDownButtonEvent(btnTag:Int,  isSwipe:Bool)  {
        if (btnTag == self.arryProject.count) {
            return
        }

        println("***** \(isSwipe)")
        if (isSwipe == true) {
            var indexPathCurrent = NSIndexPath (forRow:btnTag, inSection:0)
            var indexPathDest = NSIndexPath (forRow:btnTag+1, inSection:0)
            self.tableView.moveRowAtIndexPath(indexPathCurrent, toIndexPath: indexPathDest)

            var projectObj:Project = self.arryProject[btnTag]
            println("\n\(self.arryProject.count)")
            self.arryProject.removeAtIndex(btnTag)
            self.arryProject.insert(projectObj, atIndex: btnTag+1)
        }
//        for (var project:Project) in (self.arryProject) {
//            println("After\n\(project.projectName)")
//        }
    }

    func handleUpButtonEvent(btnTag:Int,  isSwipe:Bool) {
        if (btnTag == 0) {
            return
        }

        if (isSwipe == true)  {
            var indexPathCurrent = NSIndexPath (forRow:btnTag, inSection:0)
            var indexPathDest = NSIndexPath (forRow:btnTag-1, inSection:0)
            self.tableView .moveRowAtIndexPath(indexPathCurrent, toIndexPath: indexPathDest)

            var projectObj:Project = self.arryProject[btnTag]
            self.arryProject.removeAtIndex(btnTag)
            self.arryProject.insert(projectObj, atIndex: btnTag-1)
        }
    }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    return 1
  }
  
   func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    println(arryProject.count)
    return  arryProject.count
  }
  
   func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

    let cell = tableView.dequeueReusableCellWithIdentifier("projectCell") as CustomTableViewCell
    let project = arryProject[indexPath.row] as Project
    println("*********\(indexPath.row)" )
    cell.setValueOfProjectList(project,row: indexPath.row,frame: self.tableView.frame, selectedIndexList: self.arryOfSelectedCell,listCount: self.arryProject.count)
    cell.delegate = self
    cell.imageView.image = UIImage(named: "projectlogo.png")
    return cell
  }

   func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
    return 90
  }
  
  //Function to set backgroundColor
  func backgroundColorOfImageView() {
    let gl:CAGradientLayer = CAGradientLayer ()

    gl.colors = [(UIColor(red: 65.0/255.0, green: 104.0/255.0, blue: 183.0/255.0, alpha: 1.0).CGColor), (UIColor(red: 68.0/255.0, green: 136.0/255.0, blue: 224.0/255.0, alpha: 1.0).CGColor),(UIColor(red: 225/255.0, green: 225/255.0, blue: 250/255.0, alpha: 1.0).CGColor)]
        gl.locations = [ 0.0, 1.0]
    self.tableView.layer.insertSublayer(gl, atIndex: 0)
    gl.frame = self.tableView.frame;
  }
  
  /*func handleCellUpButtonAction(sender:UIButton){
    
    var btn:UIButton = sender as UIButton
    
    var indexCurrent:NSIndexPath = NSIndexPath(index: btn.tag)
    var indexDesin:NSIndexPath = NSIndexPath(index: btn.tag + 1)
    tableView.moveRowAtIndexPath(indexCurrent, toIndexPath:indexDesin)
  } */
}

