//
//  HomeViewController.swift
//  cwgcf-app
//
//  Created by Guanhui Guan on 12/19/19.
//  Copyright © 2019 Guanhui Guan. All rights reserved.
//

import UIKit

class HomeViewController: VCWithScroll {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupBGAndScroll(enMap["home_title"] ?? "Home")
        
        updateContentSize(1000)
    }
}

