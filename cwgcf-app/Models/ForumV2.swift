//
//  ForumV2.swift
//  cwgcf-app
//
//  Created by Guanhui Guan on 1/8/20.
//  Copyright © 2020 Guanhui Guan. All rights reserved.
//

import Foundation
import UIKit

class GetForumPostsResponse : Codable {
    var ForumPosts : [ForumPostV2] = []
    var ForumVotesMap : [String : ForumVotesV2] = [:]
}

class ForumPostV2 : Codable {
    var _id : String = ""
    var userProfile : Profile = Profile()
    var title : String = ""
    var content : String = ""
    var image : String = ""
    var metadata : Metadata = Metadata()
    var voteId : String = ""
    
    init() {}
    
    init(_ id : String, profile : Profile, title : String, content : String, img : String, createdAt : Int64, voteId : String) {
        self._id = id
        userProfile = profile
        self.title = title
        self.content = content
        image = img
        metadata.createdAt = createdAt
        self.voteId = voteId
    }
}

class ForumVotesV2 : Codable {
    var _id : String = ""
    var count : Int64 = 0
    // voteStatus: -1, 0, 1 -> downvote, unvote, upvote
    var voteStatus : Int = 0
    var metadata : Metadata = Metadata()
    
    init() {}
    
    init(_ id:String, count:Int64, status:Int, ts:Int64) {
        _id = id
        self.count = count
        voteStatus = status
        metadata.createdAt = ts
        metadata.updatedAt = ts
    }
}
