//
//  EventViewController.swift
//  cwgcf-app
//
//  Created by Guanhui Guan on 1/11/20.
//  Copyright © 2020 Guanhui Guan. All rights reserved.
//

import Foundation
import UIKit

class EventViewController : VCWithScroll {
    var event : ScheduleEvent! {
        didSet{
            setupData()
        }
    }
    
    var eventName : UILabel = UILabel()
    var eventLocation : UILabel = UILabel()
    var eventInterval : UILabel = UILabel()
    
    var topBarSeperator = UIView()
    let topBarIcon = UIImageView()
    let topBarSeperatorLeft = UIView()
    let topBarSeperatorRight = UIView()
    
    let keyWidth : CGFloat = 100, seperatorWidth : CGFloat = 10
    lazy var eventHostView = StackEntryView(keyWidth: keyWidth, seperatorWidth: seperatorWidth)
    var hostAvatar = UIImageView()
    
    lazy var eventAttendeesView = StackEntryView(keyWidth: keyWidth, seperatorWidth: seperatorWidth)
    
    lazy var eventDescriptionView = StackEntryView(keyWidth: keyWidth, seperatorWidth: seperatorWidth)
    var descriptionTextView = UILabel()
    
    var registerButton = UIButton()
    var buttonActivityIndicator = UIActivityIndicatorView()
    
    override func viewDidLoad() {
        setupTopBar()
        
        setupHostView()
        setupDescriptionView()
        setupRegisterButton()
        
        setupBGAndScroll(enMap["event_view"] ?? "Event", bgColor: ghostWhite)
    }
    
    private func setupData() {
        eventName.text = event.name
        eventLocation.text = event.location
        eventInterval.text = event.getIntervalStr()
        
        var color = UIColor(hexString: event.colorHex)
        if color == .black {
            color = .darkGray
        }
        topBarIcon.setImageColor(color: color)
        topBarSeperatorLeft.backgroundColor = color
        topBarSeperatorRight.backgroundColor = color
        
        descriptionTextView.text = event.getDescription()
        
        setButtonStyle(event.registered)
    }
    
    private func setupTopBar() {
        containerView.addSubview(eventName)
        eventName.translatesAutoresizingMaskIntoConstraints = false
        eventName.font = UIFont.boldSystemFont(ofSize: 24)
        eventName.textColor = .darkGray
        eventName.textAlignment = .center
        eventName.numberOfLines = 0
        
        containerView.addSubview(topBarSeperator)
        setupTopbarSeperator()
        topBarSeperator.translatesAutoresizingMaskIntoConstraints = false
        
        containerView.addSubview(eventLocation)
        eventLocation.translatesAutoresizingMaskIntoConstraints = false
        eventLocation.font = UIFont.systemFont(ofSize: 18)
        eventLocation.textColor = .lightGray
        eventLocation.textAlignment = .center
        eventLocation.numberOfLines = 0
        
        containerView.addSubview(eventInterval)
        eventInterval.translatesAutoresizingMaskIntoConstraints = false
        eventInterval.font = UIFont.systemFont(ofSize: 18)
        eventInterval.textColor = .lightGray
        eventInterval.textAlignment = .center
        eventInterval.numberOfLines = 0
        
        NSLayoutConstraint.activate([
            eventName.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 40),
            eventName.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 15),
            eventName.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -15),
            
