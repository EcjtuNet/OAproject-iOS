//
//  DropListPresentationController.swift
//  OAProject
//
//  Created by Geetion on 16/7/31.
//  Copyright © 2016年 Geetion. All rights reserved.
//

import UIKit

class DropListPresentationController: UIPresentationController {
    //    用于记录容器视图大小
    var presentFrame = CGRectZero
    
    override init(presentedViewController: UIViewController, presentingViewController: UIViewController) {
        super.init(presentedViewController: presentedViewController, presentingViewController: presentingViewController)
    }
    
    override func containerViewWillLayoutSubviews()
    {
        // 修改弹出视图的大小
        if presentFrame == CGRectZero{
            
            presentedView()?.frame = CGRect(x: 100, y: 56, width: 200, height: 200)
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
