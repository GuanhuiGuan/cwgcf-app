//
//  PhotoCell.swift
//  cwgcf-app
//
//  Created by Guanhui Guan on 12/26/19.
//  Copyright © 2019 Guanhui Guan. All rights reserved.
//

import Foundation
import UIKit

class PhotoCell: UITableViewCell {
    lazy var imgView : UIImageView = {
        let v = UIImageView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.layer.masksToBounds = true
        v.contentMode = .scaleAspectFill
        return v
    }()
    
    var imgUrl : String = ""
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = backgroundColor
        
        contentView.addSubview(imgView)
        NSLayoutConstraint.activate([
            imgView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0),
            imgView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            imgView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0),
            imgView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0),
            imgView.heightAnchor.constraint(lessThanOrEqualToConstant: 400),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setCell() {
        if saveS3Data {
            imgView.loadLocal(imgUrl, defaultImg: UIImage(), defaultTint: .white)
        } else {
            imgView.load(imgUrl, defaultImg: UIImage(), defaultTint: .white)
        }
    }
}
