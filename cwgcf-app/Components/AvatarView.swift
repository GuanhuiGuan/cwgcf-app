//
//  AvatarView.swift
//  cwgcf-app
//
//  Created by Guanhui Guan on 1/12/20.
//  Copyright © 2020 Guanhui Guan. All rights reserved.
//

import Foundation
import UIKit

class AvatarView : UIImageView {
    var radius : CGFloat!
    
    convenience init(radius: CGFloat) {
        self.init(frame: .zero)
        self.radius = radius
        setupImage()
    }
    
    convenience init(radius: CGFloat, image: UIImage) {
        self.init(frame: .zero)
        self.radius = radius
        self.image = image
        setupImage()
    }
    
    convenience init(radius: CGFloat, imageUrl: String, defaultSystemUrl: String, defaultTint: UIColor) {
        self.init(frame: .zero)
        self.radius = radius
        loadLocal(imageUrl, defaultImg: UIImage(systemName: defaultSystemUrl)!, defaultTint: defaultTint)
        setupImage()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupImage() {
        contentMode = .scaleAspectFill
        layer.cornerRadius = eventProfileAvatarRadius
        layer.masksToBounds = true
        NSLayoutConstraint.activate([
            heightAnchor.constraint(equalToConstant: 2*radius),
            widthAnchor.constraint(equalToConstant: 2*radius),
        ])
    }
}
