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
    var contents: [CellContent] = []
    
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
        return contents.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! ProfileCell
        cell.content = contents[indexPath.row]
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
        contents = [
            CellContent("steve_jobs", name: "Steve Jobs", title: "Founder of Apple Inc"),
            CellContent("", name: "John Doe", title: "Student"),
            CellContent("zhang_yiming", name: "Zhang Yiming", title: "Founder of ByteDance"),
            CellContent("dara_k", name: "Dara Khosrowshahi", title: "CEO of Uber Technologies"),
            CellContent("bill_gates", name: "Bill Gates", title: "Founder of Microsoft"),
            CellContent("", name: "", title: ""),
            CellContent("", name: "Darth Vader", title: "Sith Lord"),
            CellContent("", name: "Jane Doe", title: ""),
        ]
    }
}
