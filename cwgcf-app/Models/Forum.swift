//
//  Forum.swift
//  cwgcf-app
//
//  Created by Guanhui Guan on 1/2/20.
//  Copyright © 2020 Guanhui Guan. All rights reserved.
//

import Foundation
import UIKit

class ForumVotes : Codable {
    let trillion : Double = pow(10, 12)
    let billion : Double = pow(10, 9)
    let million : Double = pow(10, 6)
    let thousand : Double = pow(10, 3)
    
    var upvotes : Int64 = 0
    var downvotes : Int64 = 0
    var votesSum : Int64 = 0
    
    func getRankStr() -> String {
        var abs = Double(votesSum)
        var res : Int64 = 0
        var sign : Double = 1
        var suffix = ""
        if abs < 0 {
            // Could cause overflow
            abs = -abs
            sign = -1
        }
        
        if abs >= trillion {
            res = Int64(sign * (Double(abs) / trillion))
            suffix = "T"
        } else if abs >= billion {
            res = Int64(sign * (abs / billion))
            suffix = "B"
        } else if abs >= million {
            res = Int64(sign * (abs / million))
            suffix = "M"
        } else if abs >= thousand {
            res = Int64(sign * (abs / thousand))
            suffix = "k"
        } else {
            return "\(Int(sign * abs))"
        }
        // print("Outer result: \(res)")
        return "\(res)\(suffix)"
    }
    
    func localUpvote() -> String {
        votesSum += 1
        return getRankStr()
    }
    
    func localDownvote() -> String {
        votesSum -= 1
        return getRankStr()
    }
}

class ForumComment : Codable {
    var _id : String = ""
    var userId : String = ""
    var userProfile : Profile = Profile()
    var content : String = ""
    var createdAt : Int64 = 0
    var updatedAt : Int64 = 0
    var forumVotes : ForumVotes = ForumVotes()
}

class ForumPost : Codable {
    var _id : String = ""
    var userId : String = ""
    var userProfile : Profile = Profile()
    var title : String = ""
    var content : String = ""
    var image : String = ""
    var createdAt : Int64 = 0
    var updatedAt : Int64 = 0
    var forumVotes : ForumVotes = ForumVotes()
    
    init() {
        
    }
    
    init(_ _id : String, _userId : String, _title : String, _content : String, _image : String, _timestamp : Int64) {
        self._id = _id
        userId = _userId
        title = _title
        content = _content
        image = _image
        createdAt = _timestamp
        updatedAt = _timestamp
    }
    
    func getTitle() -> String {
        if title.isEmpty {
            return "No title"
        }
        return title
    }
    
    func getSubTitle() -> String {
        if content.isEmpty {
            return "No title"
        }
        return content
    }
    
    func getTime() -> String {
        let date = Date(timeIntervalSince1970: TimeInterval(createdAt))
        return date.toStrWithFormat("yyyy MMM dd HH:mm:ss")
    }
    
    func getImage() -> UIImage? {
        if saveS3Data {
            return getImageLocal()
        } else {
            return getImageWeb()
        }
    }
    
    private func getImageWeb() -> UIImage? {
        if image.isEmpty {
            return nil
        }
        guard
            let imageURL = URL(string: image),
            let imageData = try? Data(contentsOf: imageURL)
        else {
            return nil
        }
        return UIImage(data: imageData) ?? nil
    }
    
    private func getImageLocal() -> UIImage? {
        return UIImage(named: image) ?? nil
    }
}

class ForumVoteRequest : Codable {
    var voteId : String = ""
    var userId : String = ""
    var isPost : Bool = false
    var isUpvote : Bool = true
    var updatedAt : Int64 = 0
    
    init(_userId: String, _voteId: String, _isPost: Bool, _isUpvote: Bool) {
        userId = _userId
        voteId = _voteId
        isPost = _isPost
        isUpvote = _isUpvote
    }
}

class ForumVoteMap : Codable {
    var userId : String = ""
    var voteMap : [String:ForumVoteWithTime] = [:]
}

class ForumVoteWithTime : Codable {
    var voteStatus : Int = 0
    var updatedAt : Int64 = 0
}
