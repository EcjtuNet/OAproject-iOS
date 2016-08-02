//
//  CustomSegmentControl.swift
//  OAProject
//
//  Created by Geetion on 16/8/1.
//  Copyright © 2016年 Geetion. All rights reserved.
//

import UIKit

enum CustomSegmentControlSelected {
    case left
    case right
}

class CustomSegmentControl: UIView {
//    两种状态背景图片
    private lazy var leftSelectedImage = UIImage(named: "contact_navbar_message")
    private lazy var rightSelectedImage = UIImage(named: "contact_navbar_book")
//    两种状态文字颜色
    private lazy var normalTitleColor = UIColor(red: 66.0/255, green: 82.0/255, blue: 85.0/255, alpha: 1.0)
    private lazy var selectedTitleColor = UIColor.whiteColor()
//    记录当前选择状态
    var selected = CustomSegmentControlSelected.left
    
    private lazy var backgroudImageView:UIImageView = {
        let imageView = UIImageView(image: self.leftSelectedImage)
        imageView.sizeToFit()
        return imageView
    }()
    
    private lazy var leftButton:UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor.clearColor()
        button.addTarget(self, action: #selector(CustomSegmentControl.buttonDidClick(_:)), forControlEvents: .TouchUpInside)
        button.selected = true
        button.setTitleColor(self.normalTitleColor, forState: .Normal)
        button.setTitleColor(self.selectedTitleColor, forState: .Selected)
        button.titleLabel?.font = UIFont.systemFontOfSize(14)
        return button
    }()
    
    private lazy var rightButton:UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor.clearColor()
        button.addTarget(self, action: #selector(CustomSegmentControl.buttonDidClick(_:)), forControlEvents: .TouchUpInside)
        button.setTitleColor(self.normalTitleColor, forState: .Normal)
        button.setTitleColor(self.selectedTitleColor, forState: .Selected)
        button.titleLabel?.font = UIFont.systemFontOfSize(14)
        return button
    }()
//    设置左右按钮文字
    func setSegmentTitle(leftTitle:String,rightTitle:String) {
        leftButton.setTitle(leftTitle, forState: .Normal)
        rightButton.setTitle(rightTitle, forState: .Normal)
    }
    
    func buttonDidClick(sender:UIButton) {
        if backgroudImageView.image == leftSelectedImage{
            if sender != leftButton {
                backgroudImageView.image = rightSelectedImage
                leftButton.selected = false
                rightButton.selected = true
                selected = .left
            }
        }else {
            if sender != rightButton {
                backgroudImageView.image = leftSelectedImage
                leftButton.selected = true
                rightButton.selected = false
                selected = .right
            }
        }
        print(leftButton.selected)
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(backgroudImageView)
        self.addSubview(leftButton)
        self.addSubview(rightButton)
        self.frame = backgroudImageView.frame
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let buttonFrame = CGSize(width: self.frame.width / 2, height: self.frame.height)
        
        leftButton.frame.origin = CGPoint(x: 0.0, y: 0.0)
        leftButton.frame.size = buttonFrame
        rightButton.frame.origin = CGPoint(x: leftButton.frame.width,y: 0)
        rightButton.frame.size = buttonFrame
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
