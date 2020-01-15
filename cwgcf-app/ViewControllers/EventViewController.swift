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
    var event : ScheduleEvent!
    
    var eventName : UILabel = UILabel()
    var eventLocation : UILabel = UILabel()
    var eventInterval : UILabel = UILabel()
    
    var topBarSeperator = UIView()
    let topBarIcon = UIImageView()
    let topBarSeperatorLeft = UIView()
    let topBarSeperatorRight = UIView()
    
    let keyWidth : CGFloat = 100, seperatorWidth : CGFloat = 10
    lazy var eventHostView = StackEntryView(keyWidth: keyWidth, seperatorWidth: seperatorWidth, keyAlignCenter: true)
    lazy var hostProfileArray = ProfileArray(avatarRadius: eventProfileAvatarRadius, numToShow: 3)
    
    lazy var eventAttendeesView = StackEntryView(keyWidth: keyWidth, seperatorWidth: seperatorWidth, keyAlignCenter: true)
    lazy var attendeesProfileArray = ProfileArray(avatarRadius: eventProfileAvatarRadius, numToShow: 3)
    
    lazy var eventDescriptionView = StackEntryView(keyWidth: keyWidth, seperatorWidth: seperatorWidth, keyAlignCenter: false)
    var descriptionTextView = UILabel()
    
    var registerButton = UIButton()
    var buttonActivityIndicator = UIActivityIndicatorView()
    
    override func viewDidLoad() {
        setupTopBar()
        
        setupHostView()
        setupAttendeesView()
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
        
        hostProfileArray.profiles = event.hosts
        hostProfileArray.loadArrayData()
        
        attendeesProfileArray.profiles = event.attendees
        attendeesProfileArray.loadArrayData()
        
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
        
        eventHostView.addValueSubview(hostProfileArray)
        
        NSLayoutConstraint.activate([
            eventHostView.topAnchor.constraint(equalTo: eventInterval.bottomAnchor, constant: 40),
            eventHostView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 40),
            eventHostView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -40),
        ])
        
        updateContentSize(eventHostView, constant: 40)
    }
    
    private func setupAttendeesView() {
        eventAttendeesView.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(eventAttendeesView)
        eventAttendeesView.keyView.text = "Attendees:"
        eventAttendeesView.keyView.textColor = .darkGray
        eventAttendeesView.keyView.font = UIFont.boldSystemFont(ofSize: 16)
        
        eventAttendeesView.addValueSubview(attendeesProfileArray)
        
        NSLayoutConstraint.activate([
            eventAttendeesView.topAnchor.constraint(equalTo: eventHostView.bottomAnchor, constant: 20),
            eventAttendeesView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 40),
            eventAttendeesView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -40),
        ])
        
        updateContentSize(eventAttendeesView, constant: 20)
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
            eventDescriptionView.topAnchor.constraint(equalTo: eventAttendeesView.bottomAnchor, constant: 20),
            eventDescriptionView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 40),
            eventDescriptionView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -40),
        ])
        
        updateContentSize(eventDescriptionView, constant: 20)
    }
    
    private func setupRegisterButton() {
        registerButton.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(registerButton)
        registerButton.layer.cornerRadius = 5
        registerButton.layer.masksToBounds = true
        registerButton.titleLabel!.font = UIFont.systemFont(ofSize: 16)
        registerButton.isEnabled = true
        registerButton.addTarget(self, action: #selector(tapRegisterButton(_:)), for: .touchUpInside)
        
        containerView.addSubview(buttonActivityIndicator)
        buttonActivityIndicator.translatesAutoresizingMaskIntoConstraints = false
        buttonActivityIndicator.color = ghostWhite
        buttonActivityIndicator.style = .medium
        
        NSLayoutConstraint.activate([
            registerButton.topAnchor.constraint(equalTo: eventDescriptionView.bottomAnchor, constant: 120),
            registerButton.centerXAnchor.constraint(equalTo: containerView.centerXAnchor, constant: 0),
            registerButton.heightAnchor.constraint(equalToConstant: 35),
            registerButton.widthAnchor.constraint(equalToConstant: 150),
            
            buttonActivityIndicator.centerXAnchor.constraint(equalTo: registerButton.centerXAnchor, constant: 0),
            buttonActivityIndicator.centerYAnchor.constraint(equalTo: registerButton.centerYAnchor, constant: 0),
        ])
        
        updateContentSize(registerButton, constant: 120)
    }
    
    @objc func tapRegisterButton(_ sender: Any) {
        registerButton.isEnabled = false
        registerButton.setTitle("", for: .disabled)
        buttonActivityIndicator.startAnimating()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            // Logic to update database and wait until response
            self.event.registered = self.event.registered ? false : true
            self.setButtonStyle(self.event.registered)
            
            self.registerButton.isEnabled = true
            self.buttonActivityIndicator.stopAnimating()
        }
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
    
    func loadData() {
        event.hosts = [
            Profile("", name: "", title: "", avatarUrl: "queen", description: ""),
            Profile("", name: "", title: "", avatarUrl: "charles", description: ""),
            Profile("", name: "", title: "", avatarUrl: "amy_zeng", description: ""),
            Profile("", name: "", title: "", avatarUrl: "tracy_guan", description: ""),
        ]
        event.attendees = [
            Profile("", name: "", title: "", avatarUrl: "queen", description: ""),
            Profile("", name: "", title: "", avatarUrl: "charles", description: ""),
            Profile("", name: "", title: "", avatarUrl: "amy_zeng", description: ""),
            Profile("", name: "", title: "", avatarUrl: "tracy_guan", description: ""),
        ]
        setupData()
    }
}
