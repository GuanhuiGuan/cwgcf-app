//
//  Profile.swift
//  cwgcf-app
//
//  Created by Guanhui Guan on 12/25/19.
//  Copyright © 2019 Guanhui Guan. All rights reserved.
//

import Foundation
import UIKit

class Profile : Codable {
    var _id : String = ""
    var name : String = ""
    var title : String = ""
    var avatarUrl : String = ""
    var description : String = ""
    
    init() {
        
    }
    
    init(_ id:String, name:String, title:String, avatarUrl:String, description:String) {
        _id = id
        self.name = name.isEmpty ? "Anonymous" : name
        self.title = title.isEmpty ? "Attendee" : title
        self.avatarUrl = avatarUrl
        self.description = description.isEmpty ? "No description" : description
    }
    
    func SetImageWithDefault(_ imgView: UIImageView) {
        // imgView.load(urlStr: avatarUrl)
        imgView.loadLocal(avatarUrl)
    }
    
    func getName() -> String {
        if name.isEmpty {
            return "Anonymous"
        }
        return name
    }
    
    func getTitle() -> String {
        if title.isEmpty {
            return "Attendee"
        }
        return title
    }
    
    func getDescription() -> String {
        if description.isEmpty {
            return "No description"
        }
        return description
    }
}
