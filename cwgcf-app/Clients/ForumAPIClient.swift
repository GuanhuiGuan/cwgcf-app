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
    func GetPosts(completionHandler: @escaping (Result<[ForumPost], Error>) -> Void){
        let url = URL(string: mongoURL + "/forum/post")!
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                completionHandler(.failure(error))
            } else {
                if let response = response as? HTTPURLResponse {
                    print("statusCode: \(response.statusCode)")
                }
                if let data = data {
                    let posts = try? JSONDecoder().decode([ForumPost].self, from: data)
                    completionHandler(.success(posts ?? []))
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
    
    func Vote(userID: String, voteID: String, isPost: Bool, offset: Int) {
        let req = ForumVoteRequest(_userId: userID, _voteId: voteID, _isPost: isPost, _offset: offset)
        let encoder = JSONEncoder()
        do {
            let data = try encoder.encode(req)
            VoteInternal(data)
        } catch {
            print("Error encoding request: \(error)")
        }
    }
    
    private func VoteInternal(_ requestBody: Data) {
        let url = URL(string: mongoURL + "/forum/vote")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = requestBody
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                print("error: \(error)")
            } else {
                if let response = response as? HTTPURLResponse {
                    print("statusCode: \(response.statusCode)")
                }
                if let data = data {
                    print(data)
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
