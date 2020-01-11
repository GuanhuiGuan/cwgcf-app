//
//  ScheduleCellSimplify.swift
//  cwgcf-app
//
//  Created by Guanhui Guan on 1/10/20.
//  Copyright © 2020 Guanhui Guan. All rights reserved.
//

import Foundation
import UIKit

class ScheduleCellSimplify : UICollectionViewCell, UITableViewDataSource, UITableViewDelegate {
    
    static var ID : String = "ScheduleCellSimplify"
    var navigationController = UINavigationController()
    
    var events : [ScheduleEvent]? {
        didSet {
            setEvents()
        }
    }
    
    lazy var bgView : UITableView = {
        let v = UITableView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = .none
        v.layer.masksToBounds = true
        v.separatorStyle = .none
        return v
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .none
        
        addSubview(bgView)
        setupBgView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupBgView() {
        bgView.register(EventCellSimplify.self, forCellReuseIdentifier: EventCellSimplify.ID)
        bgView.dataSource = self
        bgView.delegate = self
        NSLayoutConstraint.activate([
            bgView.topAnchor.constraint(equalTo: topAnchor, constant: 70),
            bgView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -70),
            bgView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            bgView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5),
        ])
    }
    
    private func setEvents() {
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let count = events?.count ?? 0
        return count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: EventCellSimplify.ID, for: indexPath) as! EventCellSimplify
        cell.event = events?[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let vc = EventViewController()
        vc.event = events?[indexPath.row]
        self.navigationController.pushViewController(vc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
