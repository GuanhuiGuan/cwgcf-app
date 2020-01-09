//
//  ForumViewController.swift
//  cwgcf-app
//
//  Created by Guanhui Guan on 12/20/19.
//  Copyright © 2019 Guanhui Guan. All rights reserved.
//

import Foundation
import UIKit

var userVoteMap : ForumVoteMap = ForumVoteMap()
var forumPosts : [ForumPost] = []
var forumComments : [String:[ForumComment]] = [:]

var fetchedForumVotes : [String:ForumVotesV2] = [:]
var cachedForumVotes : [String:ForumVotesV2] = [:]

class ForumViewController : UITableViewController {
    
    var cellId = "ForumCell"
    var forumAPIClient : ForumAPIClient = {
        let client = ForumAPIClient()
        return client
    }()
    
    var refreshCtrl : UIRefreshControl = UIRefreshControl()
    
    var forumPostsV2 : [ForumPostV2] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = backgroundColor
        tableView.register(ForumCell.self, forCellReuseIdentifier: cellId)
        tableView.separatorStyle = .none
        navigationItem.title = "Forum"
        tableView.refreshControl = refreshCtrl
        refreshCtrl.addTarget(self, action: #selector(refreshTable(_:)), for: .valueChanged)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return forumPostsV2.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! ForumCell
        cell.forumPostV2 = forumPostsV2[indexPath.row]
        cell.setCell()
        cell.layoutIfNeeded()
        cell.layoutSubviews()
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
    
    @objc
    private func refreshTable(_ sender : Any) {
        loadData()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.7) {
            self.refreshCtrl.endRefreshing()
        }
    }
    
    func loadLocalData() {
    //        loadUserVoteMap()
            // loadPosts()
            forumPostsV2 = [
                ForumPostV2("0",
                            profile: Profile("0", name: "skywalker", title: "", avatarUrl: "steve_jobs", description: ""),
                            title: "My First Post", content: "Hey there!", img: "", createdAt: 1578472771, voteId: "4"),
                ForumPostV2("2",
                profile: Profile("1", name: "Pekka", title: "", avatarUrl: "bill_gates", description: ""),
                title: "Who are you?", content: "Woo!", img: "zhang_yiming", createdAt: 1578472800, voteId: "2"),
            ]
            
            fetchedForumVotes = [
                "5e17033ecd7f7fac9aa02771": ForumVotesV2("5e17033ecd7f7fac9aa02771", count: 4, status: 1, ts: 1578472800),
                "5e170371cd7f7fac9aa02773": ForumVotesV2("5e170371cd7f7fac9aa02773", count: -3, status: 0, ts: 1578472900),
            ]
            
            cachedForumVotes = [
                "5e17033ecd7f7fac9aa02771": ForumVotesV2("25e17033ecd7f7fac9aa02771", count: 0, status: 1, ts: 1578472800),
                "5e170371cd7f7fac9aa02773": ForumVotesV2("5e170371cd7f7fac9aa02773", count: 5, status: 0, ts: 1578472900),
            ]
            self.tableView.reloadData()
        }
    
    func loadData() {
//        loadUserVoteMap()
        loadPosts()
//        forumPostsV2 = [
//            ForumPostV2("0",
//                        profile: Profile("0", name: "skywalker", title: "", avatarUrl: "steve_jobs", description: ""),
//                        title: "My First Post", content: "Hey there!", img: "", createdAt: 1578472771, voteId: "4"),
//            ForumPostV2("2",
//            profile: Profile("1", name: "Pekka", title: "", avatarUrl: "bill_gates", description: ""),
//            title: "Who are you?", content: "Woo!", img: "zhang_yiming", createdAt: 1578472800, voteId: "2"),
//        ]
        
        fetchedForumVotes = [
            "5e17033ecd7f7fac9aa02771": ForumVotesV2("5e17033ecd7f7fac9aa02771", count: 4, status: 1, ts: 1578472800),
            "5e170371cd7f7fac9aa02773": ForumVotesV2("5e170371cd7f7fac9aa02773", count: -3, status: 0, ts: 1578472900),
        ]
        
        cachedForumVotes = [
            "5e17033ecd7f7fac9aa02771": ForumVotesV2("25e17033ecd7f7fac9aa02771", count: 0, status: 1, ts: 1578472800),
            "5e170371cd7f7fac9aa02773": ForumVotesV2("5e170371cd7f7fac9aa02773", count: 5, status: 0, ts: 1578472900),
        ]
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.7) {
            self.tableView.reloadData()
        }
    }
    
    func loadUserVoteMap() {
        forumAPIClient.GetVoteMap(localProfile._id) { result in
            switch result {
            case .success(let map):
                userVoteMap = map
            case .failure(let error):
                print("Error retrieving userVoteMap: \(error)")
                userVoteMap.userId = localProfile._id
            }
        }
    }
    
    func loadPosts() {
        forumAPIClient.GetPosts() { result in
            switch result {
            case .success(let posts):
                self.forumPostsV2 = posts
            case .failure(let error):
                print("Error retrieving posts: \(error)")
            }
        }
    }
}
