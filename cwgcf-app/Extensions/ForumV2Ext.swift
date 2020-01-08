//
//  ForumV2Ext.swift
//  cwgcf-app
//
//  Created by Guanhui Guan on 1/8/20.
//  Copyright © 2020 Guanhui Guan. All rights reserved.
//

import Foundation
import UIKit

extension ForumPostV2 {
    func getTitle() -> String {
        if title.isEmpty {
            return "<Title missing>"
        }
        return title
    }
    
    func getContent() -> String {
        if content.isEmpty {
            return ""
        }
        return content
    }
    
    func getTime() -> String {
        let date = Date(timeIntervalSince1970: TimeInterval(metadata.createdAt))
        return date.toStrWithFormat("yyyy MMM dd HH:mm:ss")
    }
    
    func getImage() -> UIImage? {
        if saveS3Data {
            return getImageLocal()
        } else {
            return getImageWeb()
        }
    }
    
    private func getImageWeb() -> UIImage? {
        if image.isEmpty {
            return nil
        }
        guard
            let imageURL = URL(string: image),
            let imageData = try? Data(contentsOf: imageURL)
        else {
            return nil
        }
        return UIImage(data: imageData) ?? nil
    }
    
    private func getImageLocal() -> UIImage? {
        return UIImage(named: image) ?? nil
    }
}
