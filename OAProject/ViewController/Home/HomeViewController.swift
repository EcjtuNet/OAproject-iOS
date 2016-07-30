//
//  HomeTableViewController.swift
//  OAProject
//
//  Created by Geetion on 16/7/29.
//  Copyright © 2016年 Geetion. All rights reserved.
//

import UIKit
import SnapKit

class HomeViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubviews()
        setupNavigationBar()
        self.view.backgroundColor = UIColor.whiteColor()
        
        
        print(navigationController)
        
    }
    
    private func setupNavigationBar() {
        self.navigationController?.navigationBar.barTintColor = UIColor.whiteColor()
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "home_navbar_leftbar"), style: .Plain, target: self, action: "123")
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "home_navbar_searchbar"), style: .Plain, target: self, action: "123")
        
        let titleBtn = TitleButton()
        titleBtn.setTitle("极客江南", forState: UIControlState.Normal)
        titleBtn.addTarget(self, action: "titleBtnClick:", forControlEvents: UIControlEvents.TouchUpInside)
        navigationItem.titleView = titleBtn
    }
    
    private func setupSubviews() {
        let slidShowView = SlideShowView()
        self.view.addSubview(slidShowView)
        slidShowView.snp_makeConstraints { (make) in
            make.top.equalTo(64)
            make.right.equalTo(0)
            make.left.equalTo(0)
            make.height.equalTo(168)
        }
        
        let bulletinBar = BulletinBar()
        self.view.addSubview(bulletinBar)
        bulletinBar.snp_makeConstraints { (make) in
            make.height.equalTo(38)
            make.top.equalTo(slidShowView.snp_bottom)
            make.left.equalTo(0)
            make.right.equalTo(0)
        }
        
        let tableView = UITableView()
        self.view.addSubview(tableView)
        tableView.snp_makeConstraints { (make) in
            make.top.equalTo(bulletinBar.snp_bottom)
            make.bottom.equalTo(0)
            make.left.equalTo(0)
            make.right.equalTo(0)
        }
    }
    
    
    
}

extension HomeViewController{
    
}
