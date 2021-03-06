//
//  ContactTableViewController.swift
//  OAProject
//
//  Created by Geetion on 16/7/29.
//  Copyright © 2016年 Geetion. All rights reserved.
//

import UIKit

class ContactTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        setupNavigationBar()
    }
    
    private func setupNavigationBar() {
        navigationController?.navigationBar.barTintColor = UIColor.whiteColor()
        
        //navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "home_navbar_leftbar"), style: .Plain, target: self, action: "123")
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "contact_message_navbar_add"), style: .Plain, target: self, action: "123")
        
        let titleView = CustomSegmentControl()
        titleView.setSegmentTitle("消息",rightTitle: "联系人")
        navigationItem.titleView = titleView
    }

    // MARK: - Table view data source
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 67
    }

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }

}
