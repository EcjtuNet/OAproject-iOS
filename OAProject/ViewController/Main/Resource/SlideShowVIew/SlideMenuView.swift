//
//  SlideMenuView.swift
//  OAProject
//
//  Created by Geetion on 16/7/31.
//  Copyright © 2016年 Geetion. All rights reserved.
//

import UIKit

protocol SlideMenuDelegate {
    func closeButtonDidClick()
}

class SlideMenuView: UIView {
//    存储策划菜单标题信息
    let menuTitle = ["后台管理","账户设置","新消息通知","清除缓存","帮助反馈","关于"]
    
    let cellHeight = 42
    
    var delegate:SlideMenuDelegate?
//MARK:懒加载
    private lazy var closeButton:UIButton = {
       let button = UIButton()
        button.setImage(UIImage(named: "leftbar_close"), forState: .Normal)
        button.addTarget(self, action: #selector(SlideMenuView.closeButtonDidClick), forControlEvents: .TouchUpInside)
        button.userInteractionEnabled = true
        return button
    }()
    
    private lazy var logoutButton:UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "leftbar_logout"), forState: .Normal)
        button.sizeToFit()
        return button
    }()
    
    private lazy var logoutLabel:UILabel = {
        let label = UILabel()
        label.text = "LOG OUT"
        label.textColor = UIColor(red:66.0/255, green:82.0/255, blue:85.0/255, alpha:1.00)
        return label
    }()
    
    private lazy var menuLabel:UILabel = {
        let label = UILabel()
        label.text = "MENU"
        label.textColor = UIColor(red:66.0/255, green:82.0/255, blue:85.0/255, alpha:1.00)
        return label
    }()
    
    private lazy var avatarImageView:UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    private lazy var menuTableView:UITableView = {
        let tableView = UITableView()
        tableView.separatorStyle = UITableViewCellSeparatorStyle.None
        tableView.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.03)
        tableView.backgroundColor = UIColor.clearColor()
        tableView.dataSource = self
        return tableView
    }()
    
    override init(frame: CGRect) {
        let rect = CGRect(x: 0, y: 0, width: UIScreen.mainScreen().bounds.width, height: UIScreen.mainScreen().bounds.height)
        super.init(frame: rect)
        
        self.backgroundColor = UIColor(red:0.94, green:0.94, blue:0.94, alpha:1.00)
        
        self.addSubview(closeButton)
        self.addSubview(menuLabel)
        self.addSubview(logoutButton)
        self.addSubview(logoutLabel)
        self.addSubview(menuTableView)
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        closeButton.snp_makeConstraints { (make) in
            make.top.equalTo(42)
            make.height.width.equalTo(34)
            make.left.equalTo(15)
        }
        
        menuLabel.snp_makeConstraints { (make) in
            make.centerY.equalTo(closeButton.snp_centerY)
            make.left.equalTo(closeButton.snp_right).offset(15)
        }
        
        logoutButton.snp_makeConstraints { (make) in
            make.bottom.equalTo(-69)
            make.left.equalTo(15)
            make.width.height.equalTo(34)
        }
        
        logoutLabel.snp_makeConstraints { (make) in
            make.centerY.equalTo(logoutButton.snp_centerY)
            make.left.equalTo(logoutButton.snp_right).offset(15)
        }
        
        menuTableView.snp_makeConstraints { (make) in
            make.left.equalTo(27)
            make.width.equalTo(200)
            make.height.equalTo(cellHeight * menuTitle.count)
            make.bottom.equalTo(-139)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func closeButtonDidClick() {
        print("aa")
        delegate!.closeButtonDidClick()
    }
    
}

extension SlideMenuView:UITableViewDataSource,UITableViewDelegate {
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuTitle.count
    }


    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell:UITableViewCell?
        if (tableView.dequeueReusableCellWithIdentifier("reuseCell") != nil) {
            cell = tableView.dequeueReusableCellWithIdentifier("reuseCell")
        }else {
            cell = UITableViewCell(style: .Default, reuseIdentifier: "reuseCell")
        }
        self.setupCellData(cell!, indexPath: indexPath)
        return cell!
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return CGFloat(cellHeight)
    }
    
    private func setupCellData(cell:UITableViewCell, indexPath:NSIndexPath) {
        
        cell.backgroundColor = UIColor.clearColor()
        
        let titleLabel = UILabel()
        titleLabel.text = menuTitle[indexPath.item]
        titleLabel.font = UIFont.systemFontOfSize(14)
        cell.addSubview(titleLabel)
        
        titleLabel.snp_makeConstraints { (make) in
            make.centerY.equalTo(cell)
            make.left.equalTo(cell)
        }
    }
}
