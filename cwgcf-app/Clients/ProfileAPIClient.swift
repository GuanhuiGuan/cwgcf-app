//
//  ProfileAPIClient.swift
//  cwgcf-app
//
//  Created by Guanhui Guan on 12/25/19.
//  Copyright © 2019 Guanhui Guan. All rights reserved.
//

import Foundation

class ProfileAPIClient {
    
    func GetAllProfiles(completionHandler: @escaping (Result<[Profile], Error>) -> Void){
        let url = URL(string: mongoURL + "/profile")!
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                completionHandler(.failure(error))
            } else {
                if let response = response as? HTTPURLResponse {
                    print("statusCode: \(response.statusCode)")
                }
                if let data = data {
                    let res = try? JSONDecoder().decode([Profile].self, from: data)
                    completionHandler(.success(res ?? []))
                    // cacheProfiles = try! JSONDecoder().decode([Profile].self, from: data)
                }
            }
        }
        task.resume()
    }
    
    // not implemented
    func GetProfile(_ userID:String) {
        let url = URL(string: mongoURL + "/profile/" + userID)!
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print("error: \(error)")
            } else {
                if let response = response as? HTTPURLResponse {
                    print("statusCode: \(response.statusCode)")
                }
                if let data = data, let dataString = String(data: data, encoding: .utf8) {
                    print("data: \(dataString)")
                }
            }
        }
        task.resume()
    }
    
    // Prototype only
    func Post() {
        let url = URL(string: "https://httpbin.org/post")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                print("error: \(error)")
            } else {
                if let response = response as? HTTPURLResponse {
                    print("statusCode: \(response.statusCode)")
                }
                if let data = data, let dataString = String(data: data, encoding: .utf8) {
                    print("data: \(dataString)")
                }
            }
        }
        task.resume()
    }
}
