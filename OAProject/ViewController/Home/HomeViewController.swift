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
    
    lazy var dropListAnimation = DropListAnimation()
    lazy var customTransitionDelegate: InteractivityTransitionDelegate = InteractivityTransitionDelegate()
    
    lazy var gesture:UIScreenEdgePanGestureRecognizer? = UIScreenEdgePanGestureRecognizer(target: self, action: "asd")
    
    lazy var slideMenuViewController:SlideMenuViewController = SlideMenuViewController()
    
    let bulletinBar = BulletinBar()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubviews()
        setupNavigationBar()
        self.view.backgroundColor = UIColor.whiteColor()
        gesture?.edges = .Left
        customTransitionDelegate.targetEdge = .Left
        self.view.addGestureRecognizer(gesture!)
        customTransitionDelegate.gestureRecognizer = gesture
        slideMenuViewController.transitioningDelegate = customTransitionDelegate
        
    }
    
    private func setupNavigationBar() {
//        设置navagationbar背景色
        self.navigationController?.navigationBar.barTintColor = UIColor.whiteColor()
//        设置左右按钮
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "home_navbar_leftbar"), style: .Plain, target: self, action:#selector(HomeViewController.leftButtonDidClick))
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "home_navbar_searchbar"), style: .Plain, target: self, action: "123")
//        设置标题按钮
        let titleBtn = TitleButton()
        titleBtn.setTitle("极客江南", forState: UIControlState.Normal)
        titleBtn.addTarget(self, action: #selector(HomeViewController.titleButtonDidClick), forControlEvents: UIControlEvents.TouchUpInside)
        navigationItem.titleView = titleBtn
    }
    var an:SlideViewAnimation?
    func leftButtonDidClick() {
        if self.presentedViewController == nil {
            self.presentViewController(slideMenuViewController, animated: true, completion: nil)
        }

    }
    
    func asd () {
        
//        an?.gesture = gesture
        leftButtonDidClick()
    }
    
    let tableView = UITableView()
    
    func titleButtonDidClick() {
        let vc = UIStoryboard(name: "DroplistView", bundle: nil).instantiateInitialViewController()
        vc!.transitioningDelegate = dropListAnimation
        vc!.modalPresentationStyle = .Custom
        self.presentViewController(vc!, animated: true, completion: nil)
        
    }
    
    private func setupSubviews() {
        let slidShowView = SlideShowView()
        self.view.addSubview(slidShowView)
        slidShowView.snp_makeConstraints { (make) in
            make.top.equalTo(64)
            make.right.equalTo(0)
            make.left.equalTo(0)
            make.height.equalTo(168)
        }
        
        
        self.view.addSubview(bulletinBar)
        bulletinBar.snp_makeConstraints { (make) in
            make.height.equalTo(38)
            make.top.equalTo(slidShowView.snp_bottom)
            make.left.equalTo(0)
            make.right.equalTo(0)
        }
        
        
        self.view.addSubview(tableView)
        tableView.snp_makeConstraints { (make) in
            make.top.equalTo(bulletinBar.snp_bottom)
            make.bottom.equalTo(0)
            make.left.equalTo(0)
            make.right.equalTo(0)
        }
    }
    
    func gestureRecognizer(gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWithGestureRecognizer otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
    
    
    
    
    
}

extension HomeViewController{
    
}
