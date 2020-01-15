//
//  ProfileArray.swift
//  cwgcf-app
//
//  Created by Guanhui Guan on 1/12/20.
//  Copyright © 2020 Guanhui Guan. All rights reserved.
//

import Foundation
import UIKit

var profileArraySpacing : CGFloat = 5

class ProfileArray : UIView {
    var avatarRadius : CGFloat!
    var numToShow : Int!
    
    var navigationController = UINavigationController()
    
    var arrayView = UIView()
    
    var ellipsisView = UIImageView()
    
    var profiles : [Profile]! {
        didSet {
            // loadArrayData()
        }
    }
    
    convenience init(avatarRadius : CGFloat, numToShow : Int) {
        self.init(frame: .zero)
        self.avatarRadius = avatarRadius
        self.numToShow = numToShow
        setupArray()
        setupEllipsis()
        
//        let tap = UITapGestureRecognizer(target: superclass, action: #selector(handleTap(_:)))
//        addGestureRecognizer(tap)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        isUserInteractionEnabled = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupArray() {
        addSubview(arrayView)
        arrayView.translatesAutoresizingMaskIntoConstraints = false
        arrayView.backgroundColor = .none
        NSLayoutConstraint.activate([
            arrayView.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            arrayView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
            arrayView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
        ])
    }
    
    func loadArrayData() {
        var count = 0
        for profile in profiles {
            if count >= numToShow {
                break
            }
            addProfile(profile: profile, count: count, defaultSystemUrl: "person.fill")
            count += 1
        }
        if profiles.count > numToShow {
            ellipsisView.isHidden = false
        }
    }
    
    private func addProfile(imgUrl: String, count: Int, defaultSystemUrl: String) {
        let avatarView = AvatarView(radius: avatarRadius, imageUrl: imgUrl, defaultSystemUrl: defaultSystemUrl, defaultTint: darkRed)
        arrayView.addSubview(avatarView)
        setArrayElement(count: count, insertView: avatarView)
    }
    
    private func addProfile(profile: Profile, count: Int, defaultSystemUrl: String) {
        let avatarView = AvatarView(radius: avatarRadius, profile: profile, defaultSystemUrl: defaultSystemUrl, defaultTint: darkRed)
        arrayView.addSubview(avatarView)
        // avatarView.navigationController = navigationController
        setArrayElement(count: count, insertView: avatarView)
    }
    
    private func setupEllipsis() {
        addSubview(ellipsisView)
        ellipsisView.translatesAutoresizingMaskIntoConstraints = false
        ellipsisView.image = UIImage(systemName: "ellipsis")
        ellipsisView.tintColor = .lightGray
        ellipsisView.contentMode = .scaleAspectFit
        ellipsisView.layer.masksToBounds = true
        NSLayoutConstraint.activate([
            ellipsisView.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 0),
            ellipsisView.leadingAnchor.constraint(greaterThanOrEqualTo: arrayView.trailingAnchor, constant: -(10 + 2*eventProfileAvatarRadius*0.3)),
            ellipsisView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            ellipsisView.heightAnchor.constraint(equalToConstant: 2*eventProfileAvatarRadius*0.7),
            ellipsisView.widthAnchor.constraint(equalToConstant: 2*eventProfileAvatarRadius*0.7),
        ])
        ellipsisView.isHidden = true
    }
    
    private func setArrayElement(count: Int, insertView: UIView) {
        let offset : CGFloat = count == 0 ? 0 : CGFloat(count)*(profileArraySpacing + eventProfileAvatarRadius*2)
        NSLayoutConstraint.activate([
            insertView.topAnchor.constraint(equalTo: arrayView.topAnchor, constant: 0),
            insertView.bottomAnchor.constraint(equalTo: arrayView.bottomAnchor, constant: 0),
            insertView.leadingAnchor.constraint(equalTo: arrayView.leadingAnchor, constant: offset),
        ])
    }
    
    @objc
    private func handleTap(_ sender: Any) {
        print("Tapped")
        let vc = ProfileViewController()
        vc.profile = Profile("some", name: "Some one", title: "sfkejfaekl", avatarUrl: "queen", description: "eiwnvklj;i4oraf")
        self.navigationController.pushViewController(vc, animated: true)
    }
}
