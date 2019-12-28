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
    
    lazy var bgView : UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = ghostWhite
        v.layer.cornerRadius = 30
        v.layer.masksToBounds = true
        return v
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .clear
        
        addSubview(bgView)
        setBg()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setBg() {
        NSLayoutConstraint.activate([
            bgView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 100),
            bgView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -100),
            bgView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            bgView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
        ])
    }
}
