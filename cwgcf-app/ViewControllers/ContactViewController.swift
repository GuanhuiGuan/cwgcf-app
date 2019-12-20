//
//  ContactViewController.swift
//  cwgcf-app
//
//  Created by Guanhui Guan on 12/20/19.
//  Copyright © 2019 Guanhui Guan. All rights reserved.
//

import Foundation

class ContactViewController : VCWithScroll {
    override func viewDidLoad() {
        setupBGAndScroll(enMap["contact_title"] ?? "Contact")
        updateContentSize(1000)
    }
}
