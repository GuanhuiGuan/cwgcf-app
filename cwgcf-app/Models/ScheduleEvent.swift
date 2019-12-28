//
//  ScheduleEvent.swift
//  cwgcf-app
//
//  Created by Guanhui Guan on 12/28/19.
//  Copyright © 2019 Guanhui Guan. All rights reserved.
//

import Foundation
import UIKit

class HourMin {
    var hour : Int = 0
    var min : Int = 0
    
    init(hour : Int, min : Int) {
        self.hour = hour
        self.min = min
    }
    
    func toString() -> String {
        let hPrefix = hour < 10 ? "0" : ""
        let mPrefix = min < 10 ? "0" : ""
        return "\(hPrefix)\(hour):\(mPrefix)\(min)"
    }
    
    static func fromString(_ str : String) -> HourMin? {
        if str.isEmpty {
            return nil
        }
        let splits = str.split(separator: ":")
        let h = Int(splits[0]) ?? -1
        let m = Int(splits[1]) ?? -1
        // TODO: more validation
        if h < 0 || m < 0 {
            return nil
        }
        return HourMin(hour: h, min: m)
    }
}

class ScheduleEvent {
    var startTime : HourMin?
    var endTime : HourMin?
    var title : String = ""
    var description : String = ""

    init(st : String, et : String, t : String, desc : String) {
        startTime = HourMin.fromString(st)
        endTime = HourMin.fromString(et)
        title = t
        description = desc
    }
    
    
    func getOffset() -> CGFloat {
        let h = CGFloat(startTime?.hour ?? 0)
        let m = CGFloat(startTime?.min ?? 0)
        return (h + m / 60.0) * timeTableCellHeight
    }
    
    func getHeight() -> CGFloat {
        let sh = CGFloat(startTime?.hour ?? 0)
        let sm = CGFloat(startTime?.min ?? 0)
        let eh = CGFloat(endTime?.hour ?? 0)
        let em = CGFloat(endTime?.min ?? 0)
        return ((eh-sh) + (em-sm) / 60.0) * timeTableCellHeight
    }
}
