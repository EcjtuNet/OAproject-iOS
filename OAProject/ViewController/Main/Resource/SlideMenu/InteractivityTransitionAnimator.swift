//
//  CustomPresentationController.swift
//  OAProject
//
//  Created by Geetion on 16/7/29.
//  Copyright © 2016年 Geetion. All rights reserved.
//

import UIKit

class InteractivityTransitionAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    let targetEdge: UIRectEdge
    
    init(targetEdge: UIRectEdge) {
        self.targetEdge = targetEdge
    }
    
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval {
        return 0.35
    }
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        transitionContext.containerView()?.backgroundColor = UIColor(red:0.94, green:0.94, blue:0.94, alpha:1.00)
        
        let fromViewController = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)
        let toViewController = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)
        let isPresenting = (toViewController?.presentingViewController == fromViewController)
        
        if isPresenting {
            pushViewAnimation(transitionContext)
        }else {
            popViewAnimation(transitionContext)
        }
    }
    
    private func popViewAnimation(transitionContext: UIViewControllerContextTransitioning) {
        let containerView = transitionContext.containerView()
        
        let toView = transitionContext.viewForKey(UITransitionContextToViewKey)
        let fromView = transitionContext.viewForKey(UITransitionContextFromViewKey)
        
        containerView!.addSubview(toView!)
        
        UIView.animateWithDuration(transitionDuration(transitionContext), animations: {
            
            toView?.transform = CGAffineTransformIdentity
            
            fromView?.transform = CGAffineTransformMakeTranslation(-(fromView?.frame.width)!, 0)
        }) { (_) in
            let wasCanceled = transitionContext.transitionWasCancelled()
            transitionContext.completeTransition(!wasCanceled)
        }
    }
    
    private func pushViewAnimation(transitionContext: UIViewControllerContextTransitioning) {
        
        let containerView = transitionContext.containerView()
        
        let toView = transitionContext.viewForKey(UITransitionContextToViewKey)
        let fromView = transitionContext.viewForKey(UITransitionContextFromViewKey)
        let fromFrame = fromView?.frame
        //        获取fromView截图
        let tempView = fromView?.snapshotViewAfterScreenUpdates(false)
        //        创建动画
        let scaleTransForm = CGAffineTransformMakeScale(0.7, 0.7)
        let fromViewTransform = CGAffineTransformTranslate(scaleTransForm, 275, 0)
        
        tempView?.transform = fromViewTransform
        let tap = UITapGestureRecognizer(target: self, action: #selector(InteractivityTransitionAnimator.fromViewDidClick))
        containerView!.addGestureRecognizer(tap)
        
        containerView!.addSubview(toView!)
        containerView?.bringSubviewToFront(fromView!)
        
        toView?.transform = CGAffineTransformMakeTranslation(-1, 0)
        fromView?.frame = fromFrame!
        
        toView?.transform = CGAffineTransformMakeTranslation(-(toView?.frame.width)!, 0)
        
        UIView.animateWithDuration(transitionDuration(transitionContext), animations: {
            toView?.transform = CGAffineTransformMakeTranslation(0, 0)
            
            fromView?.transform = fromViewTransform
            
            
            }, completion: {(_) in
                let wasCanceled = transitionContext.transitionWasCancelled()
                transitionContext.completeTransition(!wasCanceled)
                containerView!.addSubview(tempView!)
        })
    }
    
    func fromViewDidClick() {
        print("123")
    }
}
