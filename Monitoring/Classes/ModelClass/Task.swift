//
//  Task.swift
//  Monitoring
//
//  Created by GrepRuby on 09/03/15.
//  Copyright (c) 2015 GrepRuby. All rights reserved.
//

import Foundation
import UIKit

class Task: NSObject {

    var taskName:String!
    var taskDueDate:String!
    var taskAssignTo:String!

    init(taskName:String, taskDueDate:String, taskAssignTo:String) {
        super.init()
        self.taskName = taskName
        self.taskDueDate = taskDueDate
        self.taskAssignTo = taskAssignTo
    }
}
