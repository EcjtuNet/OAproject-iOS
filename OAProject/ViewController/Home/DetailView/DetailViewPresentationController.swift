//
//  DropListPresentationController.swift
//  OAProject
//
//  Created by Geetion on 16/7/31.
//  Copyright © 2016年 Geetion. All rights reserved.
//

import UIKit

class DetailViewPresentationController: UIPresentationController {
    //    用于记录容器视图大小
    var presentFrame = CGRectZero
    
    override init(presentedViewController: UIViewController, presentingViewController: UIViewController) {
        super.init(presentedViewController: presentedViewController, presentingViewController: presentingViewController)
    }
    
    override func containerViewWillLayoutSubviews()
    {
        super.containerViewWillLayoutSubviews()
        
        containerView?.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.15)
        
        // 修改弹出视图的大小
        if presentFrame == CGRectZero{
            print(containerView?.frame)
            presentedView()?.snp_makeConstraints(closure: { (make) in
                make.left.equalTo(40)
                make.right.equalTo(-40)
                make.top.equalTo(134)
                make.bottom.equalTo(-134)
            })
        }else
        {
            presentedView()?.frame = presentFrame
        }
        
        // 为容器视图添加点击事件
        let tap = UITapGestureRecognizer(target: self, action: #selector(DropListPresentationController.close))
        containerView?.addGestureRecognizer(tap)
    }
    
    
    func close(){

        presentedViewController.dismissViewControllerAnimated(true, completion: nil)
    }
}
