//
//  Project.swift
//  Monitoring
//
//  Created by GrepRuby on 26/02/15.
//  Copyright (c) 2015 GrepRuby. All rights reserved.
//

import Foundation
import UIKit

class Project: NSObject {

var projectName:String!
var projectDueDate:String!

    init(projectName:String, projectDueDate:String) {
        self.projectName = projectName
        self.projectDueDate = projectDueDate
        super.init()
    }
}


