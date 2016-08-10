//
//  loginView.swift
//  OAProject
//
//  Created by Geetion on 8/10/16.
//  Copyright © 2016 Geetion. All rights reserved.
//

import UIKit

class LoginView: UIView {
    
    private lazy var backgroundImage:UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "loginBackground")
        return imageView
    }()
    
    private lazy var shadowMask:UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "loginShadowMask")
        imageView.alpha = 0.9
        return imageView
    }()
    
    private lazy var oryoucan:UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "oryoucan")
        imageView.contentMode = UIViewContentMode.ScaleAspectFit
        return imageView
    }()
    
    private lazy var signupButton:UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "sign up"), forState: .Normal)
        button.frame.size = CGSize(width: 70, height: 20)
        return button
    }()
    
    private lazy var signinButton:UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "sign in"), forState: .Normal)
        button.frame.size = CGSize(width: 70, height: 20)
        return button
    }()
    
    private lazy var wxLoginButton:UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "wxlogin"), forState: .Normal)
        button.frame.size = CGSize(width: 70, height: 40)
        return button
    }()
    
    private lazy var qqLoginButton:UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "qqlogin"), forState: .Normal)
        button.frame.size = CGSize(width: 70, height: 40)
        button.addTarget(self, action: "asd", forControlEvents: .TouchUpInside)
        return button
    }()

    
    

    override init(frame: CGRect) {
        super.init(frame: frame)
        

        addSubview(backgroundImage)
        addSubview(shadowMask)
        addSubview(signupButton)
        addSubview(signinButton)
        addSubview(oryoucan)
        addSubview(wxLoginButton)
        addSubview(qqLoginButton)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        backgroundImage.frame = self.frame
        shadowMask.frame = self.frame
        
        signupButton.snp_makeConstraints { (make) in
            make.right.equalTo(-40)
            make.bottom.equalTo(-114)
        }
        
        signinButton.snp_makeConstraints { (make) in
            make.left.equalTo(40)
            make.bottom.equalTo(-114)
        }
        
        oryoucan.snp_makeConstraints { (make) in
            make.left.equalTo(40)
            make.right.equalTo(-40)
            make.height.equalTo(8)
            make.bottom.equalTo(-80)
        }
        
        qqLoginButton.snp_makeConstraints { (make) in
            make.left.equalTo(60)
            make.bottom.equalTo(-25)
            make.top.equalTo(oryoucan.snp_bottom).offset(20)
        }
        
        wxLoginButton.snp_makeConstraints { (make) in
            make.centerY.equalTo(qqLoginButton)
            make.right.equalTo(-60)
        }
    }

}
