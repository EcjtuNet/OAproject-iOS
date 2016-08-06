//
//  MainTabViewController.swift
//  OAProject
//
//  Created by Geetion on 16/7/29.
//  Copyright © 2016年 Geetion. All rights reserved.
//

import UIKit

class MainTabViewController: UITabBarController {
    
    private lazy var composeButton:UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "tabbar_tools"), forState: .Normal)
        button.setImage(UIImage(named: "tabbar_tools_highlighted"), forState: .Selected)
        button.imageView?.contentMode = UIViewContentMode.ScaleAspectFit
        button.addTarget(self, action: #selector(MainTabViewController.composeButtonDidClick(_:)), forControlEvents: .TouchUpInside)
        return button
    }()
    
    func composeButtonDidClick(sender:UIButton) {
        
        sender.selected = !sender.selected
        
        let nav = UINavigationController()
        nav.addChildViewController(ToolsViewController())
        let toolsViewController = nav
        presentViewController(toolsViewController, animated: true, completion: nil)
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        setupComposeButton()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        addChildViewControllers()
        tabBar.barTintColor = UIColor.whiteColor()
        
    }
    
    //添加子ViewController
    private func addChildViewControllers() {
        let homeViewController = HomeViewController()
        addChildViewController(homeViewController,imageName: "tabbar_home")
        
        let null = NullViewController()
        addChildViewController(null)
        
        let contact = ContactTableViewController()
        addChildViewController(contact,imageName: "tabbar_contact")
    }
    
    private func addChildViewController(childController: UIViewController,imageName:String) {
//        设置viewcontroller
        childController.tabBarItem.image = UIImage(named: imageName)
        childController.tabBarItem.imageInsets = UIEdgeInsets(top: 5, left: 0, bottom: -5, right: 0)
        childController.tabBarItem.selectedImage = UIImage(named: imageName + "_highlighted")
//        包装NavigationBar
        let nav = UINavigationController()
        nav.addChildViewController(childController)
        
        addChildViewController(nav)
    }
//    设置中间compose按钮属性
    private func setupComposeButton() {
        let buttonWidth = UIScreen.mainScreen().bounds.width / CGFloat((viewControllers?.count)!)
        composeButton.frame = CGRect(x: buttonWidth, y: 0, width: buttonWidth, height: 49)
        tabBar.addSubview(composeButton)
    }
}
