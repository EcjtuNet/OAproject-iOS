//
//  AppDelegate.swift
//  OAProject
//
//  Created by Geetion on 16/7/28.
//  Copyright © 2016年 Geetion. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var userDefault = NSUserDefaults.standardUserDefaults()
    


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        
        checkFirstLogin()
//        设置基本界面配色
        UINavigationBar.appearance().tintColor = UIColor(red:0.26, green:0.32, blue:0.33, alpha:1.00)
        UITabBar.appearance().tintColor = UIColor(red:0.26, green:0.32, blue:0.33, alpha:1.00)
        window = UIWindow(frame: UIScreen.mainScreen().bounds)
        
        if Constents.isLogin {
            window?.rootViewController = MainTabViewController()
        }else {
            window?.rootViewController = LoginViewController()
        }
        
        window?.makeKeyAndVisible()
        
        return true
    }
    
    private func checkFirstLogin() {
        if userDefault.objectForKey("isLogin") == nil {
            userDefault.setBool(false, forKey: "isLogin")
        }
    }

}

