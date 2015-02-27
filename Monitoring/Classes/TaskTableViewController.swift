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
  
  
  var taskData:NSArray!
  
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    var obj = CustomTaskViewCell()
    self.navigationItem.hidesBackButton = true
    self.title = "Task List"
    
    var backButton:UIBarButtonItem = UIBarButtonItem(title: "Back", style: UIBarButtonItemStyle.Plain, target: self, action: "handleBackButtonAction")
    self.navigationItem.setLeftBarButtonItem(backButton, animated: true)
    self.handlingTaskdata()
    
  }
  
  func handleBackButtonAction(){
    self.navigationController?.popViewControllerAnimated(true)
  }
  
  
  @IBAction func handleAddButtonAction(sender:UIBarButtonItem){
    
  }
  
  
  func handlingTaskdata(){
    var TaskData1 = Task(name: "Socialintegration", tdescription: "gjhgjhgjhgjhgjhgjhgjhgjhgjhgjhghjghjghjghjgjhghjgjhgjhgjhgjhgjhgjhgjhgjhgjhgjhgjhgjhghjgjhgjhghjghgjhgjhfkldjshglsdkjghfldkjghlkfjdhglskhflkjhlskjhflkgjhslgkdjhslkfjhgklsjfhksjdhgldkfjghlskjhfgldksjhdlkfgjhlsdkjhgklsjghdfkljgh", assign: "XYZ")
    
    var TaskData2 = Task(name: "Tableview", tdescription: "gjhgjhgjhgjhgjhgjhgjhgjhgjhgjhghjghjghjghjgjhghjgjhgjhgjhgjhgjhgjhgjhgjhgjhgjhgjhgjhghjgjhgjhghjghgjhgjhf", assign: "XYZ")
    
    var TaskData3 = Task(name: "CollectionView", tdescription: "gjhgjhgjhgjhgjhgjhgjhgjhgjhgjhg", assign: "XYZ")
    
    var TaskData4 = Task(name: "Naviagation", tdescription: "gjhgjhgjhgjhgjhgjhgjhgjhgjhgjhghjghjghjghjgjhghjgjhgjhgjhgjhgjhgjhgjhgjhgjhgjhgjhgjhghjgjhgjhghjghgjhgjhfkldjshglsdkjghfldkjghlkfjdhglskhflkjhlskjhflkgjhslgkdjhslkfjhgklsjfhksjdhgldkfjghlskjhfgldksjhdlkfgjhlsdkjhgklsjghdfkljghlkdfhlksdlfjsfkjldkjflskjfdlkjflskdjflksdjflksjdlkfjslkdfjlskjdlfksjfdlkjfslkdjflskdjflskdjflskfdjlkfjsldkjflskfjdlkjfslkfdjlkjslkfjslkdjflskdfjlskdjflsdkj", assign: "XYZ")
    
    taskData = [TaskData1,TaskData2,TaskData3,TaskData4]
    
    println(taskData.count)
    
  }
  
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }
  
  override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return taskData.count
  }
  
  override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    
    var cell = tableView.dequeueReusableCellWithIdentifier("taskCell")as CustomTaskViewCell
    var data = taskData.objectAtIndex(indexPath.row) as Task
   
    cell.tName = data.taskName
    cell.tdescription = data.taskDescription
    cell.tAssign = data.taskAssign
    cell.getFeeds(data.taskDescription)
    return cell
  }
  
  override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
    
    var textsize:CGSize = CGSize(width: 300, height: 900)

    var task:Task = taskData[indexPath.row] as Task
    var strDes:String = task.taskDescription
     var textframe1:CGRect = strDes.boundingRectWithSize(textsize, options: NSStringDrawingOptions.UsesLineFragmentOrigin, attributes:  [NSFontAttributeName:UIFont.systemFontOfSize(17.0)], context: nil)
    println(textframe1)
    return (textframe1.height+85)
  }
  
  
}
