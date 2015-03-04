//
//  ProjectTableViewController.swift
//  Monitoring
//
//  Created by GrepRuby on 18/02/15.
//  Copyright (c) 2015 GrepRuby. All rights reserved.
//

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

    let project = [Project (projectName: "Kindergarton", projectDueDate: "15/02/2015"),  Project (projectName: "Kindergarton2", projectDueDate: "15/02/2015")
        ,Project (projectName: "Kindergarton3", projectDueDate: "15/02/2015"),Project (projectName: "Kindergarton4", projectDueDate: "15/02/2015"), Project(projectName: "Kindergarton3", projectDueDate: "15/02/2015"), Project (projectName: "Kindergarton5", projectDueDate: "15/02/2015"), Project(projectName: "Kindergarton6", projectDueDate: "15/02/2015"), Project(projectName: "Kindergarton3", projectDueDate: "15/02/2015")]

    arryProject = project
    println(arryProject)
    self.tableView.editing = false
    self.addNavigationBarButtons()
  }

  override func viewWillAppear(animated: Bool) {
    super.viewWillAppear(animated)
    self.vwOverTable.hidden = true
    self.tableView.hidden = false
  }

  
// Mark:Adding The NAvigation Bar Button
  
  func addNavigationBarButtons(){
    var btnSetting:UIButton = UIButton(frame: CGRectMake(0, 0, 30, 30))
    btnSetting.setImage(UIImage(named: "sideBar.png"), forState:UIControlState.Normal)
    
    var btnNaviLeftBarButton:UIBarButtonItem = UIBarButtonItem(customView: btnSetting)
    self.navigationItem.setLeftBarButtonItem(btnNaviLeftBarButton, animated: true)
    
    var btnNaviRightBarButton:UIBarButtonItem = UIBarButtonItem()
    
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
                    cell.vwBackgroundVw.frame = CGRectMake(0 ,yAxis, frame.size.width, 90)
                    self.arryOfDeleteSelectedCell.removeObjectAtIndex(iLoop)
                    self.isRightSwipe = true
                    return
                    }
                }
                cell.frame = CGRectMake(-frame.size.width ,yAxis, frame.size.width, 90)

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
            // cell.deleteButoon.transform = CGAffineTransformMakeRotation(M_PI/2);
//            [myView animateWithDuration: 0.25
//                animations:
//                ^{
//                myView.transform = CGAffineTransformMakeRotation(M_PI/2);
//                }
//            ];

      })
    }
  }

    func handleDeleteCell(btnTag:Int) {

        print(btnTag)
        var indexPath = NSIndexPath (forRow:btnTag, inSection:0)
        self.arryProject.removeAtIndex(btnTag)
        println(self.arryProject.count)
        self.tableView .deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.None)
        // self.tableView.reloadData()
    }


    func handleUpButtonEvent(btnTag:Int) {

    }

    func handleDownButtonEvent(btnTag:Int) {

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
    cell.setValueOfProjectList(project,row: indexPath.row,frame: self.tableView.frame)
    cell.delegate = self
    cell.imageView.image = UIImage(named: "projectlogo.png")
    return cell
  }

  func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    }

  func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
    return 90
  }
  
  @IBAction func raightNAvigationBarButtonAction(sender:UIBarButtonItem){
   let vc = self.storyboard?.instantiateViewControllerWithIdentifier("AddProjectStoryBoardID")as AddProjectViewController
    self.navigationController?.pushViewController(vc, animated: true)
  }
  
  //Function to set backgroundColor
  func backgroundColorOfImageView() {
    let gl:CAGradientLayer = CAGradientLayer ()

    gl.colors = [(UIColor(red: 65.0/255.0, green: 104.0/255.0, blue: 183.0/255.0, alpha: 1.0).CGColor), (UIColor(red: 68.0/255.0, green: 136.0/255.0, blue: 224.0/255.0, alpha: 1.0).CGColor),(UIColor(red: 225/255.0, green: 225/255.0, blue: 250/255.0, alpha: 1.0).CGColor)]
        gl.locations = [ 0.0, 1.0]
    self.tableView.layer.insertSublayer(gl, atIndex: 0)
    gl.frame = self.tableView.frame;
  }
}

