//
//  SharedAFHTTPManager.swift
//  Browser
//
//  Created by GrepRuby on 20/02/15.
//  Copyright (c) 2015 Appcoda. All rights reserved.
//

import Foundation

class SharedAFHTTPManager {

    var manager = AFHTTPRequestOperationManager()
    var baseUrl:String = ""

    class func sharedAFHTTPManager()->SharedAFHTTPManager {
        var sharedManager: SharedAFHTTPManager = SharedAFHTTPManager()
        sharedManager.manager.requestSerializer.timeoutInterval = 25
        return sharedManager
    }

    class func sharedAFHTTPManager(sharedBaseUrl: String) ->SharedAFHTTPManager {
        var sharedManager: SharedAFHTTPManager =  SharedAFHTTPManager.sharedAFHTTPManager()
        sharedManager.baseUrl = sharedBaseUrl
        return sharedManager
    }


    //POST calling method
    func postCallRequest(path: String, param:Dictionary<String,String>?, ownerClassRef:AnyObject ,success:(Selector) , failure:(Selector)) {
        self.postCall(path, param: param, ownerClassRef: ownerClassRef, success: success, failure: failure)
    }

    func getCallRequest(path: String, param:Dictionary<String,String>?, ownerClassRef:AnyObject ,success:(Selector) , failure:(Selector)) {
        self.getCall(path, param: param, ownerClassRef: ownerClassRef, success: success, failure: failure)
    }

    //MARK : Post request
    func postCall(path: String, param:Dictionary<String,String>?, ownerClassRef:AnyObject ,success:(Selector) , failure:(Selector)) {
        println(param)
        self.manager.POST(""+path , parameters: param, success: {
            (operation: AFHTTPRequestOperation!,responseObject: AnyObject!) in
             println("JSON: " + responseObject.description)
            if (ownerClassRef.respondsToSelector(success)) {
                NSTimer.scheduledTimerWithTimeInterval(0.1, target: ownerClassRef, selector: success, userInfo: responseObject, repeats:false)
            }
        }, failure: {
                (operation: AFHTTPRequestOperation!,error: NSError!) in
                println("Error: " + error.localizedDescription)
                if (ownerClassRef.respondsToSelector(success)) {
                    NSTimer.scheduledTimerWithTimeInterval(0.1, target: ownerClassRef, selector: failure, userInfo:nil, repeats:false)
                }
        })
    }

    func getCall(path: String, param:Dictionary<String,String>?, ownerClassRef:AnyObject ,success:(Selector) , failure:(Selector)) {
        println(param)
        self.manager.GET(""+path, parameters: param, success: {
            (operation: AFHTTPRequestOperation!,responseObject: AnyObject!) in
            println("JSON: " + responseObject.description)
            if (ownerClassRef.respondsToSelector(success)) {
                NSTimer.scheduledTimerWithTimeInterval(0.1, target: ownerClassRef, selector: success, userInfo: responseObject, repeats:false)
            }
            }, failure: {
                (operation: AFHTTPRequestOperation!,error: NSError!) in
                println("Error: " + error.localizedDescription)
                if (ownerClassRef.respondsToSelector(success)) {
                    NSTimer.scheduledTimerWithTimeInterval(0.1, target: ownerClassRef, selector: failure, userInfo:nil, repeats:false)
                }
        })
        }
}
