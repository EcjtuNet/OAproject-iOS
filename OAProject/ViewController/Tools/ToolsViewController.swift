//
//  ToolsViewController.swift
//  OAProject
//
//  Created by Geetion on 16/7/31.
//  Copyright © 2016年 Geetion. All rights reserved.
//

import UIKit

class ToolsViewController: UIViewController {
    
    private lazy var announceButton:ToolsButton = {
        let button = ToolsButton()
        button.setTitle("公告")
        button.setImage(UIImage(named: "tools_announce")!)
        button.sizeToFit()
        return button
    }()
    
    override func loadView() {
        super.loadView()
        view.addSubview(announceButton)
        announceButton.snp_makeConstraints { (make) in
            make.top.equalTo(100)
            make.left.equalTo(100)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.whiteColor()
        // Do any additional setup after loading the view.
    }

}
