//
//  AppDelegate.swift
//  test
//
//  Created by jean on 15/8/30.
//  Copyright © 2015年 峂峂. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate,RCIMUserInfoDataSource {

    var window: UIWindow?
    
    
    func getUserInfoWithUserId(userId: String!, completion: ((RCUserInfo!) -> Void)!) {
        let userInfo = RCUserInfo()
        userInfo.userId = userId
        
       
        
        switch userId {
        case "tongtong":
            userInfo.name = "峂峂"
            userInfo.portraitUri = "https://avatars3.githubusercontent.com/u/11898573?v=3&s=460"
        case "tong":
            userInfo.name = "峂"
            userInfo.portraitUri = "https://desktop.github.com/images/screens/mac/branch.png"
        default:
            print("无此用户")
            
            
        }
        return completion(userInfo)
    }

    
    
    func connectServer(completion: () -> Void){
        RCIM.sharedRCIM().initWithAppKey("pwe86ga5ell36")
        
        RCIM.sharedRCIM().userInfoDataSource = self
        
        
    RCIM.sharedRCIM().connectWithToken("wIubB6DpJaBR3eX1ZkfFwq7qjP5FbiJbl1E1yY600R0n0ihglVvaIn8nLBpInGedSuurMN75Qufpgyz69qrK1oFkNyEtLe19", success: { (_) -> Void in
//            print("连接成功")
        
        dispatch_async(dispatch_get_main_queue(), { () -> Void in
            completion() 
        })
        
        
            
            //            let currentUser = RCUserInfo(userId: "tongtong", name: "峂峂", portrait: nil)
            //
            //            RCIMClient.sharedRCIMClient().currentUserInfo = currentUser
            
            
            }, error: { (_) -> Void in
                print("连接失败")
            }) { () -> Void in
                print("token无效")
        }
    }

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

