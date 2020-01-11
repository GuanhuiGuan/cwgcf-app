//
//  StackEntryView.swift
//  cwgcf-app
//
//  Created by Guanhui Guan on 1/11/20.
//  Copyright © 2020 Guanhui Guan. All rights reserved.
//

import Foundation
import UIKit

class StackEntryView : UIView {
    var keyView : UILabel!
    var valueView : UIView!
    
    convenience init(keyWidth: CGFloat, seperatorWidth: CGFloat) {
        self.init(frame: .zero)
        keyView = UILabel()
        addSubview(keyView)
        keyView.translatesAutoresizingMaskIntoConstraints = false
        keyView.numberOfLines = 0
        
        valueView = UILabel()
        addSubview(valueView)
        valueView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            keyView.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            keyView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            keyView.widthAnchor.constraint(equalToConstant: keyWidth),
            
            valueView.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            valueView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
            valueView.leadingAnchor.constraint(equalTo: keyView.trailingAnchor, constant: seperatorWidth),
            valueView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
        ])
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
