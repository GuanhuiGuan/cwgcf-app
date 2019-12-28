//
//  PhotosViewController.swift
//  cwgcf-app
//
//  Created by Guanhui Guan on 12/26/19.
//  Copyright © 2019 Guanhui Guan. All rights reserved.
//

import Foundation
import UIKit

class PhotosViewController : UITableViewController {
    
    var cellId = "PhotoCell"
    // var imgUrls: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = backgroundColor
        tableView.register(PhotoCell.self, forCellReuseIdentifier: cellId)
        tableView.separatorStyle = .none
        navigationItem.title = "Album"
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return cachePhotos.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! PhotoCell
        cell.imgUrl = cachePhotos[indexPath.row].url
        cell.setCell()
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
//        let vc = ProfileViewController()
//        vc.profile = cachePhotos[indexPath.row]
//        vc.modalPresentationStyle = .fullScreen
////        vc.hidesBottomBarWhenPushed = true
//        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func loadPhotos() {
        let api = PhotoAPIClient()
        api.GetAllPhotos()
    }
}
