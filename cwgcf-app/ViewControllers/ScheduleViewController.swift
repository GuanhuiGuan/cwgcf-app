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
    var dates : [String] = []
    
    lazy var mainView : UICollectionView = {
        let flow = UICollectionViewFlowLayout()
        flow.scrollDirection = .horizontal
        let v = UICollectionView(frame: .zero, collectionViewLayout: flow)
        v.translatesAutoresizingMaskIntoConstraints = false
        v.isPagingEnabled = true
        v.backgroundColor = .clear
        v.register(ScheduleCell.self, forCellWithReuseIdentifier: ScheduleCell.ID)
        v.showsHorizontalScrollIndicator = false
        v.dataSource = self
        v.delegate = self
        return v
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        view.backgroundColor = backgroundColor
        navigationItem.title = dates[0].toDate()?.toStringDateOnly()
        
        view.addSubview(mainView)
        setMainview()
    }
    
    func loadSchedules() {
        dates = [
            "2020-10-18",
            "2020-10-19",
            "2020-10-20",
        ]
    }
}


// *MARK* Mainview

extension ScheduleViewController {
    private func setMainview() {
        print(navigationController?.navigationBar.frame.height ?? 0)
        NSLayoutConstraint.activate([
            mainView.topAnchor.constraint(equalTo: view.topAnchor, constant: (view.window?.windowScene?.statusBarManager?.statusBarFrame.height ?? 0.0) +
            (self.navigationController?.navigationBar.frame.height ?? 0.0)),
            mainView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
            mainView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            mainView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
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
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ScheduleCell.ID, for: indexPath) as! ScheduleCell
//            cell.cellContent = CellContent(topBannerContents[indexPath.row])
//            cell.setupCell()
            return cell
        }
        return UICollectionViewCell()
    }
}

extension ScheduleViewController : UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == mainView {
            return CGSize(width: view.frame.width, height: view.frame.height)
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
//            topBannerPageCtrl.currentPage = Int(pageNumber)
            navigationItem.title = dates[Int(pageNumber)].toDate()?.toStringDateOnly()
        }
    }
}
