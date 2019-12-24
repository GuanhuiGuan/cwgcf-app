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
    
    init() {
        
    }
    
    init(_ bgImageUrl : String) {
        backgroundImage = UIImage(named: bgImageUrl)
    }
}
