//
//  ContactViewController.swift
//  cwgcf-app
//
//  Created by Guanhui Guan on 12/20/19.
//  Copyright © 2019 Guanhui Guan. All rights reserved.
//

import Foundation
import UIKit

var contactEmails : [String] = [
    "cwgcf@ukgdbc.co.uk",
]

class ContactViewController : VCWithScroll {
    lazy var hostsView : UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = ghostWhite
        
        let icon = UIImageView()
        icon.backgroundColor = ghostWhite
        icon.translatesAutoresizingMaskIntoConstraints = false
        icon.contentMode = .scaleAspectFill
        icon.image = UIImage(named: "cwgcf_logo")
        v.addSubview(icon)
        NSLayoutConstraint.activate([
            icon.topAnchor.constraint(equalTo: v.topAnchor, constant: 40),
            icon.centerXAnchor.constraint(equalTo: v.centerXAnchor, constant: 0),
            icon.heightAnchor.constraint(equalToConstant: 100),
            icon.widthAnchor.constraint(equalToConstant: 100),
        ])
        
        let topMargin = UIView()
        topMargin.translatesAutoresizingMaskIntoConstraints = false
        topMargin.backgroundColor = .darkGray
        v.addSubview(topMargin)
        NSLayoutConstraint.activate([
            topMargin.topAnchor.constraint(equalTo: icon.bottomAnchor, constant: 20),
            topMargin.leadingAnchor.constraint(equalTo: v.leadingAnchor, constant: 20),
            topMargin.trailingAnchor.constraint(equalTo: v.trailingAnchor, constant: -20),
            topMargin.heightAnchor.constraint(equalToConstant: 0.5),
        ])
        
        let promotedKey = UILabel()
        promotedKey.translatesAutoresizingMaskIntoConstraints = false
        promotedKey.text = "Promoted by: "
        promotedKey.numberOfLines = 0
        promotedKey.font = UIFont.boldSystemFont(ofSize: 20)
        promotedKey.textColor = .lightGray
        v.addSubview(promotedKey)
        NSLayoutConstraint.activate([
            promotedKey.topAnchor.constraint(equalTo: topMargin.bottomAnchor, constant: 20),
            promotedKey.leadingAnchor.constraint(equalTo: v.leadingAnchor, constant: 20),
            promotedKey.widthAnchor.constraint(equalToConstant: 100),
        ])
        
        let promotedValue = UILabel()
        promotedValue.translatesAutoresizingMaskIntoConstraints = false
        promotedValue.text = "Guangdong Federation of Returned Overseas Chinese"
        promotedValue.numberOfLines = 0
        promotedValue.font = UIFont.systemFont(ofSize: 20)
        promotedValue.textColor = .darkGray
        v.addSubview(promotedValue)
        NSLayoutConstraint.activate([
            promotedValue.topAnchor.constraint(equalTo: promotedKey.topAnchor, constant: 0),
            promotedValue.leadingAnchor.constraint(equalTo: promotedKey.trailingAnchor, constant: 20),
            promotedValue.trailingAnchor.constraint(equalTo: v.trailingAnchor, constant: -20),
        ])
        
        let hostedKey = UILabel()
        hostedKey.translatesAutoresizingMaskIntoConstraints = false
        hostedKey.text = "Hosted by: "
        hostedKey.numberOfLines = 0
        hostedKey.font = UIFont.boldSystemFont(ofSize: 20)
        hostedKey.textColor = .lightGray
        v.addSubview(hostedKey)
        NSLayoutConstraint.activate([
            hostedKey.topAnchor.constraint(equalTo: promotedValue.bottomAnchor, constant: 10),
            hostedKey.leadingAnchor.constraint(equalTo: v.leadingAnchor, constant: 20),
            hostedKey.widthAnchor.constraint(equalToConstant: 100),
        ])
        
        let hostedValue = UILabel()
        hostedValue.translatesAutoresizingMaskIntoConstraints = false
        hostedValue.text = "London China Chamber of Commerce & UK Guangdong Business Chamber"
        hostedValue.numberOfLines = 0
        hostedValue.font = UIFont.systemFont(ofSize: 20)
        hostedValue.textColor = .darkGray
        v.addSubview(hostedValue)
        NSLayoutConstraint.activate([
            hostedValue.topAnchor.constraint(equalTo: hostedKey.topAnchor, constant: 0),
            hostedValue.leadingAnchor.constraint(equalTo: hostedKey.trailingAnchor, constant: 20),
            hostedValue.trailingAnchor.constraint(equalTo: v.trailingAnchor, constant: -20),
            hostedValue.bottomAnchor.constraint(equalTo: v.bottomAnchor, constant: -15)
        ])
        
