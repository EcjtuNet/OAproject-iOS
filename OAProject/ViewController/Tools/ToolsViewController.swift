//
//  ToolsViewController.swift
//  OAProject
//
//  Created by Geetion on 16/7/31.
//  Copyright © 2016年 Geetion. All rights reserved.
//

import UIKit

class ToolsViewController: UIViewController {
    

    
    override func loadView() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "tools_navbar_setting"), style: .Plain, target: self, action: "ASD")
        navigationItem.title = "服务"
        view = ToolsView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.whiteColor()
        // Do any additional setup after loading the view.
    }

}
