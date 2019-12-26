//
//  Profile.swift
//  cwgcf-app
//
//  Created by Guanhui Guan on 12/25/19.
//  Copyright © 2019 Guanhui Guan. All rights reserved.
//

import Foundation
import UIKit

class Profile {
    var ID : String = ""
    var Name : String = ""
    var Title : String = ""
    var AvatarUrl : String = ""
    var Description : String = ""
    
    init() {
        
    }
    
    init(_ id:String, name:String, title:String, avatarUrl:String, description:String) {
        ID = id
        Name = name.isEmpty ? "Anonymous" : name
        Title = title.isEmpty ? "Attendee" : title
        AvatarUrl = avatarUrl
        Description = description.isEmpty ? "No description" : description
    }
    
    func SetImageWithDefault(_ imgView: UIImageView) {
        let img = UIImage(named: AvatarUrl)
        if img == nil {
            imgView.image = UIImage(systemName: "person.crop.circle")
            imgView.tintColor = darkRed
        }
        else {
            imgView.image = img
        }
    }
}
