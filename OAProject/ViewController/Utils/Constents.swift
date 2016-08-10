//
//  Constents.swift
//  OAProject
//
//  Created by Geetion on 16/7/29.
//  Copyright © 2016年 Geetion. All rights reserved.
//

import UIKit

class Constents {
    static let ScreenWidth = UIScreen.mainScreen().bounds.width
    static let ScreenHeight = UIScreen.mainScreen().bounds.height
    
    static let TextColor = UIColor(red:0.33, green:0.40, blue:0.41, alpha:1.00)
    static let isLogin = NSUserDefaults.standardUserDefaults().boolForKey("isLogin")
}