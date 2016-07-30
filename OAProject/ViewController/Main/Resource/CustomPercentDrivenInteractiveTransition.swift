//
//  CustomPercentDrivenInteractiveTransition.swift
//  OAProject
//
//  Created by Geetion on 16/7/29.
//  Copyright © 2016年 Geetion. All rights reserved.
//

import UIKit

class CustomPercentDrivenInteractiveTransition: UIPercentDrivenInteractiveTransition {
    
    var transitionContext: UIViewControllerContextTransitioning?
    
    init(gesture:UIScreenEdgePanGestureRecognizer) {
        super.init()
        gesture.addTarget(self, action: "gestureRecognizeDidUpdate:")
    }
    
    override func startInteractiveTransition(transitionContext: UIViewControllerContextTransitioning) {
        super.startInteractiveTransition(transitionContext)
        self.transitionContext = transitionContext
    }
    
    func gestureRecognizeDidUpdate(gestureRecognizer: UIScreenEdgePanGestureRecognizer) {
        print("asd")
        switch gestureRecognizer.state {
        case .Began: break
        case .Changed: self.updateInteractiveTransition(self.percentForGesture(gestureRecognizer))  //手势滑动，更新百分比
        case .Ended:    // 滑动结束，判断是否超过一半，如果是则完成剩下的动画，否则取消动画
            if self.percentForGesture(gestureRecognizer) >= 0.5 {
                self.finishInteractiveTransition()
            }
            else {
                self.cancelInteractiveTransition()
            }
        default: self.cancelInteractiveTransition()
        }
    }
    
    private func percentForGesture(gesture: UIScreenEdgePanGestureRecognizer) -> CGFloat {
        let fingerLocation = gesture.locationInView(transitionContext?.containerView())
        let percent = fingerLocation.x/(transitionContext?.containerView()?.frame.width)!
        switch gesture.state {
        case .Began:break
        case .Changed:return percent
        case .Ended:
            if (percent > 0.5) {
                self.finishInteractiveTransition()
            }else{
                cancelInteractiveTransition()
            }
        default:
            break
        }
        return fingerLocation.x/(transitionContext?.containerView()?.frame.width)!
    }

}
