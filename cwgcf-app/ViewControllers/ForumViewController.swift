//
//  ForumViewController.swift
//  cwgcf-app
//
//  Created by Guanhui Guan on 12/20/19.
//  Copyright © 2019 Guanhui Guan. All rights reserved.
//

import Foundation
import UIKit

class ForumViewController : UITableViewController {
    
    var cellId = "ForumCell"
    var forumAPIClient : ForumAPIClient = {
        let client = ForumAPIClient()
        client.GetPosts()
        return client
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = backgroundColor
        tableView.register(ForumCell.self, forCellReuseIdentifier: cellId)
        tableView.separatorStyle = .none
        navigationItem.title = "Forum"
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            // #warning Incomplete implementation, return the number of rows
            return forumPosts.count
        }

        override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! ForumCell
            cell.forumPost = forumPosts[indexPath.row]
            cell.setCell()
            return cell
        }
        
        override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            tableView.deselectRow(at: indexPath, animated: false)
//            let vc = ProfileViewController()
//            vc.profile = cacheProfiles[indexPath.row]
//            vc.modalPresentationStyle = .fullScreen
//            vc.hidesBottomBarWhenPushed = true
//            self.navigationController?.pushViewController(vc, animated: true)
        }
}
