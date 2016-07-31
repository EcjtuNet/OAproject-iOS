//
//  SlideViewAnimation.swift
//  OAProject
//
//  Created by Geetion on 16/7/29.
//  Copyright © 2016年 Geetion. All rights reserved.
//

import UIKit

class SlideViewAnimation: NSObject,UIViewControllerTransitioningDelegate,UIViewControllerAnimatedTransitioning {
    //保存界面手势
    var gesture:UIScreenEdgePanGestureRecognizer? = nil
    //记录当前状态
    var isPresent = true
    
    func presentationControllerForPresentedViewController(presented: UIViewController, presentingViewController presenting: UIViewController, sourceViewController source: UIViewController) -> UIPresentationController? {
        return CustomPresentationController(presentedViewController: presented, presentingViewController: presenting)
    }
    
    func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        isPresent = true
        return self
    }
    
    func animationControllerForDismissedController(dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        isPresent = false
        print("22")
        return self
    }
    
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval {
        return 1
    }
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        transitionContext.containerView()?.backgroundColor = UIColor(red:0.94, green:0.94, blue:0.94, alpha:1.00)
        if isPresent {
            let toView = transitionContext.viewForKey(UITransitionContextToViewKey)
            let fromView = transitionContext.viewForKey(UITransitionContextFromViewKey)
            
            toView?.transform = CGAffineTransformMakeTranslation(-(toView?.frame.width)!, 0)

            UIView.animateWithDuration(self.transitionDuration(transitionContext), animations: { 
                toView?.transform = CGAffineTransformMakeTranslation(0, 0)
                

                let fromViewtranslate = CGAffineTransformMakeTranslation(200, 0)
                
                fromView?.transform = CGAffineTransformScale(fromViewtranslate, 0.7, 0.7)

                }, completion: nil)
            
            transitionContext.containerView()?.addSubview(toView!)
            transitionContext.containerView()?.bringSubviewToFront(fromView!)
        }else {
            
        }
    }
    
//    func interactionControllerForPresentation(animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
//        return CustomPercentDrivenInteractiveTransition(gesture: gesture!)
//    }

}
