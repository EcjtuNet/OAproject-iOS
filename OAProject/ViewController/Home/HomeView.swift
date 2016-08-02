//
//  HomeView.swift
//  OAProject
//
//  Created by Geetion on 16/8/2.
//  Copyright © 2016年 Geetion. All rights reserved.
//

import UIKit

class HomeView: UIView {
    
    private lazy var bulletinBar:BulletinBar = BulletinBar()
    
    let tableView = UITableView()
    
    private lazy var slidShowView:SlideShowView = SlideShowView()
    
    weak var delegate:UITableViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = UIColor.whiteColor()
        
        addSubview(slidShowView)
        addSubview(tableView)
        addSubview(bulletinBar)
        
        setupSubviews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    设置子View约束
    private func setupSubviews() {
        
        slidShowView.snp_makeConstraints { (make) in
            make.top.equalTo(64)
            make.right.equalTo(0)
            make.left.equalTo(0)
            make.height.equalTo(168)
        }
        
        bulletinBar.snp_makeConstraints { (make) in
            make.height.equalTo(38)
            make.top.equalTo(slidShowView.snp_bottom)
            make.left.equalTo(0)
            make.right.equalTo(0)
        }
        
        tableView.snp_makeConstraints { (make) in
            make.top.equalTo(bulletinBar.snp_bottom)
            make.bottom.equalTo(0)
            make.left.equalTo(0)
            make.right.equalTo(0)
        }
    }
}
