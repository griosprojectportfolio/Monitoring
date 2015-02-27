//
//  Task.swift
//  Monitoring
//
//  Created by GrepRuby on 26/02/15.
//  Copyright (c) 2015 GrepRuby. All rights reserved.
//

import Foundation
import UIKit

class Task:NSObject {

  var taskName:String!
  var taskDescription:String!
  var taskAssign:String!
  
  init(name:String,tdescription:String,assign:String) {
    
    taskName = name
    taskDescription = tdescription
    taskAssign = assign
    
  }
  
  }