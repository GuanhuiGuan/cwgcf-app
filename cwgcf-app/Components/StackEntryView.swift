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
    
    var keyToTop : NSLayoutConstraint!
    var keyAtCenter : NSLayoutConstraint!
    
    var navigationController : UINavigationController?
    
    convenience init(keyWidth: CGFloat, seperatorWidth: CGFloat, keyAlignCenter: Bool) {
        self.init(frame: .zero)
        keyView = UILabel()
        addSubview(keyView)
        keyView.translatesAutoresizingMaskIntoConstraints = false
        keyView.numberOfLines = 0
        
        valueView = UIView()
        addSubview(valueView)
        valueView.translatesAutoresizingMaskIntoConstraints = false
        
        keyToTop = keyView.topAnchor.constraint(equalTo: topAnchor, constant: 0)
        keyAtCenter = keyView.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 0)
        // default
        keyVerticalCenter(keyAlignCenter)
        
        NSLayoutConstraint.activate([
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
    
    func addValueSubview(_ view: UIView) {
        valueView.addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: valueView.topAnchor, constant: 0),
            view.leadingAnchor.constraint(equalTo: valueView.leadingAnchor, constant: 0),
            view.bottomAnchor.constraint(equalTo: valueView.bottomAnchor, constant: 0),
            view.trailingAnchor.constraint(equalTo: valueView.trailingAnchor, constant: 0),
        ])
    }
    
    func keyVerticalCenter(_ b: Bool) {
        if b {
            keyToTop.isActive = false
            keyAtCenter.isActive = true
        } else {
            keyToTop.isActive = true
            keyAtCenter.isActive = false
        }
    }
}
