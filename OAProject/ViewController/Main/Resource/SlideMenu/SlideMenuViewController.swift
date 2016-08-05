//
//  SlideViewController.swift
//  OAProject
//
//  Created by Geetion on 16/7/31.
//  Copyright © 2016年 Geetion. All rights reserved.
//

import UIKit

class SlideMenuViewController: UIViewController,SlideMenuDelegate {
    var slideMenuView:SlideMenuView?
    
    override func loadView() {
        super.loadView()
        let slideMenuView = SlideMenuView()
        slideMenuView.delegate = self
        view = slideMenuView
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func closeButtonDidClick() {
        dismissViewControllerAnimated(true, completion: nil)
    }
}
