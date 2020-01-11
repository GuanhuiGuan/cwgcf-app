//
//  ScheduleViewController.swift
//  cwgcf-app
//
//  Created by Guanhui Guan on 12/27/19.
//  Copyright © 2019 Guanhui Guan. All rights reserved.
//

import Foundation
import UIKit

class ScheduleViewController : UIViewController {
    
    var allEvents : [[ScheduleEvent]] = []
    
    lazy var mainView : UICollectionView = {
        let flow = UICollectionViewFlowLayout()
        flow.scrollDirection = .horizontal
        let v = UICollectionView(frame: .zero, collectionViewLayout: flow)
        v.translatesAutoresizingMaskIntoConstraints = false
        v.isPagingEnabled = true
        v.backgroundColor = .clear
        v.register(ScheduleCellSimplify.self, forCellWithReuseIdentifier: ScheduleCellSimplify.ID)
        v.showsHorizontalScrollIndicator = false
        v.dataSource = self
        v.delegate = self
        return v
    }()
    
    var bgLogo : UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = ghostWhite
        setBgLogo()
        navigationItem.title = dates[0].formatToDMY()
        
        view.addSubview(mainView)
        setMainview()
    }
}


// *MARK* Mainview

extension ScheduleViewController {
    private func setMainview() {
        NSLayoutConstraint.activate([
            mainView.topAnchor.constraint(equalTo: view.topAnchor, constant: (view.window?.windowScene?.statusBarManager?.statusBarFrame.height ?? 0.0) +
            (self.navigationController?.navigationBar.frame.height ?? 0.0)),
            mainView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
            mainView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            mainView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
        ])
    }
    
    func loadEvents() {
        allEvents = tempSchedulesV2
    }
    
    func setBgLogo() {
        bgLogo = UIImageView()
        view.addSubview(bgLogo)
        bgLogo.translatesAutoresizingMaskIntoConstraints = false
        bgLogo.image = UIImage(named: "cwgcf_logo")
        bgLogo.setImageColor(color: .lightGray)
        bgLogo.alpha = 0.4
        NSLayoutConstraint.activate([
            bgLogo.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
            bgLogo.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 0),
            bgLogo.heightAnchor.constraint(equalToConstant: 200),
            bgLogo.widthAnchor.constraint(equalToConstant: 200),
        ])
    }
}

extension ScheduleViewController : UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        if collectionView == mainView {
            return 1
        }
        return 0
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == mainView {
            return dates.count
        }
        return 0
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == mainView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ScheduleCellSimplify.ID, for: indexPath) as! ScheduleCellSimplify
            cell.events = allEvents[indexPath.row]
            cell.navigationController = self.navigationController!
            return cell
        }
        return UICollectionViewCell()
    }
}

extension ScheduleViewController : UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == mainView {
            return CGSize(width: view.frame.width, height: mainView.frame.height)
        }
        return CGSize.zero
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        if collectionView == mainView {
            return 0
        }
        return 0
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        if collectionView == mainView {
            return 0
        }
        return 0
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        if collectionView == mainView {
            return UIEdgeInsets.init(top: 0, left: 0, bottom: 0, right: 0)
        }
        return UIEdgeInsets.zero
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        if scrollView == mainView {
            let pageNumber = round(scrollView.contentOffset.x / scrollView.frame.size.width)
            // topBannerPageCtrl.currentPage = Int(pageNumber)
            navigationItem.title = dates[Int(pageNumber)].formatToDMY()
        }
    }
}
