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
        v.showsHorizontalScrollIndicator = false
        v.dataSource = self
        v.delegate = self
        return v
    }()
    
    lazy var topBannerPageCtrl : UIPageControl = {
        let res = UIPageControl()
        res.translatesAutoresizingMaskIntoConstraints = false
        res.currentPage = 0
        res.pageIndicatorTintColor = .lightGray
        res.currentPageIndicatorTintColor = darkRed
        return res
    }()
    
    lazy var titleView : UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        
        let locationLabel = UILabel()
        locationLabel.translatesAutoresizingMaskIntoConstraints = false
        locationLabel.text = enMap["event_location"]
        locationLabel.numberOfLines = 0
        locationLabel.font = UIFont.systemFont(ofSize: 20)
        locationLabel.textColor = .darkGray
        v.addSubview(locationLabel)
        NSLayoutConstraint.activate([
            locationLabel.topAnchor.constraint(equalTo: v.topAnchor, constant: 20),
            locationLabel.leadingAnchor.constraint(equalTo: v.leadingAnchor, constant: 20),
            locationLabel.widthAnchor.constraint(equalToConstant: 300),
        ])
        
        let dateLabel = UILabel()
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        dateLabel.text = enMap["event_dates"]
        dateLabel.numberOfLines = 0
        dateLabel.font = UIFont.systemFont(ofSize: 16)
        dateLabel.textColor = .lightGray
        v.addSubview(dateLabel)
        NSLayoutConstraint.activate([
            dateLabel.topAnchor.constraint(equalTo: locationLabel.bottomAnchor, constant: 10),
            dateLabel.leadingAnchor.constraint(equalTo: v.leadingAnchor, constant: 20),
            dateLabel.widthAnchor.constraint(equalToConstant: 300),
        ])
        
        let iconView = UIImageView()
        iconView.translatesAutoresizingMaskIntoConstraints = false
        iconView.image = UIImage(systemName: "calendar.circle")
        iconView.contentMode = .scaleAspectFill
        iconView.tintColor = darkRed
        v.addSubview(iconView)
        NSLayoutConstraint.activate([
            iconView.centerYAnchor.constraint(equalTo: locationLabel.bottomAnchor, constant: -5),
            iconView.trailingAnchor.constraint(equalTo: v.trailingAnchor, constant: -20),
            iconView.heightAnchor.constraint(equalToConstant: 60),
            iconView.widthAnchor.constraint(equalToConstant: 60),
        ])
        
        return v
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        getTopBannerContents()
        
        containerView.addSubview(topBanner)
        containerView.addSubview(topBannerPageCtrl)
        getTopBannerContents()
        setTopBannerConstraints()
        topBannerAutoScrollTimer(5)
        topBannerPageCtrl.numberOfPages = topBannerContents.count
        
        containerView.addSubview(titleView)
        setTitleConstraints()
        
        setupBGAndScroll(enMap["home_title"] ?? "Home")
        
        // updateContentSize(1000)
    }
}

// * MARK * CollectionViews

extension HomeViewController {
    private func getTopBannerContents() {
        topBannerContents = [
            "cwgcf_ad_banner_0",
            "cwgcf_ad_banner_1",
            "cwgcf_ad_banner_2",
        ]
    }
    
    private func setTopBannerConstraints() {
        NSLayoutConstraint.activate([
            topBanner.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 0),
            topBanner.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 0),
            topBanner.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: 0),
            topBanner.heightAnchor.constraint(equalToConstant: topBannerHeight),
            
            topBannerPageCtrl.bottomAnchor.constraint(equalTo: topBanner.bottomAnchor, constant: -10),
            topBannerPageCtrl.centerXAnchor.constraint(equalTo: topBanner.centerXAnchor, constant: 0),
            topBannerPageCtrl.widthAnchor.constraint(equalToConstant: 200),
            topBannerPageCtrl.heightAnchor.constraint(equalToConstant: 20),
        ])
        updateContentSize(topBannerHeight)
    }
    
    private func topBannerAutoScrollTimer(_ timeInterval: Double) {
        Timer.scheduledTimer(timeInterval: timeInterval, target: self, selector: #selector(autoScroll(_:)), userInfo: nil, repeats: true)
    }
    
    @objc
    private func autoScroll(_ timer : Timer) {
        for cell in topBanner.visibleCells {
            let indexPath = topBanner.indexPath(for: cell)
            if indexPath!.row < topBannerContents.count - 1 {
                let nextIndex = IndexPath.init(row: indexPath!.row + 1, section: indexPath!.section)
                topBanner.scrollToItem(at: nextIndex, at: .right, animated: true)
                topBannerPageCtrl.currentPage = nextIndex.row
            }
            else {
                let nextIndex = IndexPath.init(row: 0, section: indexPath!.section)
                topBanner.scrollToItem(at: nextIndex, at: .left, animated: true)
                topBannerPageCtrl.currentPage = nextIndex.row
            }
        }
    }
}

// * MARK * title
extension HomeViewController {
    private func setTitleConstraints() {
        NSLayoutConstraint.activate([
            titleView.topAnchor.constraint(equalTo: topBanner.bottomAnchor, constant: 0),
            titleView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 0),
            titleView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: 0),
        ])
        updateContentSize(titleView.frame.height)
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
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        if scrollView == topBanner {
            let pageNumber = round(scrollView.contentOffset.x / scrollView.frame.size.width)
            topBannerPageCtrl.currentPage = Int(pageNumber)
        }
    }
}
