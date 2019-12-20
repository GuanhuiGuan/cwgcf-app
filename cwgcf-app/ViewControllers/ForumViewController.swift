//
//  ForumViewController.swift
//  cwgcf-app
//
//  Created by Guanhui Guan on 12/20/19.
//  Copyright © 2019 Guanhui Guan. All rights reserved.
//

import Foundation
import UIKit

class ForumViewController : VCWithScroll {
    override func viewDidLoad() {
        setupBGAndScroll(enMap["forum_title"] ?? "Forum")
        updateContentSize(1000)
    }
}
