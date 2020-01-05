//
//  ForumCell.swift
//  cwgcf-app
//
//  Created by Guanhui Guan on 1/2/20.
//  Copyright © 2020 Guanhui Guan. All rights reserved.
//

import Foundation
import UIKit

class ForumCell : UITableViewCell {
    lazy var forumPost: ForumPost = {
        let p = ForumPost()
        return p
    }()
    
    lazy var imgView : UIImageView = {
        let v = UIImageView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.layer.cornerRadius = 10
        v.layer.masksToBounds = true
        v.contentMode = .scaleAspectFill
        return v
    }()
    
    lazy var titleView : UILabel = {
        let v = UILabel()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.font = UIFont.boldSystemFont(ofSize: 24)
        v.textColor = .darkGray
        v.numberOfLines = 1
        v.textAlignment = .left
        return v
    }()
    
    lazy var subTitleView : UILabel = {
        let v = UILabel()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.font = UIFont.systemFont(ofSize: 14)
        v.textColor = .lightGray
        v.numberOfLines = 1
        v.textAlignment = .left
        return v
    }()
    
    lazy var userView : UIView = {
        return setUserView()
    }()
    lazy var avatar = UIImageView()
    lazy var username = UILabel()
    lazy var timestamp = UILabel()
    
    lazy var votesView : UIView = {
        return setVotesView()
    }()
    lazy var voteCount = UILabel()
    
    lazy var bottomBorder : UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = .lightGray
        return v
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(userView)
        addSubview(votesView)
        addSubview(titleView)
        addSubview(subTitleView)
        addSubview(imgView)
        addSubview(bottomBorder)
        
