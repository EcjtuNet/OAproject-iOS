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
        window?.addSubview(composeButton!)
        
        let toView = transitionContext.viewForKey(UITransitionContextToViewKey)
        toView?.transform = CGAffineTransformMakeTranslation(0, -1)
        UIView.animateWithDuration(transitionDuration(transitionContext), animations: { 
            toView?.transform = CGAffineTransformMakeTranslation(0, 0)
            }) { (_) in
                
        }
        print(transitionContext.containerView())
        transitionContext.containerView()?.addSubview(toView!)
    }

}