            topBarSeperator.topAnchor.constraint(equalTo: eventName.bottomAnchor, constant: 10),
            topBarSeperator.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 35),
            topBarSeperator.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -35),
            
            eventLocation.topAnchor.constraint(equalTo: topBarSeperator.bottomAnchor, constant: 10),
            eventLocation.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 15),
            eventLocation.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -15),
            
            eventInterval.topAnchor.constraint(equalTo: eventLocation.bottomAnchor, constant: 7),
            eventInterval.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 15),
            eventInterval.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -15),
        ])
        
        updateContentSize(eventName, constant: 50)
        updateContentSize(eventLocation, constant: 20)
        updateContentSize(eventInterval, constant: 10)
    }
    
    private func setupTopbarSeperator() {
        topBarSeperator.addSubview(topBarIcon)
        topBarIcon.translatesAutoresizingMaskIntoConstraints = false
        topBarIcon.image = UIImage(systemName: "globe")
        topBarIcon.contentMode = .scaleAspectFill
        
        topBarSeperator.addSubview(topBarSeperatorLeft)
        topBarSeperatorLeft.translatesAutoresizingMaskIntoConstraints = false
        topBarSeperator.addSubview(topBarSeperatorRight)
        topBarSeperatorRight.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            topBarIcon.centerXAnchor.constraint(equalTo: topBarSeperator.centerXAnchor, constant: 0),
            topBarIcon.centerYAnchor.constraint(equalTo: topBarSeperator.centerYAnchor, constant: 0),
            topBarIcon.topAnchor.constraint(equalTo: topBarSeperator.topAnchor, constant: 0),
            topBarIcon.bottomAnchor.constraint(equalTo: topBarSeperator.bottomAnchor, constant: 0),
            topBarIcon.heightAnchor.constraint(equalToConstant: 30),
            
            topBarSeperatorLeft.centerYAnchor.constraint(equalTo: topBarSeperator.centerYAnchor, constant: 0),
            topBarSeperatorLeft.leadingAnchor.constraint(equalTo: topBarSeperator.leadingAnchor, constant: 0),
            topBarSeperatorLeft.trailingAnchor.constraint(equalTo: topBarIcon.leadingAnchor, constant: -15),
            topBarSeperatorLeft.heightAnchor.constraint(equalToConstant: 3),
            
            topBarSeperatorRight.centerYAnchor.constraint(equalTo: topBarSeperator.centerYAnchor, constant: 0),
            topBarSeperatorRight.trailingAnchor.constraint(equalTo: topBarSeperator.trailingAnchor, constant: 0),
            topBarSeperatorRight.leadingAnchor.constraint(equalTo: topBarIcon.trailingAnchor, constant: 15),
            topBarSeperatorRight.heightAnchor.constraint(equalToConstant: 3),
        ])
    }
    
    private func setupHostView() {
        eventHostView.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(eventHostView)
        
        eventHostView.keyView.text = "Host:"
        eventHostView.keyView.textColor = .darkGray
        eventHostView.keyView.font = UIFont.boldSystemFont(ofSize: 16)
        
        let profilesView = UIView()
        profilesView.translatesAutoresizingMaskIntoConstraints = false
        eventHostView.addValueSubview(profilesView)
        
        hostAvatar.translatesAutoresizingMaskIntoConstraints = false
        profilesView.addSubview(hostAvatar)
        hostAvatar.image = UIImage(named: "queen")
        hostAvatar.contentMode = .scaleAspectFill
        hostAvatar.layer.cornerRadius = 15
        hostAvatar.layer.masksToBounds = true
        
        NSLayoutConstraint.activate([
            eventHostView.topAnchor.constraint(equalTo: eventInterval.bottomAnchor, constant: 40),
            eventHostView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 40),
            eventHostView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -40),
            
            hostAvatar.leadingAnchor.constraint(equalTo: profilesView.leadingAnchor, constant: 0),
            hostAvatar.centerYAnchor.constraint(equalTo: profilesView.centerYAnchor, constant: 0),
            hostAvatar.heightAnchor.constraint(equalToConstant: 30),
            hostAvatar.widthAnchor.constraint(equalToConstant: 30),
        ])
        
        updateContentSize(eventHostView, constant: 40)
    }
    
    private func setupDescriptionView() {
        eventDescriptionView.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(eventDescriptionView)
        
        eventDescriptionView.keyView.text = "Description:"
        eventDescriptionView.keyView.textColor = .darkGray
        eventDescriptionView.keyView.font = UIFont.boldSystemFont(ofSize: 16)
        
        eventDescriptionView.addValueSubview(descriptionTextView)
        descriptionTextView.numberOfLines = 0
        descriptionTextView.textColor = .systemGray
        descriptionTextView.font = UIFont.systemFont(ofSize: 16)
        
        NSLayoutConstraint.activate([
            eventDescriptionView.topAnchor.constraint(equalTo: eventHostView.bottomAnchor, constant: 20),
            eventDescriptionView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 40),
            eventDescriptionView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -40),
        ])
        
        updateContentSize(eventDescriptionView, constant: 10)
    }
    
    private func setupRegisterButton() {
        registerButton.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(registerButton)
        registerButton.layer.cornerRadius = 5
        registerButton.layer.masksToBounds = true
        registerButton.titleLabel!.font = UIFont.systemFont(ofSize: 16)
        
        // TODO: investigate why not working
        registerButton.addTarget(self, action: #selector(tapRegisterButton), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            registerButton.topAnchor.constraint(equalTo: eventDescriptionView.bottomAnchor, constant: 120),
            registerButton.centerXAnchor.constraint(equalTo: containerView.centerXAnchor, constant: 0),
            registerButton.heightAnchor.constraint(equalToConstant: 35),
            registerButton.widthAnchor.constraint(equalToConstant: 150),
        ])
    }
    
    @objc
    func tapRegisterButton(_ sender: Any) {
        registerButton.isEnabled = false
        buttonActivityIndicator.startAnimating()
        
        print("REGISTERED CHANGED: \(event.registered)")
        
        // Logic to update database and wait until response
        event.registered = event.registered ? false : true
        setButtonStyle(event.registered)
        
        self.registerButton.isEnabled = true
        self.buttonActivityIndicator.stopAnimating()
    }
    
    private func setButtonStyle(_ registered: Bool) {
        if registered {
            registerButton.setTitle("Leave event", for: .normal)
            registerButton.backgroundColor = darkRed
        } else {
            registerButton.setTitle("Attend event", for: .normal)
            registerButton.backgroundColor = indigo
        }
    }
}
