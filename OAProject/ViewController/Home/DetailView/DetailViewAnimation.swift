//
//  DropListAnimation.swift
//  OAProject
//
//  Created by Geetion on 16/7/31.
//  Copyright © 2016年 Geetion. All rights reserved.
//

import UIKit

class DetailViewAnimation: NSObject,UIViewControllerTransitioningDelegate,UIViewControllerAnimatedTransitioning {
    //    用于判断当前菜单状态
    var isPresent = false
    
    func presentationControllerForPresentedViewController(presented: UIViewController, presentingViewController presenting: UIViewController, sourceViewController source: UIViewController) -> UIPresentationController? {
        return DetailViewPresentationController(presentedViewController: presented,presentingViewController: presenting)
    }
    
    func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        isPresent = false
        
        return self
    }
    
    func animationControllerForDismissedController(dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        isPresent = true
        
        return self
    }
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        
        if !isPresent {
            //            弹出动画
            let toView = transitionContext.viewForKey(UITransitionContextToViewKey)
            
            toView?.transform = CGAffineTransformMakeScale(0, 0)
            
            UIView.animateWithDuration(transitionDuration(transitionContext), animations: {
                toView?.transform = CGAffineTransformIdentity
            }) { (_) in
                transitionContext.completeTransition(true)
            }
            
            transitionContext.containerView()?.addSubview(toView!)
        }else {
            //            消失动画
            let fromView = transitionContext.viewForKey(UITransitionContextFromViewKey)
            
            UIView.animateWithDuration(transitionDuration(transitionContext), animations: {
                fromView?.alpha = 0
            }) { (_) in
                fromView?.removeFromSuperview()
                transitionContext.completeTransition(true)
            }
            
        }
        
        
    }
    
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval {
        return 0.3
    }
    
}
