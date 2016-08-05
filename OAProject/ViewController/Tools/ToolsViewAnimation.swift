//
//  ToolsViewAnimation.swift
//  OAProject
//
//  Created by Geetion on 16/7/31.
//  Copyright © 2016年 Geetion. All rights reserved.
//

import UIKit

class ToolsViewAnimation: NSObject,UIViewControllerTransitioningDelegate,UIViewControllerAnimatedTransitioning {
    
    private var composeButton:UIButton?
    
    init(composeButton:UIButton) {
        super.init()
        self.composeButton = composeButton
    }
    
    func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return self
    }
    
    func animationControllerForDismissedController(dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return self
    }


    func presentationControllerForPresentedViewController(presented: UIViewController, presentingViewController presenting: UIViewController, sourceViewController source: UIViewController) -> UIPresentationController? {
        return UIPresentationController(presentedViewController: presented, presentingViewController: presenting)
    }
    
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval {
        return 2
    }
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        
        let window = UIApplication.sharedApplication().keyWindow
        print(composeButton?.frame)
        window?.addSubview(composeButton!)
        
        let toView = transitionContext.viewForKey(UITransitionContextToViewKey)
        toView?.transform = CGAffineTransformMakeTranslation(0, (toView?.frame.height)!)
        UIView.animateWithDuration(transitionDuration(transitionContext), animations: { 
            toView?.transform = CGAffineTransformMakeTranslation(0, 0)
            }) { (_) in
                
        }

        transitionContext.containerView()?.addSubview(toView!)
    }

}
