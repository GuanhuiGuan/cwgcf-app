//
//  EventCellSimplify.swift
//  cwgcf-app
//
//  Created by Guanhui Guan on 1/10/20.
//  Copyright © 2020 Guanhui Guan. All rights reserved.
//

import Foundation
import UIKit

class EventCellSimplify : UITableViewCell {
    static var ID : String! = "EventCellSimplify"
    var event : ScheduleEvent! {
        didSet {
            setCell()
        }
    }
    
    var bgView : UIView!
    var maskBgView : UIView!
    var eventName : UILabel!
    var eventLocation : UILabel!
    var eventInterval : UILabel!
    var hightlightColor : UIColor = .darkGray
    var lowlightColor : UIColor = ghostWhite
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .none
        setupBgView()
        setupEventNameView()
        setupEventLocationView()
        setupEventIntervalView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setCell() {
        hightlightColor = event.getColor()
        if hightlightColor == UIColor.black {
            hightlightColor = .darkGray
        }
        if event.registered {
            maskBgView.backgroundColor = hightlightColor
            eventName.textColor = lowlightColor
            eventLocation.textColor = lowlightColor
            eventInterval.textColor = lowlightColor
        } else {
            maskBgView.backgroundColor = lowlightColor
            eventName.textColor = hightlightColor
            eventLocation.textColor = hightlightColor
            eventInterval.textColor = hightlightColor
        }
        bgView.backgroundColor = hightlightColor
        eventName.text = event.name
        eventLocation.text = event.location
        eventInterval.text = event.getIntervalStr()
    }
    
    private func setupBgView() {
        bgView = UIView()
        addSubview(bgView)
        bgView.translatesAutoresizingMaskIntoConstraints = false
        bgView.layer.masksToBounds = true
        bgView.layer.cornerRadius = 10
        bgView.backgroundColor = hightlightColor
        
        maskBgView = UIView()
        addSubview(maskBgView)
        maskBgView.translatesAutoresizingMaskIntoConstraints = false
        maskBgView.layer.masksToBounds = true
        maskBgView.layer.cornerRadius = 8
        
        NSLayoutConstraint.activate([
            bgView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            bgView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5),
            bgView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            bgView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            
            maskBgView.topAnchor.constraint(equalTo: bgView.topAnchor, constant: 2),
            maskBgView.bottomAnchor.constraint(equalTo: bgView.bottomAnchor, constant: -2),
            maskBgView.leadingAnchor.constraint(equalTo: bgView.leadingAnchor, constant: 2),
            maskBgView.trailingAnchor.constraint(equalTo: bgView.trailingAnchor, constant: -2),
        ])
    }
    
    private func setupEventNameView() {
        eventName = UILabel()
        addSubview(eventName)
        eventName.translatesAutoresizingMaskIntoConstraints = false
        eventName.font = UIFont.boldSystemFont(ofSize: 24)
        NSLayoutConstraint.activate([
            eventName.topAnchor.constraint(equalTo: bgView.topAnchor, constant: 7),
            eventName.leadingAnchor.constraint(equalTo: bgView.leadingAnchor, constant: 15),
            eventName.trailingAnchor.constraint(equalTo: bgView.trailingAnchor, constant: -15),
        ])
    }
    
    private func setupEventLocationView() {
        eventLocation = UILabel()
        addSubview(eventLocation)
        eventLocation.translatesAutoresizingMaskIntoConstraints = false
        eventLocation.font = UIFont.systemFont(ofSize: 14)
        eventLocation.alpha = 0.7
        NSLayoutConstraint.activate([
            eventLocation.topAnchor.constraint(equalTo: eventName.bottomAnchor, constant: 5),
            eventLocation.leadingAnchor.constraint(equalTo: bgView.leadingAnchor, constant: 15),
            eventLocation.trailingAnchor.constraint(equalTo: bgView.trailingAnchor, constant: -15),
        ])
    }
    
    private func setupEventIntervalView() {
        eventInterval = UILabel()
        addSubview(eventInterval)
        eventInterval.translatesAutoresizingMaskIntoConstraints = false
        eventInterval.font = UIFont.systemFont(ofSize: 14)
        eventInterval.alpha = 0.85
        NSLayoutConstraint.activate([
            eventInterval.topAnchor.constraint(equalTo: eventLocation.bottomAnchor, constant: 3),
            eventInterval.leadingAnchor.constraint(equalTo: bgView.leadingAnchor, constant: 15),
            eventInterval.trailingAnchor.constraint(equalTo: bgView.trailingAnchor, constant: -15),
        ])
    }
}
