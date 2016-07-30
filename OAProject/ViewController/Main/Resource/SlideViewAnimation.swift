//
//  SlideViewAnimation.swift
//  OAProject
//
//  Created by Geetion on 16/7/29.
//  Copyright © 2016年 Geetion. All rights reserved.
//

import UIKit

class SlideViewAnimation: NSObject,UIViewControllerTransitioningDelegate,UIViewControllerAnimatedTransitioning {
    var gesture:UIScreenEdgePanGestureRecognizer? = nil
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
        return self
    }
    
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval {
        return 2
    }
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        //transitionContext.containerView()?.backgroundColor = UIColor.whiteColor()
        if isPresent {
            let toView = transitionContext.viewForKey(UITransitionContextToViewKey)
            let fromView = transitionContext.viewForKey(UITransitionContextFromViewKey)
            
            toView?.transform = CGAffineTransformMakeTranslation(-(toView?.frame.width)!, 0)
            //fromView?.layer.anchorPoint = CGPoint(x:Contents.ScreenWidth/2, y: Contents.ScreenHeight/2)
            UIView.animateWithDuration(self.transitionDuration(transitionContext), animations: { 
                toView?.transform = CGAffineTransformMakeTranslation(100, 0)
//                fromView?.transform = CGAffineTransformMakeTranslation(1000, Contents.ScreenHeight)
//
//                fromView?.transform = CGAffineTransformMakeTranslation((toView?.frame.width)!,0)
                fromView?.transform = CGAffineTransformMakeScale(0.5, 0.5)
                //fromView?.layer.transform = CATransform3DMakeRotation(CGFloat(M_PI), 0, 100, 0)
                }, completion: nil)
            
            transitionContext.containerView()?.addSubview(toView!)
        }
    }
    
    func interactionControllerForPresentation(animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        return CustomPercentDrivenInteractiveTransition(gesture: gesture!)
    }

}
