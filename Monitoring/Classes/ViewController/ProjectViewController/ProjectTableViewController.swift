//
//  ProjectTableViewController.swift
//  Monitoring
//
//  Created by GrepRuby on 18/02/15.
//  Copyright (c) 2015 GrepRuby. All rights reserved.
//

import Foundation

import UIKit

class ProjectTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, CustomProjectCellDelegate {

    var cellobj:CustomTableViewCell!
    @IBOutlet var vwOverTable:UIView!
    @IBOutlet var tableView:UITableView!
    var isRightSwipe : Bool = false
    var arryOfDeleteSelectedCell:NSMutableArray = []
    var arryProject:[Project]!

  @IBOutlet weak var rightNavigationBarButton:UIBarButtonItem!
  
  override func viewDidLoad() {
    super.viewDidLoad()
   // self.backgroundColorOfImageView()
    
    self.view.backgroundColor = UIColor.whiteColor()
    self.title = "Project List"
    self.tableView.separatorColor = UIColor.clearColor()
    self.navigationController?.navigationBar.barTintColor = UIColor(red: 65.0/255.0, green: 104.0/255.0, blue: 183.0/255.0, alpha: 1.0)
    UINavigationBar.appearance().titleTextAttributes = [NSForegroundColorAttributeName : UIColor.whiteColor()]
    UINavigationBar.appearance().tintColor = UIColor.whiteColor()

    self.navigationController?.navigationBar.translucent = false

    let project = [Project (projectName: "Kindergarton1", projectDueDate: "15/02/2015"),  Project (projectName: "Kindergarton2", projectDueDate: "15/02/2015")
        ,Project (projectName: "Kindergarton3", projectDueDate: "15/02/2015"),Project (projectName: "Kindergarton4", projectDueDate: "15/02/2015"), Project(projectName: "Kindergarton3", projectDueDate: "15/02/2015"), Project (projectName: "Kindergarton6", projectDueDate: "15/02/2015"), Project(projectName: "Kindergarton7", projectDueDate: "15/02/2015"), Project(projectName: "Kindergarton8", projectDueDate: "15/02/2015")]

    arryProject = project
    println(arryProject)
    self.tableView.editing = false
  }

  override func viewWillAppear(animated: Bool) {
    super.viewWillAppear(animated)
    self.vwOverTable.hidden = true
    self.tableView.hidden = false
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
            //Update the cell or model
    
            let row = indexPath?.row
            let yAxis:CGFloat = CGFloat(row!*90)
    
            UIView .animateWithDuration(0.5, animations: { () -> Void in
                var frame = self.tableView.frame

                for var iLoop:Int = 0 ; iLoop<self.arryOfDeleteSelectedCell.count; iLoop++ {
                if (self.arryOfDeleteSelectedCell.objectAtIndex(iLoop).integerValue == row ) {
                    cell.vwBackgroundVw.frame = CGRectMake(0 ,cell.vwBackgroundVw.frame.origin.y, frame.size.width, 90)
                    self.arryOfDeleteSelectedCell.removeObjectAtIndex(iLoop)
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
      //Update the cell or model
      
      let row = indexPath?.row
      let yAxis:CGFloat = CGFloat(row!*90)
      
      UIView .animateWithDuration(0.5, animations: { () -> Void in
        
        var frame = self.tableView.frame
        cell.vwBackgroundVw.frame = CGRectMake((frame.size.width-260),cell.vwBackgroundVw.frame.origin.y, frame.size.width, 90)
        }, completion: { (Bool) -> Void in
            self.arryOfDeleteSelectedCell.addObject(row!)
      })
    }
  }

    //MARK - UICustomTableViewCell Delegates to delete, up and down cell

    func handleDeleteCell(btnTag:Int) {
        print("tag\(btnTag)")
        var indexPath = NSIndexPath (forRow:btnTag, inSection:0)
        self.arryProject.removeAtIndex(btnTag)
        self.tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.None)

        for (var value:AnyObject) in (self.arryOfDeleteSelectedCell) {
            var index:Int = value as Int
            var indexPath = NSIndexPath (forRow:index, inSection:0)
            var cell:CustomTableViewCell = self.tableView.cellForRowAtIndexPath(indexPath!) as CustomTableViewCell
            cell.vwBackgroundVw.removeFromSuperview()
            cell.btnCellDown.removeFromSuperview()
            cell.btnCellUp.removeFromSuperview()
            cell.btnDelete.removeFromSuperview()
        }

        println(self.arryProject)
        self.tableView.reloadData()
    }

    func handleDownButtonEvent(btnTag:Int)  {

        print(btnTag)
        var indexPathCurrent = NSIndexPath (forRow:btnTag, inSection:0)
        var indexPathDest = NSIndexPath (forRow:btnTag+1, inSection:0)

        self.tableView.moveRowAtIndexPath(indexPathCurrent, toIndexPath: indexPathDest)
        var projectObj:Project = self.arryProject[btnTag]
        println("\n\(self.arryProject.count)")
        self.arryProject.removeAtIndex(btnTag)
        self.arryProject.insert(projectObj, atIndex: btnTag+1)
//        for (var project:Project) in (self.arryProject) {
//            println("After\n\(project.projectName)")
//        }
    }

    func handleUpButtonEvent(btnTag:Int) {
        print(btnTag)
        var indexPathCurrent = NSIndexPath (forRow:btnTag, inSection:0)
        var indexPathDest = NSIndexPath (forRow:btnTag-1, inSection:0)

        self.tableView .moveRowAtIndexPath(indexPathCurrent, toIndexPath: indexPathDest)
        var projectObj:Project = self.arryProject[btnTag]
        self.arryProject.removeAtIndex(btnTag)
        self.arryProject.insert(projectObj, atIndex: btnTag-1)
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
    cell.setValueOfProjectList(project,row: indexPath.row,frame: self.tableView.frame)
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
  
  func handleCellUpButtonAction(sender:UIButton){
    
    var btn:UIButton = sender as UIButton
    
    var indexCurrent:NSIndexPath = NSIndexPath(index: btn.tag)
    var indexDesin:NSIndexPath = NSIndexPath(index: btn.tag + 1)
    tableView.moveRowAtIndexPath(indexCurrent, toIndexPath:indexDesin)
  }
}

