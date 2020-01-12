//
//  TabBarViewController.swift
//  cwgcf-app
//
//  Created by Guanhui Guan on 12/19/19.
//  Copyright © 2019 Guanhui Guan. All rights reserved.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let client = ProfileAPIClient()
        client.GetAllProfiles()
        
        // let forumViewController = ForumViewController()
        // forumViewController.loadData()
        
        let scheduleVC = ScheduleViewController()
        scheduleVC.loadEvents()
        
        self.viewControllers = [
            setupChildVC(HomeViewController(), title: "Home", tag: 0, iconName: "house"),
            setupChildVC(scheduleVC, title: "Schedule", tag: 1, iconName: "calendar"),
            setupChildVC(ContactViewController(), title: "Contact", tag: 2, iconName: "person"),
        ]
        selectedIndex = 0
        tabBar.tintColor = darkRed
    }
    
    private func setupChildVC(_ vc:UIViewController, title:String, tag:Int, iconName:String) -> UIViewController {
        let controller = UINavigationController(rootViewController: vc)
        controller.tabBarItem = UITabBarItem(title: title, image: UIImage(systemName: iconName), tag: 0)
        return controller
    }
}
