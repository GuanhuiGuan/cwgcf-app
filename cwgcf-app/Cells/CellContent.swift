//
//  CellContent.swift
//  cwgcf-app
//
//  Created by Guanhui Guan on 12/23/19.
//  Copyright © 2019 Guanhui Guan. All rights reserved.
//

import Foundation
import UIKit

class CellContent {
    var backgroundImage : UIImage!
    var avatarImage : UIImage!
    var nameStr: String = "Anonymous"
    var titleStr: String = "Attendee"
    
    init() {
        
    }
    
    init(_ bgImageUrl : String) {
        backgroundImage = UIImage(named: bgImageUrl)
    }
    
    init(_ avatarUrl: String, name: String, title: String) {
        avatarImage = UIImage(named: avatarUrl) ?? avatarImage
        nameStr = name
        titleStr = title
    }
}