        return v
    }()
    
    lazy var contactView : UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = ghostWhite
        
        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.text = enMap["contact_page_title"]
        title.numberOfLines = 0
        title.font = UIFont.boldSystemFont(ofSize: 26)
        title.textColor = .darkGray
        v.addSubview(title)
        NSLayoutConstraint.activate([
            title.topAnchor.constraint(equalTo: v.topAnchor, constant: 20),
            title.leadingAnchor.constraint(equalTo: v.leadingAnchor, constant: 20),
            title.widthAnchor.constraint(equalToConstant: 300),
        ])
        
        let subtitle = UILabel()
        subtitle.translatesAutoresizingMaskIntoConstraints = false
        subtitle.text = enMap["contact_page_subtitle"]
        subtitle.numberOfLines = 0
        subtitle.font = UIFont.systemFont(ofSize: 16)
        subtitle.textColor = .lightGray
        v.addSubview(subtitle)
        NSLayoutConstraint.activate([
            subtitle.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 10),
            subtitle.leadingAnchor.constraint(equalTo: v.leadingAnchor, constant: 20),
            subtitle.widthAnchor.constraint(equalToConstant: 300),
        ])
        
        let iconView = UIImageView()
        iconView.translatesAutoresizingMaskIntoConstraints = false
        iconView.image = UIImage(systemName: "info.circle")
        iconView.contentMode = .scaleAspectFill
        iconView.tintColor = darkRed
        v.addSubview(iconView)
        NSLayoutConstraint.activate([
            iconView.trailingAnchor.constraint(equalTo: v.trailingAnchor, constant: -30),
            iconView.heightAnchor.constraint(equalToConstant: homeIconDiameter),
            iconView.widthAnchor.constraint(equalToConstant: homeIconDiameter),
            iconView.centerYAnchor.constraint(equalTo: title.bottomAnchor, constant: 0),
        ])
        
        v.addSubview(infoStack)
        NSLayoutConstraint.activate([
            infoStack.topAnchor.constraint(equalTo: subtitle.bottomAnchor, constant: 20),
            infoStack.centerXAnchor.constraint(equalTo: v.centerXAnchor, constant: 0),
        ])
        
        let copyrightView = UILabel()
        copyrightView.translatesAutoresizingMaskIntoConstraints = false
        let appVersion = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? "1.0.0"
        copyrightView.text = "copyright CWGCF2020 | version \(appVersion)"
        copyrightView.numberOfLines = 0
        copyrightView.font = UIFont.systemFont(ofSize: 8)
        copyrightView.textColor = darkRed
        v.addSubview(copyrightView)
        NSLayoutConstraint.activate([
            copyrightView.topAnchor.constraint(equalTo: infoStack.bottomAnchor, constant: 100),
            copyrightView.bottomAnchor.constraint(equalTo: v.bottomAnchor, constant: -10),
            copyrightView.centerXAnchor.constraint(equalTo: v.centerXAnchor, constant: 0),
        ])
        
        return v
    }()
    
    lazy var infoStack : UIStackView = {
        let v = UIStackView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = ghostWhite
        v.axis = .vertical
        v.spacing = 12
        
        for email in contactEmails {
            let ev = UILabel()
            ev.translatesAutoresizingMaskIntoConstraints = false
            ev.text = email
            ev.font = UIFont.italicSystemFont(ofSize: 18)
            ev.textColor = .darkGray
            ev.textAlignment = .center
            v.addArrangedSubview(ev)
        }
        
        return v
    }()
    
    override func viewDidLoad() {
        setupBGAndScroll(enMap["contact_title"] ?? "Contact")
        
        setHosts()
        setContact()
    }
}

extension ContactViewController {
    
    private func setHosts() {
        containerView.addSubview(hostsView)
        NSLayoutConstraint.activate([
            hostsView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 0),
            hostsView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 0),
            hostsView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: 0),
        ])
        updateContentSize(hostsView)
    }
    
    private func setContact() {
        containerView.addSubview(contactView)
        NSLayoutConstraint.activate([
            contactView.topAnchor.constraint(equalTo: hostsView.bottomAnchor, constant: 10),
            contactView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 0),
            contactView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: 0),
        ])
        updateContentSize(10 + 100)
        updateContentSize(contactView)
    }
}