        let constraints : [NSLayoutConstraint] = [
            userView.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            userView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            userView.trailingAnchor.constraint(lessThanOrEqualTo: votesView.leadingAnchor, constant: 10),
            
            votesView.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            votesView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            
            titleView.topAnchor.constraint(equalTo: userView.bottomAnchor, constant: 10),
            titleView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            titleView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            
            subTitleView.topAnchor.constraint(equalTo: titleView.bottomAnchor, constant: 10),
            subTitleView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            subTitleView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            
            imgView.topAnchor.constraint(equalTo: subTitleView.bottomAnchor, constant: 20),
            imgView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            imgView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            imgView.heightAnchor.constraint(equalToConstant: 200),
            
            bottomBorder.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
            bottomBorder.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            bottomBorder.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            bottomBorder.heightAnchor.constraint(equalToConstant: 0.5),
            bottomBorder.topAnchor.constraint(equalTo: imgView.bottomAnchor, constant: 20),
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setCell() {
        let image = forumPost.getImage()
        if image != nil {
            imgView.image = image
        } else {
            imgView.heightAnchor.constraint(equalToConstant: 0).isActive = true
            imgView.topAnchor.constraint(equalTo: subTitleView.bottomAnchor, constant: 0).isActive = true
        }
        titleView.text = forumPost.getTitle()
        subTitleView.text = forumPost.getSubTitle()
        
        let img = forumPost.getImage()
        if img == nil {
            avatar.image = UIImage(systemName: "person.fill")
            avatar.tintColor = darkRed
        } else {
            avatar.image = img
        }
        username.text = forumPost.userProfile.name
        timestamp.text = forumPost.getTime()
        
        voteCount.text = forumPost.forumVotes.getRankStr()
    }
    
    private func setUserView() -> UIView {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        
        v.addSubview(avatar)
        avatar.translatesAutoresizingMaskIntoConstraints = false
        avatar.layer.cornerRadius = forumAvatarRadius
        avatar.layer.masksToBounds = true
        avatar.contentMode = .scaleAspectFill
        
        v.addSubview(username)
        username.translatesAutoresizingMaskIntoConstraints = false
        username.font = UIFont.boldSystemFont(ofSize: 12)
        username.textColor = .darkGray
        username.numberOfLines = 1
        username.textAlignment = .left
        
        v.addSubview(timestamp)
        timestamp.translatesAutoresizingMaskIntoConstraints = false
        timestamp.font = UIFont.boldSystemFont(ofSize: 10)
        timestamp.textColor = .lightGray
        timestamp.numberOfLines = 1
        timestamp.textAlignment = .left
        
        NSLayoutConstraint.activate([
            avatar.topAnchor.constraint(equalTo: v.topAnchor, constant: 10),
            avatar.leadingAnchor.constraint(equalTo: v.leadingAnchor, constant: 12),
            avatar.heightAnchor.constraint(equalToConstant: 2*forumAvatarRadius),
            avatar.widthAnchor.constraint(equalToConstant: 2*forumAvatarRadius),
            
            username.topAnchor.constraint(equalTo: v.topAnchor, constant: 10),
            username.leadingAnchor.constraint(equalTo: avatar.trailingAnchor, constant: 5),
            username.trailingAnchor.constraint(equalTo: v.trailingAnchor, constant: -30),
            
            timestamp.bottomAnchor.constraint(equalTo: v.bottomAnchor, constant: 0),
            timestamp.leadingAnchor.constraint(equalTo: avatar.trailingAnchor, constant: 5),
            timestamp.trailingAnchor.constraint(equalTo: v.trailingAnchor, constant: -30),
            
            v.bottomAnchor.constraint(equalTo: avatar.bottomAnchor, constant: 0),
        ])
        
        return v
    }
    
    private func setVotesView() -> UIView {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        
        let thumbsUp = UIButton()
        v.addSubview(thumbsUp)
        thumbsUp.translatesAutoresizingMaskIntoConstraints = false
        thumbsUp.layer.masksToBounds = true
        thumbsUp.contentMode = .scaleAspectFill
        thumbsUp.tintColor = .lightGray
        thumbsUp.setImage(UIImage(systemName: "hand.thumbsup.fill"), for: .normal)
        
        let thumbsDown = UIButton()
        v.addSubview(thumbsDown)
        thumbsDown.translatesAutoresizingMaskIntoConstraints = false
        thumbsDown.layer.masksToBounds = true
        thumbsDown.contentMode = .scaleAspectFill
        thumbsDown.tintColor = .lightGray
        thumbsDown.setImage(UIImage(systemName: "hand.thumbsdown.fill"), for: .normal)
        
        v.addSubview(voteCount)
        voteCount.translatesAutoresizingMaskIntoConstraints = false
        voteCount.font = UIFont.systemFont(ofSize: 10)
        voteCount.textColor = .darkGray
        voteCount.numberOfLines = 1
        voteCount.textAlignment = .center
        
        NSLayoutConstraint.activate([
            thumbsUp.topAnchor.constraint(equalTo: v.topAnchor, constant: 10),
            thumbsUp.leadingAnchor.constraint(equalTo: v.leadingAnchor, constant: 2),
            thumbsUp.heightAnchor.constraint(equalToConstant: 14),
            thumbsUp.widthAnchor.constraint(equalToConstant: 14),
            
            thumbsDown.topAnchor.constraint(equalTo: v.topAnchor, constant: 10),
            thumbsDown.trailingAnchor.constraint(equalTo: v.trailingAnchor, constant: -2),
            thumbsDown.heightAnchor.constraint(equalToConstant: 14),
            thumbsDown.widthAnchor.constraint(equalToConstant: 14),
            
            voteCount.topAnchor.constraint(equalTo: v.topAnchor, constant: 10),
            voteCount.leadingAnchor.constraint(equalTo: thumbsUp.trailingAnchor, constant: 2),
            voteCount.trailingAnchor.constraint(equalTo: thumbsDown.leadingAnchor, constant: -2),
            voteCount.widthAnchor.constraint(equalToConstant: 50),
            
            v.bottomAnchor.constraint(equalTo: thumbsUp.bottomAnchor, constant: 10),
        ])
        
        return v
    }
}
