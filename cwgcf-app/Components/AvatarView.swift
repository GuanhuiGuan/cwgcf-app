//
//  AvatarView.swift
//  cwgcf-app
//
//  Created by Guanhui Guan on 1/12/20.
//  Copyright © 2020 Guanhui Guan. All rights reserved.
//

import Foundation
import UIKit

class AvatarView : UIView {
    var radius : CGFloat!
    var tapGesture : UITapGestureRecognizer!
    var imageView = UIImageView()
    var profile : Profile = Profile()
    var navigationController : UINavigationController = UINavigationController()
    var hiddenButton = UIButton()
    
    convenience init(radius: CGFloat) {
        self.init(frame: .zero)
        self.radius = radius
        setupImage()
    }
    
    convenience init(radius: CGFloat, image: UIImage) {
        self.init(frame: .zero)
        self.radius = radius
        self.imageView.image = image
        setupImage()
    }
    
    convenience init(radius: CGFloat, imageUrl: String, defaultSystemUrl: String, defaultTint: UIColor) {
        self.init(frame: .zero)
        self.radius = radius
        self.imageView.loadLocal(imageUrl, defaultImg: UIImage(systemName: defaultSystemUrl)!, defaultTint: defaultTint)
        setupImage()
    }
    
    convenience init(radius: CGFloat, profile: Profile, defaultSystemUrl: String, defaultTint: UIColor) {
        self.init(frame: .init(x: 0, y: 0, width: radius*2, height: radius*2))
        self.profile = profile
        self.radius = radius
        self.imageView.loadLocal(profile.avatarUrl, defaultImg: UIImage(systemName: defaultSystemUrl)!, defaultTint: defaultTint)
        setupImage()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        isUserInteractionEnabled = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupImage() {
        addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = eventProfileAvatarRadius
        imageView.layer.masksToBounds = true
        NSLayoutConstraint.activate([
            heightAnchor.constraint(equalToConstant: 2*radius),
            widthAnchor.constraint(equalToConstant: 2*radius),
            
            imageView.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
        ])
    }
}
