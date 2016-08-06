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
        button.showsTouchWhenHighlighted = true
        button.frame.size = CGSize(width: 50, height: 50)
        return button
    }()
    
    private lazy var title:UILabel = {
       let label = UILabel()
        label.textColor = Constents.TextColor
        label.font = UIFont.systemFontOfSize(14)
        label.textAlignment = NSTextAlignment.Center

        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(imageButton)
        addSubview(title)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
    override func layoutSubviews() {
        super.layoutSubviews()
        imageButton.center = CGPoint(x: self.frame.width / 2, y: 25)
        title.frame.origin = CGPoint(x: 0, y: 66)
        title.frame.size = CGSize(width: self.frame.width, height: 14)
    }
    
    
    
    func setImage(image:UIImage) {
        imageButton.setImage(image, forState: .Normal)
    }
    
    func setTitle(title:String) {
        self.title.text = title
        self.title.sizeToFit()
    }
}
