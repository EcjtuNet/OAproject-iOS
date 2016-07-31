//
//  TableDropListView.swift
//  OAProject
//
//  Created by Geetion on 16/7/31.
//  Copyright © 2016年 Geetion. All rights reserved.
//

import UIKit

class DroplistViewController: UIViewController {

}

//MARK: TableView delegate&datasource
extension DroplistViewController:UITableViewDelegate,UITableViewDataSource {
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
}
