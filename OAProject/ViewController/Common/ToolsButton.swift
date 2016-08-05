//
//  ToolsButton.swift
//  OAProject
//
//  Created by Geetion on 16/8/5.
//  Copyright © 2016年 Geetion. All rights reserved.
//

import UIKit

class ToolsButton: UIView {
    
    private lazy var imageButton:UIButton = {
        let button = UIButton()
        button.adjustsImageWhenHighlighted = true
        button.frame.size = CGSize(width: 50, height: 50)
        return button
    }()
    
    private lazy var title:UILabel = {
       let label = UILabel()
        label.textColor = UIColor.blackColor()
        label.font = UIFont.systemFontOfSize(14)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.frame.size = CGSize(width: 50, height: 80)
        addSubview(imageButton)
        addSubview(title)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        NSBundle.mainBundle().loadNibNamed("ToolsButton", owner: self, options: nil)
    }
    
    
    
    func setImage(image:UIImage) {
        imageButton.setImage(image, forState: .Normal)
    }
    
    func setTitle(title:String) {
        self.title.text = title
    }
}
