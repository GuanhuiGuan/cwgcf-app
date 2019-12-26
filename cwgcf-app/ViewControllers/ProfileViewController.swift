//
//  ProfileViewController.swift
//  cwgcf-app
//
//  Created by Guanhui Guan on 12/25/19.
//  Copyright © 2019 Guanhui Guan. All rights reserved.
//

import Foundation
import UIKit

class ProfileViewController : VCWithScroll {
    var profile : Profile!
    
    lazy var avatarView : UIImageView = {
        let v = UIImageView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.layer.cornerRadius = profileAvatarLargeRadius
        v.layer.masksToBounds = true
        v.contentMode = .scaleAspectFill
        return v
    }()
    
    lazy var nameView : UILabel = {
        let v = UILabel()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.font = UIFont.boldSystemFont(ofSize: 30)
        v.textColor = .darkGray
        v.numberOfLines = 0
        v.textAlignment = .center
        return v
    }()
    
    lazy var titleView : UILabel = {
        let v = UILabel()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.font = UIFont.systemFont(ofSize: 20)
        v.textColor = .lightGray
        v.numberOfLines = 0
        v.textAlignment = .center
        return v
    }()
    
    lazy var descriptionView : UILabel = {
        let v = UILabel()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.font = UIFont.systemFont(ofSize: 20)
        v.textColor = .darkGray
        v.numberOfLines = 0
        v.textAlignment = .left
        return v
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBGAndScroll(enMap["profile_vc_title"] ?? "Profile")
        view.backgroundColor = ghostWhite
        
        setConstraints()
    }
    
    private func setConstraints() {
        profile.SetImageWithDefault(avatarView)
        nameView.text = profile.Name
        titleView.text = profile.Title
        descriptionView.text = profile.Description
        
        containerView.addSubview(avatarView)
        containerView.addSubview(nameView)
        containerView.addSubview(titleView)
        containerView.addSubview(descriptionView)
        
        NSLayoutConstraint.activate([
            
            avatarView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor, constant: 0),
            avatarView.centerYAnchor.constraint(equalTo: containerView.topAnchor, constant: (navigationController?.navigationBar.frame.height)! + 30),
            avatarView.heightAnchor.constraint(equalToConstant: 2 * profileAvatarLargeRadius),
            avatarView.widthAnchor.constraint(equalToConstant: 2 * profileAvatarLargeRadius),
            
            nameView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor, constant: 0),
            nameView.topAnchor.constraint(equalTo: avatarView.bottomAnchor, constant: 30),
            nameView.widthAnchor.constraint(equalToConstant: 350),
            
            titleView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor, constant: 0),
            titleView.topAnchor.constraint(equalTo: nameView.bottomAnchor, constant: 15),
            titleView.widthAnchor.constraint(equalToConstant: 350),
            
            descriptionView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor, constant: 0),
            descriptionView.topAnchor.constraint(equalTo: titleView.bottomAnchor, constant: 20),
            descriptionView.widthAnchor.constraint(equalToConstant: 350),
        ])
        
        updateContentSize(30 + 30 + 15 + 20)
        updateContentSize(avatarView)
        updateContentSize(nameView)
        updateContentSize(titleView)
        updateContentSize(descriptionView)
    }
}
