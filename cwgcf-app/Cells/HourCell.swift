//
//  HourCell.swift
//  cwgcf-app
//
//  Created by Guanhui Guan on 12/28/19.
//  Copyright © 2019 Guanhui Guan. All rights reserved.
//

import Foundation
import UIKit

class HourCell : UIView {
    var timeStr : String? {
        didSet {
            label.text = timeStr
        }
    }
    
    var label : UILabel = {
        let v = UILabel()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.font = UIFont.systemFont(ofSize: 10)
        v.textColor = .lightGray
        return v
    }()
    
    var bottomMargin : UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = .lightGray
        return v
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(label)
        addSubview(bottomMargin)
        NSLayoutConstraint.activate([
            label.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
            label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            
            bottomMargin.leadingAnchor.constraint(equalTo: label.trailingAnchor, constant: 10),
            bottomMargin.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
            bottomMargin.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            bottomMargin.heightAnchor.constraint(equalToConstant: 0.5),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setCell() {
        label.text = timeStr
    }
}
