//
//  HomeTableViewController.swift
//  OAProject
//
//  Created by Geetion on 16/7/29.
//  Copyright © 2016年 Geetion. All rights reserved.
//

import UIKit
import SnapKit

class HomeViewController: UIViewController,UIGestureRecognizerDelegate {
    
    private lazy var animation = DetailViewAnimation()
    
    private lazy var dropListAnimation = DropListAnimation()
    
    private lazy var customTransitionDelegate: InteractivityTransitionDelegate = InteractivityTransitionDelegate()
    
    private lazy var gesture:UIScreenEdgePanGestureRecognizer? = UIScreenEdgePanGestureRecognizer(target: self, action: "asd")
    
    private lazy var slideMenuViewController:SlideMenuViewController = SlideMenuViewController()
    
    override func loadView() {
        view = HomeView()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        gesture?.edges = .Left
        view.addGestureRecognizer(gesture!)
        customTransitionDelegate.gestureRecognizer = gesture
        slideMenuViewController.transitioningDelegate = customTransitionDelegate
        
    }
    
    private func setupNavigationBar() {
//        设置navagationbar背景色
        navigationController?.navigationBar.barTintColor = UIColor.whiteColor()
//        设置左右按钮
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "home_navbar_leftbar"), style: .Plain, target: self, action:#selector(HomeViewController.leftButtonDidClick))
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "home_navbar_searchbar"), style: .Plain, target: self, action:#selector(HomeViewController.rightButtonDidClick))
//        设置标题按钮
        let titleBtn = TitleButton()
        titleBtn.setTitle("极客江南", forState: UIControlState.Normal)
        titleBtn.addTarget(self, action: #selector(HomeViewController.titleButtonDidClick), forControlEvents: UIControlEvents.TouchUpInside)
        navigationItem.titleView = titleBtn
    }

    func leftButtonDidClick() {
        if presentedViewController == nil {
            presentViewController(slideMenuViewController, animated: true, completion: nil)
        }

    }
    
    func rightButtonDidClick() {
        let vc = UIStoryboard(name: "DetailView", bundle: nil).instantiateInitialViewController()!
        vc.transitioningDelegate = animation
        vc.modalPresentationStyle = UIModalPresentationStyle.Custom
        presentViewController(vc, animated: true, completion: nil)
    }
    
    func asd () {
        
        leftButtonDidClick()
    }
    
    func titleButtonDidClick() {
        let vc = UIStoryboard(name: "DroplistView", bundle: nil).instantiateInitialViewController()!
//        let vc = DroplistViewController()
        vc.transitioningDelegate = dropListAnimation
        vc.modalPresentationStyle = .Custom
        presentViewController(vc, animated: true, completion: nil)
    }
    
    
    func gestureRecognizer(gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWithGestureRecognizer otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
    
}

extension HomeViewController{
    
}
