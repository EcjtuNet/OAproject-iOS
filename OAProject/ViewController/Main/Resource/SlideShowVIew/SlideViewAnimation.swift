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
    
    var toViewController:UIViewController?
    
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
        return 1
    }
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        transitionContext.containerView()?.backgroundColor = UIColor(red:0.94, green:0.94, blue:0.94, alpha:1.00)
        
        if isPresent {
            pushViewAnimation(transitionContext)
        
        }else {
            popViewAnimation(transitionContext)
        }
    }
    
    private func popViewAnimation(transitionContext: UIViewControllerContextTransitioning) {
        let containerView = transitionContext.containerView()
        toViewController = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)
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
            self.toViewController?.view.transform = CGAffineTransformIdentity
            
            }, completion: {(_) in
                transitionContext.completeTransition(true)
                
        })
        print("123")
    }
    
    private func pushViewAnimation(transitionContext: UIViewControllerContextTransitioning) {
        let fromViewController = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)
        let containerView = transitionContext.containerView()
        let toViewController = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)
        let toView = transitionContext.viewForKey(UITransitionContextToViewKey)
        let fromView = transitionContext.viewForKey(UITransitionContextFromViewKey)
        let fromFrame = transitionContext.initialFrameForViewController(fromViewController!)
        //        获取fromView截图
        let tempView = fromView?.snapshotViewAfterScreenUpdates(false)
        
        let scaleTransForm = CGAffineTransformMakeScale(0.7, 0.7)
        let fromViewTransform = CGAffineTransformTranslate(scaleTransForm, 200, 0)
        
        tempView?.transform = fromViewTransform
        //        let tap = UITapGestureRecognizer(target: self, action: #selector(SlideViewAnimation.fromViewDidClick))
        //        tempView?.addGestureRecognizer(tap)
        //        向ContainerView添加toView和fromView的截图并移除fromView避免改变fromView的动画引起的约束问题
        containerView!.addSubview(toView!)
        containerView?.bringSubviewToFront(fromView!)

        toView?.transform = CGAffineTransformMakeTranslation(-1, 0)
        fromView?.frame = fromFrame
        
        toView?.transform = CGAffineTransformMakeTranslation(-(toView?.frame.width)!, 0)
        
        UIView.animateWithDuration(self.transitionDuration(transitionContext), animations: {
            toView?.transform = CGAffineTransformMakeTranslation(0, 0)
            
            fromView?.transform = fromViewTransform
            
            //            fromView?.transform = CGAffineTransformScale(tempViewtranslate, 0.7, 0.7)
            
            //            tempView?.transform = CGAffineTransformScale(tempViewtranslate, 0.7, 0.7)
            
            }, completion: {(_) in
                let wasCanceled = transitionContext.transitionWasCancelled()
                transitionContext.completeTransition(!wasCanceled)
                containerView!.addSubview(tempView!)
        })
    }

    
    func fromViewDidClick(){
        print("123")
        toViewController?.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func interactionControllerForPresentation(animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        return CustomPercentDrivenInteractiveTransition(gesture: gesture!)
    }

}
