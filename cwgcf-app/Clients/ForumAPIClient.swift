//
//  ForumAPIClient.swift
//  cwgcf-app
//
//  Created by Guanhui Guan on 1/2/20.
//  Copyright © 2020 Guanhui Guan. All rights reserved.
//

import Foundation
import UIKit

var forumPosts : [ForumPost] = []
var forumComments : [String:[ForumComment]] = [:]

class ForumAPIClient {
    func GetPosts(){
        let url = URL(string: mongoURL + "/forum/post")!
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print("error: \(error)")
            } else {
                if let response = response as? HTTPURLResponse {
                    print("statusCode: \(response.statusCode)")
                }
                if let data = data {
                    forumPosts = try! JSONDecoder().decode([ForumPost].self, from: data)
                }
            }
        }
        task.resume()
    }
    
    func GetComments(_ postId : String){
        let url = URL(string: mongoURL + "/forum/commentsofpost/\(postId)")!
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print("error: \(error)")
            } else {
                if let response = response as? HTTPURLResponse {
                    print("statusCode: \(response.statusCode)")
                }
                if let data = data {
                    let comments = try! JSONDecoder().decode([ForumComment].self, from: data)
                    forumComments[postId] = comments
                }
            }
        }
        task.resume()
    }
    
    // Not implemented
    func PushPost() {
        
    }
    
    // Not implemented
    func PushComment() {
        
    }
}
