//
//  BulletinBoardBar.swift
//  OAProject
//
//  Created by Geetion on 16/7/30.
//  Copyright © 2016年 Geetion. All rights reserved.
//

import UIKit

class BulletinBar: UIView {
    
    private lazy var decorationView:UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red:0.26, green:0.32, blue:0.33, alpha:1.00)
        return view
    }()
    
    private lazy var label:UILabel = {
        var label = UILabel()
        label.font = UIFont.boldSystemFontOfSize(16)
        label.text = "公告栏"
        return label
    }()
    
    private lazy var bottomLine:UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red:0.95, green:0.95, blue:0.95, alpha:1.00) 
        return view
    }()

    override func layoutSubviews() {
        
        self.addSubview(bottomLine)
        bottomLine.snp_makeConstraints { (make) in
            make.left.equalTo(0)
            make.right.equalTo(0)
            make.bottom.equalTo(0)
            make.height.equalTo(1)
        }

        self.addSubview(decorationView)
        decorationView.snp_makeConstraints { (make) in
            make.left.equalTo(0)
            make.height.equalTo(17)
            make.width.equalTo(3)
            make.centerY.equalTo(self)
        }
        
        self.addSubview(label)
        label.snp_makeConstraints { (make) in
            make.centerY.equalTo(self)
            make.left.equalTo(19)
        }
    }

}
