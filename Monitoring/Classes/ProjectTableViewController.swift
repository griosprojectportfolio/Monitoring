//
//  ProjectTableViewController.swift
//  Monitoring
//
//  Created by GrepRuby on 18/02/15.
//  Copyright (c) 2015 GrepRuby. All rights reserved.
//

import UIKit

class ProjectTableViewController: UITableViewController {
  var cellobj:CustomTableViewCell!

  @IBOutlet weak var rightNavigationBarButton:UIBarButtonItem!
  var btnLeftNaviSetting:UIBarButtonItem!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.backgroundColorOfImageView()
    
    btnLeftNaviSetting = UIBarButtonItem(title: "Setting", style: UIBarButtonItemStyle.Plain, target: self, action:"")
    self.navigationItem.setLeftBarButtonItem(btnLeftNaviSetting, animated: true)
    
    //self.view.backgroundColor = UIColor.whiteColor()
    
    let leftSwipe = UISwipeGestureRecognizer(target: self, action: "handleSwipeLeft:")
    leftSwipe.direction=UISwipeGestureRecognizerDirection.Left
    self.tableView.addGestureRecognizer(leftSwipe)
    
    let rightSwipe = UISwipeGestureRecognizer(target: self, action: "handleSwipeRight:")
    rightSwipe.direction=UISwipeGestureRecognizerDirection.Right
    self.tableView.addGestureRecognizer(rightSwipe)
   
  }
  
  override func viewWillAppear(animated: Bool) {
    super.viewWillAppear(animated)
    self.tableView.hidden = false
  }
  
  
  func handleSwipeLeft(gestureRecognizer:UISwipeGestureRecognizer)
  {
  var location = gestureRecognizer.locationInView(self.tableView)
  
  var indexPath = self.tableView.indexPathForRowAtPoint(location)
  
  if((indexPath) != nil)
  {
  var cell = self.tableView.cellForRowAtIndexPath(indexPath!)
  //Update the cell or model
    
    let row = indexPath?.row
    let yAxis:CGFloat = CGFloat(row!*85)
    
    UIView .animateWithDuration(0.5, animations: { () -> Void in
     
      var frame = self.tableView.frame
      cell?.frame = CGRectMake(-frame.size.width ,yAxis, frame.size.width, 85)
    }, completion: { (Bool) -> Void in
      
      var overView:UIView = UIView(frame: self.tableView.frame)
      self.tableView.addSubview(overView)
      self.tableView.bringSubviewToFront(overView)
      
      var vc = self.storyboard?.instantiateViewControllerWithIdentifier("taskStorayBoardID") as TaskTableViewController
      self.navigationController?.pushViewController(vc, animated: true)
      })
    }
  }
  
  
  
  func handleSwipeRight(gestureRecognizer:UISwipeGestureRecognizer)
  {
    var location = gestureRecognizer.locationInView(self.tableView)
    
    var indexPath = self.tableView.indexPathForRowAtPoint(location)
    
    if((indexPath) != nil)
    {
      var cell = self.tableView.cellForRowAtIndexPath(indexPath!)
      //Update the cell or model
      
      let row = indexPath?.row
      let yAxis:CGFloat = CGFloat(row!*85)
      
      UIView .animateWithDuration(0.5, animations: { () -> Void in
        
        var frame = self.tableView.frame
        cell?.frame = CGRectMake((frame.size.width-260),yAxis, frame.size.width, 85)
    
        }, completion: { (Bool) -> Void in
          
         
      })
      
      
    }
  }

  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    return 1
  }
  
  override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 6
  }
  
  override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier("projectCell", forIndexPath: indexPath) as CustomTableViewCell
    
    //cell.selectionStyle = .None
    
    cell.dueDate.text = "10/02/2015"
    cell.projectName.text = "Kindergarten"
    cell.imageView.image = UIImage(named: "projectlogo.png")
          return cell
  }

  override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    //var vc = self.storyboard?.instantiateViewControllerWithIdentifier("taskStorayBoardID") as TaskViewController
    //self.navigationController?.pushViewController(vc, animated: true)
  }
  
  
  @IBAction func raightNAvigationBarButtonAction(sender:UIBarButtonItem){
   let vc = self.storyboard?.instantiateViewControllerWithIdentifier("AddProjectStoryBoardID")as AddProjectViewController
    self.navigationController?.pushViewController(vc, animated: true)
  }
  
  //Function to set backgroundColor
  func backgroundColorOfImageView() {
    
    let gl:CAGradientLayer = CAGradientLayer ()
    // gl.colors = [(UIColor(red: 58/255.0, green: 127/255.0, blue: 199/255.0, alpha: 1.0).CGColor), (UIColor(red: 94.0/255.0, green: 219.0/255.0, blue: 223.0/255.0, alpha: 1.0).CGColor),  (UIColor(red: 169.0/255.0, green: 225.0/255.0, blue: 212.0/255.0, alpha: 1.0).CGColor)]
    
    // gl.colors = [ (UIColor(red: 35.0/255.0, green: 85.0/255.0, blue: 120.0/255.0, alpha: 1.0).CGColor),  (UIColor(red: 53.0/255.0, green: 121.0/255.0, blue: 166.0/255.0, alpha: 1.0).CGColor),(UIColor(red: 200/255.0, green: 212/255.0, blue: 223/255.0, alpha: 1.0).CGColor)]
    
    gl.colors = [(UIColor(red: 65.0/255.0, green: 104.0/255.0, blue: 183.0/255.0, alpha: 1.0).CGColor), (UIColor(red: 68.0/255.0, green: 136.0/255.0, blue: 224.0/255.0, alpha: 1.0).CGColor),(UIColor(red: 225/255.0, green: 225/255.0, blue: 250/255.0, alpha: 1.0).CGColor)]
    
    // gl.colors = [ (UIColor(red: 58/255.0, green: 127/255.0, blue: 191/255.0, alpha: 1.0).CGColor),  (UIColor(red: 73/255.0, green: 168/255.0, blue: 199/255.0, alpha: 1.0).CGColor)]
    
    gl.locations = [ 0.0, 1.0]
    self.tableView.layer.insertSublayer(gl, atIndex: 0)
    gl.frame = self.tableView.frame;
  }
}

