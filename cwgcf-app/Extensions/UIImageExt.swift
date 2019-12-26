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
    func load(urlStr: String) {
        let url = URL(fileURLWithPath: urlStr)
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
                else {
                    self?.image = UIImage(systemName: "person.crop.circle")
                    self?.tintColor = darkRed
                }
            }
            else {
                self?.image = UIImage(systemName: "person.crop.circle")
                self?.tintColor = darkRed
            }
        }
    }
    
    func loadLocal(_ urlStr: String) {
        let img = UIImage(named: urlStr)
        if img == nil {
            self.image = UIImage(systemName: "person.crop.circle")
            self.tintColor = darkRed
        }
        else {
            self.image = img
        }
    }
}
