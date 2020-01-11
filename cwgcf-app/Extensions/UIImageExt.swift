//
//  UIImageExt.swift
//  cwgcf-app
//
//  Created by Guanhui Guan on 12/26/19.
//  Copyright © 2019 Guanhui Guan. All rights reserved.
//

import Foundation
import UIKit

extension UIImageView {
    func load(_ urlStr: String, defaultImg: UIImage, defaultTint: UIColor) {
        guard let imageURL = URL(string: urlStr) else {
            loadImageWithTint(img: defaultImg, tint: defaultTint)
            return
        }

        DispatchQueue.global().async {
            guard let imageData = try? Data(contentsOf: imageURL) else {
                self.loadImageWithTint(img: defaultImg, tint: defaultTint)
                return
            }

            let image = UIImage(data: imageData)
            DispatchQueue.main.async {
                self.image = image
            }
        }
    }
    
    func loadImageWithTint(img: UIImage, tint: UIColor) {
        self.image = img
        self.tintColor = tint
    }
    
    func loadLocal(_ urlStr: String, defaultImg: UIImage, defaultTint: UIColor) {
        let img = UIImage(named: urlStr)
        if img == nil {
            self.image = defaultImg
            self.tintColor = defaultTint
        }
        else {
            self.image = img
        }
    }
}

extension UIImageView {
    func setImageColor(color: UIColor) {
        let templateImage = self.image?.withRenderingMode(.alwaysTemplate)
        self.image = templateImage
        self.tintColor = color
    }
}
