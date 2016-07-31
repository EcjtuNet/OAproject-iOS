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
        

        
        let containerView = transitionContext.containerView()
        
        if isPresent {
            let toView = transitionContext.viewForKey(UITransitionContextToViewKey)
            let fromView = transitionContext.viewForKey(UITransitionContextFromViewKey)
            let tempView = fromView?.snapshotViewAfterScreenUpdates(false)
            
            containerView!.addSubview(toView!)
            containerView!.addSubview(tempView!)
            
            fromView?.frame = CGRectZero
            toView?.transform = CGAffineTransformMakeTranslation(-(toView?.frame.width)!, 0)

            UIView.animateWithDuration(self.transitionDuration(transitionContext), animations: { 
                toView?.transform = CGAffineTransformMakeTranslation(0, 0)
                

                let fromViewtranslate = CGAffineTransformMakeTranslation(200, 0)
                
                tempView?.transform = CGAffineTransformScale(fromViewtranslate, 0.7, 0.7)

                }, completion: {(_) in
                transitionContext.completeTransition(true)
            })
        
        }else {
            let toViewController = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)
            let finalFrame = transitionContext.finalFrameForViewController(toViewController!)
            let fromView = transitionContext.viewForKey(UITransitionContextFromViewKey)
            let tempView = transitionContext.containerView()?.subviews.first

            
            tempView?.removeFromSuperview()
            containerView!.addSubview((toViewController?.view!)!)
            toViewController?.view.frame = finalFrame
            let toViewtranslate = CGAffineTransformMakeTranslation(200, 0)
            toViewController?.view.transform = CGAffineTransformScale(toViewtranslate, 0.7, 0.7)

            
            UIView.animateWithDuration(self.transitionDuration(transitionContext), animations: {
                fromView?.transform = CGAffineTransformMakeTranslation(-(fromView?.frame.width)!, 0)
                toViewController?.view.transform = CGAffineTransformIdentity
//
//                
//                let toViewtranslate = CGAffineTransformMakeTranslation(-200, 0)
//                
//                tempView?.transform = CGAffineTransformIdentity
                
                }, completion: {(_) in
                    transitionContext.completeTransition(true)
                    print(containerView?.subviews)
            })
        }
    }
    
//    func interactionControllerForPresentation(animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
//        return CustomPercentDrivenInteractiveTransition(gesture: gesture!)
//    }

}
