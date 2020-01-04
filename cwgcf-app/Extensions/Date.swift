//
//  Date.swift
//  cwgcf-app
//
//  Created by Guanhui Guan on 12/27/19.
//  Copyright © 2019 Guanhui Guan. All rights reserved.
//

import Foundation

extension String {
    func toDateWithTime() -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        dateFormatter.locale = Locale(identifier: "en_US_POSIX") // set locale to reliable US_POSIX
        return toDateInternal(dateFormatter)
    }
    
    func toDate() -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        dateFormatter.locale = Locale(identifier: "en_US_POSIX") // set locale to reliable US_POSIX
        return toDateInternal(dateFormatter)
    }
    
    func formatToDMY() -> String {
        let date = toDate()
        return date?.toStringDateOnly() ?? ""
    }
    
    private func toDateInternal(_ dateFormatter : DateFormatter) -> Date? {
        guard let date = dateFormatter.date(from:self) else { return nil }
        return date
    }
}

extension Date {
    func toStringDateOnly() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMM, yyyy"
        dateFormatter.locale = Locale(identifier: "en_US_POSIX") // set locale to reliable US_POSIX
        return dateFormatter.string(from: self)
    }
    
    func toStringWithTime() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        dateFormatter.locale = Locale(identifier: "en_US_POSIX") // set locale to reliable US_POSIX
        return dateFormatter.string(from: self)
    }
    
    func toStrWithFormat(_ fmt : String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = fmt
        dateFormatter.locale = Locale(identifier: "en_US_POSIX") // set locale to reliable US_POSIX
        // dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
        dateFormatter.timeZone = TimeZone.autoupdatingCurrent
        return dateFormatter.string(from: self)
    }
}
