//
//  EventCell.swift
//  cwgcf-app
//
//  Created by Guanhui Guan on 12/28/19.
//  Copyright © 2019 Guanhui Guan. All rights reserved.
//

import Foundation
import UIKit

class EventCell : UIView {
    var scheduleEvent : ScheduleEvent? {
        didSet {
            title.text = scheduleEvent?.title
            subtitle.text = scheduleEvent?.description
            startTime.text = scheduleEvent?.startTime?.toString()
            endTime.text = scheduleEvent?.endTime?.toString()
        }
    }
    
    lazy var bg : UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = .clear
        v.layer.cornerRadius = 10
        v.layer.masksToBounds = true
        v.addSubview(colorBg)
        return v
    }()
    
    lazy var colorBg : UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = darkRed
        v.layer.cornerRadius = 9
        v.layer.masksToBounds = true
        v.addSubview(title)
        v.addSubview(subtitle)
        v.addSubview(startTime)
        v.addSubview(endTime)
        return v
    }()
    
    var title : UILabel = {
        let v = UILabel()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.font = UIFont.boldSystemFont(ofSize: 16)
        v.textColor = ghostWhite
        return v
    }()
    
    var subtitle : UILabel = {
        let v = UILabel()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.font = UIFont.systemFont(ofSize: 12)
        v.textColor = ghostWhite
        return v
    }()
    
    var startTime : UILabel = {
        let v = UILabel()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.font = UIFont.systemFont(ofSize: 10)
        v.textColor = ghostWhite
        v.textAlignment = .right
        return v
    }()
    
    var endTime : UILabel = {
        let v = UILabel()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.font = UIFont.systemFont(ofSize: 10)
        v.textColor = ghostWhite
        v.textAlignment = .right
        return v
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(bg)
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            bg.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            bg.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            bg.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
            bg.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            
            colorBg.topAnchor.constraint(equalTo: bg.topAnchor, constant: 1),
            colorBg.trailingAnchor.constraint(equalTo: bg.trailingAnchor, constant: -1),
            colorBg.bottomAnchor.constraint(equalTo: bg.bottomAnchor, constant: -1),
            colorBg.leadingAnchor.constraint(equalTo: bg.leadingAnchor, constant: 1),
            
            title.topAnchor.constraint(equalTo: bg.topAnchor, constant: 5),
            title.widthAnchor.constraint(equalToConstant: 200),
            title.leadingAnchor.constraint(equalTo: bg.leadingAnchor, constant: 10),
            
            subtitle.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 5),
            subtitle.widthAnchor.constraint(equalToConstant: 200),
            subtitle.leadingAnchor.constraint(equalTo: bg.leadingAnchor, constant: 10),
            
            startTime.topAnchor.constraint(equalTo: bg.topAnchor, constant: 5),
            startTime.trailingAnchor.constraint(equalTo: bg.trailingAnchor, constant: -10),
            
            endTime.bottomAnchor.constraint(equalTo: bg.bottomAnchor, constant: -5),
            endTime.trailingAnchor.constraint(equalTo: bg.trailingAnchor, constant: -10),
        ])
    }
}
