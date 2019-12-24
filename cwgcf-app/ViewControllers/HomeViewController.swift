//
//  HomeViewController.swift
//  cwgcf-app
//
//  Created by Guanhui Guan on 12/19/19.
//  Copyright © 2019 Guanhui Guan. All rights reserved.
//

import UIKit

class HomeViewController: VCWithScroll {
    
    var topBannerContents : [String] = []
    
    lazy var topBanner : UICollectionView = {
        let flow = UICollectionViewFlowLayout()
        flow.scrollDirection = .horizontal
        let v = UICollectionView(frame: .zero, collectionViewLayout: flow)
        v.translatesAutoresizingMaskIntoConstraints = false
        v.isPagingEnabled = true
        v.backgroundColor = ghostWhite
        v.register(TopBannerCell.self, forCellWithReuseIdentifier: TopBannerCell.ID)
        v.dataSource = self
        v.delegate = self
        return v
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        getTopBannerContents()
        
        containerView.addSubview(topBanner)
        getTopBannerContents()
        setTopBannerConstraints()
        
        setupBGAndScroll(enMap["home_title"] ?? "Home")
        
        // updateContentSize(1000)
    }
}

// * MARK * CollectionViews

extension HomeViewController {
    private func getTopBannerContents() {
        topBannerContents = [
            "london_buildings",
            "london_view_0",
        ]
    }
    
    private func setTopBannerConstraints() {
        NSLayoutConstraint.activate([
            topBanner.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 0),
            topBanner.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 0),
            topBanner.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: 0),
            topBanner.heightAnchor.constraint(equalToConstant: topBannerHeight),
        ])
        updateContentSize(topBannerHeight)
    }
}

extension HomeViewController : UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        if collectionView == topBanner {
            return 1
        }
        return 0
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == topBanner {
            return topBannerContents.count
        }
        return 0
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == topBanner {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TopBannerCell.ID, for: indexPath) as! TopBannerCell
            cell.cellContent = CellContent(topBannerContents[indexPath.row])
            cell.setupCell()
            return cell
        }
        return UICollectionViewCell()
    }
}

extension HomeViewController : UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == topBanner {
            return CGSize(width: view.frame.width, height: topBannerHeight)
        }
        return CGSize.zero
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        if collectionView == topBanner {
            return 0
        }
        return 0
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        if collectionView == topBanner {
            return 0
        }
        return 0
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        if collectionView == topBanner {
            return UIEdgeInsets.init(top: 0, left: 0, bottom: 0, right: 0)
        }
        return UIEdgeInsets.zero
    }
}
