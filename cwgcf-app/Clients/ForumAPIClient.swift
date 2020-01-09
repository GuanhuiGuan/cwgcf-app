//
//  ForumAPIClient.swift
//  cwgcf-app
//
//  Created by Guanhui Guan on 1/2/20.
//  Copyright © 2020 Guanhui Guan. All rights reserved.
//

import Foundation
import UIKit

class ForumAPIClient {
    func GetPosts(completionHandler: @escaping (Result<GetForumPostsResponse, Error>) -> Void){
        let url = URL(string: mongoURL + "/forum/v2/post")!
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                completionHandler(.failure(error))
            } else {
                if let response = response as? HTTPURLResponse {
                    print("statusCode: \(response.statusCode)")
                }
                if let data = data {
                    let res = try? JSONDecoder().decode(GetForumPostsResponse.self, from: data)
                    completionHandler(.success(res ?? GetForumPostsResponse()))
                }
            }
        }
        task.resume()
    }
    
    func GetPost(_ id: String, completionHandler: @escaping (Result<ForumPost, Error>) -> Void){
        let url = URL(string: mongoURL + "/forum/post/\(id)")!
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                completionHandler(.failure(error))
            } else {
                if let response = response as? HTTPURLResponse {
                    print("statusCode: \(response.statusCode)")
                }
                if let data = data {
                    let post = try? JSONDecoder().decode(ForumPost.self, from: data)
                    completionHandler(.success(post ?? ForumPost()))
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
    
    func Vote(userID: String, voteID: String, isPost: Bool, isUpvote: Bool) -> Int {
        let req = ForumVoteRequest(_userId: userID, _voteId: voteID, _isPost: isPost, _isUpvote: isUpvote)
        let encoder = JSONEncoder()
        var currentStatus = 0
        do {
            let data = try encoder.encode(req)
            VoteInternal(data) { result in
                switch result {
                case .success(let val):
                    currentStatus = val
                case .failure(let error):
                    print("Error retrieving vote status: \(error)")
                }
            }
        } catch {
            print("Error encoding request: \(error)")
        }
        return currentStatus
    }
    
    private func VoteInternal(_ requestBody: Data, completionHandler: @escaping (Result<Int, Error>) -> Void) {
        let url = URL(string: mongoURL + "/forum/vote")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = requestBody
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                completionHandler(.failure(error))
            } else {
                if let response = response as? HTTPURLResponse {
                    print("statusCode: \(response.statusCode)")
                }
                if let data = data {
                    let stringInt = String.init(data: data, encoding: String.Encoding.utf8)
                    let int = Int.init(stringInt ?? "")
                    completionHandler(.success(int ?? 0))
                }
            }
        }
        task.resume()
    }
    
    func GetVoteMap(_ id: String, completionHandler: @escaping (Result<ForumVoteMap, Error>) -> Void) {
        let url = URL(string: mongoURL + "/forum/vote/\(id)")!
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                completionHandler(.failure(error))
            } else {
                if let response = response as? HTTPURLResponse {
                    print("statusCode: \(response.statusCode)")
                }
                if let data = data {
                    let voteMap = try? JSONDecoder().decode(ForumVoteMap.self, from: data)
                    completionHandler(.success(voteMap ?? ForumVoteMap()))
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
