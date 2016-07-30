//
//  ImageScrollView.swift
//  OAProject
//
//  Created by Geetion on 16/7/30.
//  Copyright © 2016年 Geetion. All rights reserved.
//

import UIKit

@objc protocol SlideShowViewViewDelegate {
    optional func slideShowView(slideShowView:SlideShowView, didSelectRowAtIndexPath index:NSIndexPath)
}

protocol SlideShowViewDataSource {

    func slideShowView(slideShowView:SlideShowView ) -> Int
    
    func slideShowView(slideShowView:SlideShowView, itemAtIndexPath index:NSIndexPath) -> UIImage

}

class SlideShowView: UIView {
    
    var delegate:SlideShowViewViewDelegate?
    var dataSource:SlideShowViewDataSource?
    //指示器背景色
    var indicatorBackgroundColor = UIColor(red:0.84, green:0.85, blue:0.86, alpha:1.00)
    //指示器颜色
    var indictorColor = UIColor(red:0.15, green:0.22, blue:0.24, alpha:1.00)

    private var viewWidth:CGFloat?
    private var viewHeight:CGFloat?
    
    private let indicatorHeight:CGFloat = 2.0
    
    private var numberOfItems = 3
    
    lazy var scrollView:UIScrollView = {
        let view = UIScrollView()
        view.delegate = self
        view.pagingEnabled = true
        view.showsHorizontalScrollIndicator = false
        return view
    }()
    
    lazy var indicator = UIView()
    
    
    override func layoutSubviews() {
        viewWidth = frame.width
        viewHeight = frame.height
        if let count = dataSource?.slideShowView(self) {
            numberOfItems = count
        }
        
        setupSubViews()
        print(frame)
    }
    
//    init() {
//        return self
//    }
//    
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//
//    }
//    
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    
    private func setupSubViews() {
        
        scrollView.contentSize = CGSize(width: viewWidth! * CGFloat(numberOfItems), height: self.frame.height)
        scrollView.frame = self.frame
        self.addSubview(scrollView)
        
        setupIndicator()
    }
    
    private func setupIndicator() {
//        设置指示器背景
        let indicatorBackground = UIView()
        indicatorBackground.backgroundColor = indicatorBackgroundColor
        indicatorBackground.frame = CGRect(x: 0, y: viewHeight!-indicatorHeight, width: viewWidth!, height: indicatorHeight)
        self.addSubview(indicatorBackground)
        self.bringSubviewToFront(indicatorBackground)
//        设置指示器
        let indicatorWidth = viewWidth! / CGFloat(numberOfItems)
        indicator.frame = CGRect(x: 0, y: 0, width: indicatorWidth, height: indicatorHeight)
        indicator.backgroundColor = UIColor(red:0.15, green:0.22, blue:0.24, alpha:1.00)
        indicatorBackground.addSubview(indicator)
    }
    
    private func setupDataSource() {
        for i in 0...numberOfItems {
            let imageView = UIImageView()
            let indexPath = NSIndexPath(index: i)
            if let image = dataSource?.slideShowView(self, itemAtIndexPath: indexPath) {
                imageView.image = image
                imageView.frame = CGRect(x: viewWidth! * CGFloat(i), y: 0, width: viewWidth!, height: viewHeight!)
                scrollView.addSubview(imageView)
            }
        }
    }
}

extension SlideShowView:UIScrollViewDelegate {
    func scrollViewDidScroll(scrollView: UIScrollView) {
        let slideOffset = scrollView.contentOffset.x / CGFloat(numberOfItems)
        indicator.frame.origin = CGPoint(x: slideOffset,y: 0)
    }
}
