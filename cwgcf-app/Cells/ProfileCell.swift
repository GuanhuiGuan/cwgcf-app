//
//  ProfileCell.swift
//  cwgcf-app
//
//  Created by Guanhui Guan on 12/25/19.
//  Copyright © 2019 Guanhui Guan. All rights reserved.
//

import UIKit

class ProfileCell: UITableViewCell {
    
    lazy var content: CellContent = {
        let cc = CellContent()
        return cc
    }()
    
    lazy var avatarView : UIImageView = {
        let v = UIImageView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.layer.cornerRadius = profileAvatarRadius
        v.layer.masksToBounds = true
        v.contentMode = .scaleAspectFill
        return v
    }()
    
    lazy var nameView : UILabel = {
        let v = UILabel()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.font = UIFont.boldSystemFont(ofSize: 24)
        v.textColor = .darkGray
        v.numberOfLines = 0
        v.textAlignment = .center
        return v
    }()
    
    lazy var titleView : UILabel = {
        let v = UILabel()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.font = UIFont.systemFont(ofSize: 16)
        v.textColor = .lightGray
        v.numberOfLines = 0
        v.textAlignment = .center
        return v
    }()
    
    lazy var bottomBorder : UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = .systemGray5
        return v
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(avatarView)
        addSubview(nameView)
        addSubview(titleView)
        addSubview(bottomBorder)
        
        NSLayoutConstraint.activate([
            avatarView.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 0),
            avatarView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            avatarView.heightAnchor.constraint(equalToConstant: 2 * profileAvatarRadius),
            avatarView.widthAnchor.constraint(equalToConstant: 2 * profileAvatarRadius),
            
            nameView.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            nameView.leadingAnchor.constraint(equalTo: avatarView.trailingAnchor, constant: 30),
            nameView.widthAnchor.constraint(equalToConstant: 300),
            
            titleView.topAnchor.constraint(equalTo: nameView.bottomAnchor, constant: 10),
            titleView.centerXAnchor.constraint(equalTo: nameView.centerXAnchor, constant: 0),
            titleView.widthAnchor.constraint(equalToConstant: 300),
            titleView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20),
            
            bottomBorder.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
            bottomBorder.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            bottomBorder.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            bottomBorder.heightAnchor.constraint(equalToConstant: 0.5),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setCell() {
        if content.avatarImage == nil {
            avatarView.image = UIImage(systemName: "person.crop.circle")
            avatarView.tintColor = darkRed
        }
        else {
            avatarView.image = content.avatarImage
        }
        nameView.text = content.nameStr.isEmpty ? "Anonymous": content.nameStr
        titleView.text = content.titleStr.isEmpty ? "Attendee": content.titleStr
    }
}
