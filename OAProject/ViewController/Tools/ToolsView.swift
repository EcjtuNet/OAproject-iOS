//
//  ToolsView.swift
//  OAProject
//
//  Created by Geetion on 16/8/6.
//  Copyright © 2016年 Geetion. All rights reserved.
//

import UIKit

class ToolsView: UIView {
    
    private let titleList = ["公告","考勤","审批","活动","工作汇报","会议","培训","考核"]
    private let imageList = ["tools_announce","tools_attendance","tools_check","tools_activity","tools_report","tools_meeting","tools_train","tools_examine"]
    
    private let viewWidth = 70
    private let viewHeight = 80
    private let HorizentolSpace:Int = (Int(Constents.ScreenWidth) - 280) / 5
    private let firstTopSpace = 88
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor =  UIColor(red:0.97, green:0.97, blue:0.98, alpha:1.00)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        //批量加载button
        var row = -1
        for(var i = 0;i < titleList.count; i += 1 ) {
            let j = i % 4
            if j == 0{
                row += 1}
            
            let leftSpace = HorizentolSpace + (HorizentolSpace + viewWidth) * j
            let topSpace = firstTopSpace + row * (viewHeight + 50)
            
            
            let button = ToolsButton()
            button.setTitle(titleList[i])
            button.setImage(UIImage(named: imageList[i])!)
            addSubview(button)
            
            button.snp_makeConstraints { (make) in
                make.top.equalTo(topSpace)
                make.left.equalTo(leftSpace)
                make.width.equalTo(viewWidth)
                make.height.equalTo(viewHeight)
                
                
            }
        }
        
    }
    
}
