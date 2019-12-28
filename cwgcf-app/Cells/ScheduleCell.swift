//
//  ScheduleCell.swift
//  cwgcf-app
//
//  Created by Guanhui Guan on 12/27/19.
//  Copyright © 2019 Guanhui Guan. All rights reserved.
//

import Foundation
import UIKit

class ScheduleCell : UICollectionViewCell {
    static var ID : String = "ScheduleCell"
    
    var hoursConstraints : [NSLayoutConstraint] = []
    
    lazy var bgView : UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = ghostWhite
        v.layer.cornerRadius = 15
        v.layer.masksToBounds = true
        return v
    }()
    
    lazy var timeTableContentSize : CGSize = {
        let s = CGSize()
        return s
    }()
    
    lazy var timeTableContainer : UIView = {
        let v = UIView()
        return v
    }()
    
    lazy var timeTableView : UIScrollView = {
        let v = UIScrollView()
        v.addSubview(timeTableContainer)
        return v
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .clear
        
        addSubview(bgView)
        setBg()
        
        bgView.addSubview(timeTableView)
        setTimeTable()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setBg() {
        NSLayoutConstraint.activate([
            bgView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 75),
            bgView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -75),
            bgView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            bgView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
        ])
    }
}

extension ScheduleCell {
    private func setTimeTable() {
        layoutIfNeeded()
        timeTableContentSize = CGSize(width: self.bgView.bounds.width, height: 24 * timeTableCellHeight)
        timeTableContainer.frame.size = timeTableContentSize
        timeTableView.contentSize = timeTableContentSize
        timeTableView.frame = self.bgView.bounds
        
        setHours()
    }
    
    private func setHours() {
        for h in 1...24 {
            setHour(h)
        }
        NSLayoutConstraint.activate(self.hoursConstraints)
    }
    
    private func setHour(_ i : Int) {
        var timeStr = "\(i):00"
        if timeStr.count == 4 {
            timeStr = "0" + timeStr
        }
        let v = HourCell()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.timeStr = timeStr
        timeTableContainer.addSubview(v)
        let offset = CGFloat(i-1) * timeTableCellHeight
        hoursConstraints += [
            v.topAnchor.constraint(equalTo: timeTableContainer.topAnchor, constant: offset),
            v.leadingAnchor.constraint(equalTo: timeTableContainer.leadingAnchor, constant: 0),
            v.trailingAnchor.constraint(equalTo: timeTableContainer.trailingAnchor, constant: 0),
            v.heightAnchor.constraint(equalToConstant: timeTableCellHeight),
        ]
    }
}
