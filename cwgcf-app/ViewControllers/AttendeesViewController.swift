//
//  AttendeesViewController.swift
//  cwgcf-app
//
//  Created by Guanhui Guan on 12/25/19.
//  Copyright © 2019 Guanhui Guan. All rights reserved.
//

import UIKit

class AttendeesViewController : UITableViewController {
    
    var cellId = "ProfileCell"
    var profiles: [Profile] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray5
        tableView.register(ProfileCell.self, forCellReuseIdentifier: cellId)
        tableView.separatorStyle = .none
        navigationItem.title = "Attendees"
        
        loadCells()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return profiles.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! ProfileCell
        cell.profile = profiles[indexPath.row]
        cell.setCell()
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
//        let chatVC = ChatLogViewController()
//        chatVC.roomMeta = rooms[indexPath.row]
//        chatVC.modalPresentationStyle = .fullScreen
//        chatVC.hidesBottomBarWhenPushed = true
//
//        self.navigationController?.pushViewController(chatVC, animated: true)
    }
    
    private func loadCells() {
        profiles = [
            enUserDB["000"]!,
            enUserDB["001"]!,
            enUserDB["002"]!,
            enUserDB["003"]!,
            enUserDB["004"]!,
            enUserDB["005"]!,
            enUserDB["006"]!,
            enUserDB["007"]!,
        ]
    }
}
