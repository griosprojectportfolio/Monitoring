//
//  CommanClass.swift
//  Monitoring
//
//  Created by GrepRuby on 27/02/15.
//  Copyright (c) 2015 GrepRuby. All rights reserved.
//

import UIKIT

class CommanClass: NSObject {


    class func isIOS8 () ->Bool {

        let Device = UIDevice.currentDevice()
        let iosVersion = NSString(string: Device.systemVersion).doubleValue
        let iOS8:Bool = iosVersion >= 8
        return iOS8
    }

    class func isIOS7 () ->Bool {

        let Device = UIDevice.currentDevice()
        let iosVersion = NSString(string: Device.systemVersion).doubleValue
        let iOS7:Bool = iosVersion >= 7 && iosVersion < 8
        return iOS7
    }
}
