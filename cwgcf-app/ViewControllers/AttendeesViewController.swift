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
    var profiles : [Profile]! = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = backgroundColor
        tableView.register(ProfileCell.self, forCellReuseIdentifier: cellId)
        tableView.separatorStyle = .none
        navigationItem.title = "Attendees"
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
        let vc = ProfileViewController()
        vc.profile = profiles[indexPath.row]
        vc.modalPresentationStyle = .fullScreen
//        vc.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func loadCells() {
        let client = ProfileAPIClient()
        client.GetAllProfiles() { result in
            switch result {
            case .success(let ps):
                self.profiles = ps
            case .failure(let error):
                print("Error retrieving profiles: \(error)")
                self.profiles = []
            }
        }
    }
}
