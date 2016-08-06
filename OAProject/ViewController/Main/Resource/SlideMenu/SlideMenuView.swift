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
    
    let cellHeight = 35
    
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
    
    private lazy var logoutImageView:UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "leftbar_font_logout")
        return imageView
    }()
    
    private lazy var menuImageView:UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "leftbar_font_menu")
        return imageView
    }()
    
    private lazy var avatarImageView:UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    private lazy var profileSettingImageView:UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "leftbar_profile_settings"))
        return imageView
    }()
    
    private lazy var qrcodeButton:UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "leftbar_profile_erweima"), forState: .Normal)
        return button
    }()
    
    private lazy var menuTableView:UITableView = {
        let tableView = UITableView()
        tableView.separatorStyle = UITableViewCellSeparatorStyle.None
        tableView.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.03)
        tableView.backgroundColor = UIColor.clearColor()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.scrollEnabled = false
        return tableView
    }()
    
    private lazy var nameLabel:UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFontOfSize(18)
        label.text = "姓名"
        label.textColor = Constents.TextColor
        return label
    }()
    
    private lazy var jobLabel:UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFontOfSize(10)
        label.textColor = UIColor(red: 160.0/255, green: 160.0/255, blue: 160.0/255, alpha: 1.0)
        label.text = "技术研发中心 产品经理"
        return label
    }()
    
    override init(frame: CGRect) {
        let rect = CGRect(x: 0, y: 0, width: UIScreen.mainScreen().bounds.width, height: UIScreen.mainScreen().bounds.height)
        super.init(frame: rect)
        
        backgroundColor = UIColor(red:0.94, green:0.94, blue:0.94, alpha:1.00)
        
        addSubview(closeButton)
        addSubview(logoutImageView)
        addSubview(logoutButton)
        addSubview(menuImageView)
        addSubview(menuTableView)
        addSubview(avatarImageView)
        addSubview(profileSettingImageView)
        addSubview(nameLabel)
        addSubview(qrcodeButton)
        addSubview(jobLabel)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        closeButton.snp_makeConstraints { (make) in
            make.top.equalTo(42)
            make.height.width.equalTo(34)
            make.left.equalTo(15)
        }
        
        menuImageView.snp_makeConstraints { (make) in
            make.centerY.equalTo(closeButton.snp_centerY)
            make.left.equalTo(closeButton.snp_right).offset(15)
        }
        
        logoutButton.snp_makeConstraints { (make) in
            make.bottom.equalTo(-57)
            make.left.equalTo(15)
            make.width.height.equalTo(34)
        }
        
        logoutImageView.snp_makeConstraints { (make) in
            make.centerY.equalTo(logoutButton.snp_centerY)
            make.left.equalTo(logoutButton.snp_right).offset(15)
        }
        
        menuTableView.snp_makeConstraints { (make) in
            make.left.equalTo(27)
            make.width.equalTo(200)
            make.top.equalTo(252)
            make.bottom.equalTo(logoutButton.snp_top).offset(-30)
        }
        
        avatarImageView.snp_makeConstraints { (make) in
            make.left.equalTo(20)
            make.top.equalTo(139)
            make.width.height.equalTo(70)
        }
        
        profileSettingImageView.snp_makeConstraints { (make) in
            make.bottom.right.equalTo(avatarImageView)
            make.height.width.equalTo(22)
        }
        
        nameLabel.snp_makeConstraints { (make) in
            make.left.equalTo(avatarImageView.snp_right).offset(28)
            make.top.equalTo(avatarImageView.snp_top).offset(18)
        }
        
        qrcodeButton.snp_makeConstraints { (make) in
            make.left.equalTo(nameLabel.snp_right).offset(2)
            make.centerY.equalTo(nameLabel)
            make.width.height.equalTo(34)
        }
        
        jobLabel.snp_makeConstraints { (make) in
            make.top.equalTo(qrcodeButton.snp_bottom).offset(7)
            make.left.equalTo(nameLabel.snp_left)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func closeButtonDidClick() {
        if delegate != nil {
            delegate!.closeButtonDidClick()
        }
    }
    
}

extension SlideMenuView:UITableViewDataSource,UITableViewDelegate {
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print(indexPath)
    }
    
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
        setupCellData(cell!, indexPath: indexPath)
        return cell!
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        let cellHeight = tableView.frame.height/CGFloat(menuTitle.count)
        return cellHeight
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
