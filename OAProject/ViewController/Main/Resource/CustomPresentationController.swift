//
//  CustomPresentationController.swift
//  OAProject
//
//  Created by Geetion on 16/7/29.
//  Copyright © 2016年 Geetion. All rights reserved.
//

import UIKit

class CustomPresentationController: UIPresentationController {
    
    var prensentFrame = CGRectZero
    
    
    override init(presentedViewController: UIViewController, presentingViewController: UIViewController) {
        super.init(presentedViewController: presentedViewController, presentingViewController: presentingViewController)
    }
    
    override func containerViewWillLayoutSubviews() {
        
        if prensentFrame == CGRectZero {
            presentedView()?.frame = CGRect(x: 0, y: 0, width: 100, height: UIScreen.mainScreen().bounds.height)
        } else {
            presentedView()?.frame = prensentFrame
        }
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(CustomPresentationController.viewDidClick))
        containerView?.addGestureRecognizer(tap)
    }
    
    func viewDidClick() {
        presentedViewController.dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    
}
