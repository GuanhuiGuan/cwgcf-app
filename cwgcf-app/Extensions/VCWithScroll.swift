//
//  VCWithScroll.swift
//  cwgcf-app
//
//  Created by Guanhui Guan on 12/19/19.
//  Copyright © 2019 Guanhui Guan. All rights reserved.
//

import Foundation
import UIKit

class VCWithScroll : UIViewController {
    
    
    lazy var contentSize = CGSize(width: self.view.frame.width, height: 20)
    lazy var scrollView : UIScrollView = {
        let v = UIScrollView()
        v.frame = self.view.bounds
        return v
    }()
    lazy var containerView : UIView = {
        let v = UIView()
        return v
    }()
    
    func setupBGAndScroll(_ title:String) {
        view.backgroundColor = backgroundColor
        self.navigationItem.title = title
        
        view.addSubview(scrollView)
        scrollView.addSubview(containerView)
    }
    
    func setupBGAndScroll(_ title:String, bgColor: UIColor) {
        view.backgroundColor = bgColor
        self.navigationItem.title = title
        
        view.addSubview(scrollView)
        scrollView.addSubview(containerView)
    }
    
    func updateContentSize(_ addedView:UIView) {
        containerView.setNeedsLayout()
        containerView.layoutIfNeeded()
        updateContentSize(addedView.frame.height)
    }
    
    func updateContentSize(_ addedHeight:CGFloat) {
        contentSize.height += addedHeight
        scrollView.contentSize = contentSize
        containerView.frame.size = contentSize
    }
    
    func updateContentSize(_ addedView:UIView, constant: CGFloat) {
        containerView.setNeedsLayout()
        containerView.layoutIfNeeded()
        updateContentSize(addedView.frame.height + constant)
    }
}
