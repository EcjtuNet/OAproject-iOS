//
//  CustomPresentationController.swift
//  OAProject
//
//  Created by Geetion on 16/7/29.
//  Copyright © 2016年 Geetion. All rights reserved.
//

import UIKit

class InteractivityTransitionDelegate: NSObject, UIViewControllerTransitioningDelegate {
    var gestureRecognizer: UIScreenEdgePanGestureRecognizer? = nil
    var targetEdge: UIRectEdge = .None
    
    func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return InteractivityTransitionAnimator(targetEdge: (gestureRecognizer?.edges)!)
    }
    
    func animationControllerForDismissedController(dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return InteractivityTransitionAnimator(targetEdge: (gestureRecognizer?.edges)!)
    }
    
    
//    func interactionControllerForPresentation(animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
//                print(self.gestureRecognizer)
//        if let gestureRecognizer = self.gestureRecognizer {
//            return TransitionInteractionController(gestureRecognizer: gestureRecognizer, edgeForDragging: targetEdge)
//        }
//        return nil
//    }
//    
//    func interactionControllerForDismissal(animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
//        if let gestureRecognizer = self.gestureRecognizer {
//            return TransitionInteractionController(gestureRecognizer: gestureRecognizer, edgeForDragging: targetEdge)
//        }
//        return nil
//    }
}
