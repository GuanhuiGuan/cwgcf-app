//
//  PhotoAPIClient.swift
//  cwgcf-app
//
//  Created by Guanhui Guan on 12/27/19.
//  Copyright © 2019 Guanhui Guan. All rights reserved.
//

import Foundation
import UIKit

var cachePhotos : [Photo] = []

class PhotoAPIClient {
    func GetAllPhotos(){
        let url = URL(string: mongoURL + "/album")!
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print("error: \(error)")
            } else {
                if let response = response as? HTTPURLResponse {
                    print("statusCode: \(response.statusCode)")
                }
                if let data = data {
                    cachePhotos = try! JSONDecoder().decode([Photo].self, from: data)
                }
            }
        }
        task.resume()
    }
}
