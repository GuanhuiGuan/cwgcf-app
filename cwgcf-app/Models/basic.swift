//
//  basic.swift
//  cwgcf-app
//
//  Created by Guanhui Guan on 1/8/20.
//  Copyright © 2020 Guanhui Guan. All rights reserved.
//

import Foundation

class Metadata : Codable {
    var createdAt : Int64 = 0
    var createdBy : String = ""
    var updatedAt : Int64 = 0
    var updatedBy : String = ""
}

class Interval : Codable {
    var startTime : Int64 = 0
    var endTime : Int64 = 0
}
