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
        v.backgroundColor = ghostWhite
        
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
            dateLabel.bottomAnchor.constraint(equalTo: v.bottomAnchor, constant: -15)
        ])
        
        let iconView = UIImageView()
        iconView.translatesAutoresizingMaskIntoConstraints = false
        iconView.image = UIImage(systemName: "arrow.right.circle")
        iconView.contentMode = .scaleAspectFill
        iconView.tintColor = .lightGray
        v.addSubview(iconView)
        NSLayoutConstraint.activate([
            iconView.trailingAnchor.constraint(equalTo: v.trailingAnchor, constant: -30),
            iconView.heightAnchor.constraint(equalToConstant: arrowSize),
            iconView.widthAnchor.constraint(equalToConstant: arrowSize),
            iconView.centerYAnchor.constraint(equalTo: v.centerYAnchor, constant: 0),
        ])
        
        return v
    }()
    
    lazy var attendeesPaletteView : UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        
        let imgLeft = UIImageView()
        v.addSubview(imgLeft)
        imgLeft.translatesAutoresizingMaskIntoConstraints = false
        imgLeft.image = UIImage(named: "bill_gates")
        imgLeft.contentMode = .scaleAspectFill
        imgLeft.layer.masksToBounds = true
        
        let imgTopRight = UIImageView()
        v.addSubview(imgTopRight)
        imgTopRight.translatesAutoresizingMaskIntoConstraints = false
        imgTopRight.image = UIImage(named: "dara_k")
        imgTopRight.contentMode = .scaleAspectFill
        imgTopRight.layer.masksToBounds = true
        
        let imgBotRight = UIImageView()
        v.addSubview(imgBotRight)
        imgBotRight.translatesAutoresizingMaskIntoConstraints = false
        imgBotRight.image = UIImage(named: "zhang_yiming")
        imgBotRight.contentMode = .scaleAspectFill
        imgBotRight.layer.masksToBounds = true
        
        let imgCenterBg = UIView()
        v.addSubview(imgCenterBg)
        imgCenterBg.translatesAutoresizingMaskIntoConstraints = false
        imgCenterBg.backgroundColor = ghostWhite
        imgCenterBg.layer.cornerRadius = 55
        
        let imgCenter = UIImageView()
        imgCenterBg.addSubview(imgCenter)
        imgCenter.translatesAutoresizingMaskIntoConstraints = false
        imgCenter.image = UIImage(named: "steve_jobs")
        imgCenter.contentMode = .scaleAspectFill
        imgCenter.layer.cornerRadius = 50
        imgCenter.layer.masksToBounds = true
        
        NSLayoutConstraint.activate([
            imgLeft.topAnchor.constraint(equalTo: v.topAnchor, constant: 0),
            imgLeft.leadingAnchor.constraint(equalTo: v.leadingAnchor, constant: 0),
            imgLeft.bottomAnchor.constraint(equalTo: v.bottomAnchor, constant: 0),
            imgLeft.trailingAnchor.constraint(equalTo: v.centerXAnchor, constant: -2.5),
            
            imgTopRight.topAnchor.constraint(equalTo: v.topAnchor, constant: 0),
            imgTopRight.trailingAnchor.constraint(equalTo: v.trailingAnchor, constant: 0),
            imgTopRight.leadingAnchor.constraint(equalTo: v.centerXAnchor, constant: 2.5),
            imgTopRight.bottomAnchor.constraint(equalTo: v.centerYAnchor, constant: -2.5),
            
            imgBotRight.topAnchor.constraint(equalTo: v.centerYAnchor, constant: 2.5),
            imgBotRight.trailingAnchor.constraint(equalTo: v.trailingAnchor, constant: 0),
            imgBotRight.leadingAnchor.constraint(equalTo: v.centerXAnchor, constant: 2.5),
            imgBotRight.bottomAnchor.constraint(equalTo: v.bottomAnchor, constant: 0),
            
            imgCenterBg.centerXAnchor.constraint(equalTo: v.centerXAnchor, constant: 0),
            imgCenterBg.centerYAnchor.constraint(equalTo: v.centerYAnchor, constant: 0),
            imgCenterBg.widthAnchor.constraint(equalToConstant: 110),
            imgCenterBg.heightAnchor.constraint(equalToConstant: 110),
            
            imgCenter.centerXAnchor.constraint(equalTo: imgCenterBg.centerXAnchor, constant: 0),
            imgCenter.centerYAnchor.constraint(equalTo: imgCenterBg.centerYAnchor, constant: 0),
            imgCenter.widthAnchor.constraint(equalToConstant: 100),
            imgCenter.heightAnchor.constraint(equalToConstant: 100),
        ])
        
        return v
    }()
    
    lazy var attendeesView : UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = ghostWhite
        
        let title = UILabel()
        v.addSubview(title)
        title.translatesAutoresizingMaskIntoConstraints = false
        title.text = enMap["attendees_title"]
        title.numberOfLines = 0
        title.font = UIFont.boldSystemFont(ofSize: 26)
        title.textColor = .darkGray
        NSLayoutConstraint.activate([
            title.topAnchor.constraint(equalTo: v.topAnchor, constant: 20),
            title.leadingAnchor.constraint(equalTo: v.leadingAnchor, constant: 20),
            title.widthAnchor.constraint(equalToConstant: 300),
        ])
        
        let subtitle = UILabel()
        v.addSubview(subtitle)
        subtitle.translatesAutoresizingMaskIntoConstraints = false
        subtitle.text = enMap["attendees_subtitle"]
        subtitle.numberOfLines = 0
        subtitle.font = UIFont.systemFont(ofSize: 16)
        subtitle.textColor = .lightGray
        NSLayoutConstraint.activate([
            subtitle.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 5),
            subtitle.leadingAnchor.constraint(equalTo: v.leadingAnchor, constant: 20),
            subtitle.widthAnchor.constraint(equalToConstant: 300),
        ])
        
        let icon = UIImageView()
        v.addSubview(icon)
        icon.translatesAutoresizingMaskIntoConstraints = false
        icon.image = UIImage(systemName: "person.2.square.stack")
        icon.contentMode = .scaleAspectFill
        icon.tintColor = darkRed
        NSLayoutConstraint.activate([
            icon.centerYAnchor.constraint(equalTo: title.bottomAnchor, constant: 0),
            icon.trailingAnchor.constraint(equalTo: v.trailingAnchor, constant: -25),
            icon.widthAnchor.constraint(equalToConstant: homeIconDiameter),
            icon.heightAnchor.constraint(equalToConstant: homeIconDiameter),
        ])
        
        v.addSubview(attendeesPaletteView)
        NSLayoutConstraint.activate([
            attendeesPaletteView.topAnchor.constraint(equalTo: subtitle.bottomAnchor, constant: 20),
            attendeesPaletteView.leadingAnchor.constraint(equalTo: v.leadingAnchor, constant: 20),
            attendeesPaletteView.trailingAnchor.constraint(equalTo: v.trailingAnchor, constant: -20),
            attendeesPaletteView.heightAnchor.constraint(equalToConstant: 200),
            attendeesPaletteView.bottomAnchor.constraint(equalTo: v.bottomAnchor, constant: -20),
        ])
        
        return v
    }()
    
    lazy var photosView : UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = ghostWhite
        
        let title = UILabel()
        v.addSubview(title)
        title.translatesAutoresizingMaskIntoConstraints = false
        title.text = enMap["photos_title"]
        title.numberOfLines = 0
        title.font = UIFont.boldSystemFont(ofSize: 26)
        title.textColor = .darkGray
        NSLayoutConstraint.activate([
            title.topAnchor.constraint(equalTo: v.topAnchor, constant: 20),
            title.leadingAnchor.constraint(equalTo: v.leadingAnchor, constant: 20),
            title.widthAnchor.constraint(equalToConstant: 300),
        ])
        
        let subtitle = UILabel()
        v.addSubview(subtitle)
        subtitle.translatesAutoresizingMaskIntoConstraints = false
        subtitle.text = enMap["photos_subtitle"]
        subtitle.numberOfLines = 0
        subtitle.font = UIFont.systemFont(ofSize: 16)
        subtitle.textColor = .lightGray
        NSLayoutConstraint.activate([
            subtitle.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 5),
            subtitle.leadingAnchor.constraint(equalTo: v.leadingAnchor, constant: 20),
            subtitle.widthAnchor.constraint(equalToConstant: 300),
        ])
        
        let icon = UIImageView()
        v.addSubview(icon)
        icon.translatesAutoresizingMaskIntoConstraints = false
        icon.image = UIImage(systemName: "photo.on.rectangle")
        icon.contentMode = .scaleAspectFill
        icon.tintColor = darkRed
        NSLayoutConstraint.activate([
            icon.centerYAnchor.constraint(equalTo: title.bottomAnchor, constant: 0),
            icon.trailingAnchor.constraint(equalTo: v.trailingAnchor, constant: -20),
            icon.widthAnchor.constraint(equalToConstant: homeIconDiameter),
            icon.heightAnchor.constraint(equalToConstant: homeIconDiameter),
            icon.bottomAnchor.constraint(equalTo: v.bottomAnchor, constant: -25),
        ])
        
        return v
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        containerView.addSubview(topBanner)
        containerView.addSubview(topBannerPageCtrl)
        getTopBannerContents()
        setTopBannerConstraints()
        topBannerAutoScrollTimer(5)
        topBannerPageCtrl.numberOfPages = topBannerContents.count
        
        containerView.addSubview(titleView)
        setTitleConstraints()
        
        containerView.addSubview(attendeesView)
        setAttendeesConstraints()
        
        containerView.addSubview(photosView)
        setPhotosConstraints()
        
        setupBGAndScroll(enMap["home_title"] ?? "Home")
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
        updateContentSize(titleView)
    }
}

// * MARK * Attendees
extension HomeViewController {
    private func setAttendeesConstraints() {
        NSLayoutConstraint.activate([
            attendeesView.topAnchor.constraint(equalTo: titleView.bottomAnchor, constant: 10),
            attendeesView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 0),
            attendeesView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: 0),
        ])
        updateContentSize(attendeesView)
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(tapAttendees(_:)))
        attendeesView.addGestureRecognizer(tap)
    }
    
    @objc
    private func tapAttendees(_ sender: Any) {
        let vc = AttendeesViewController()
        vc.loadCells()
        vc.modalPresentationStyle = .fullScreen
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

// * MARK * Photos
extension HomeViewController {
    private func setPhotosConstraints() {
        NSLayoutConstraint.activate([
            photosView.topAnchor.constraint(equalTo: attendeesView.bottomAnchor, constant: 10),
            photosView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 0),
            photosView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: 0),
        ])
        updateContentSize(10)
        updateContentSize(photosView)
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(tapPhotos(_:)))
        photosView.addGestureRecognizer(tap)
    }
    
    @objc
    private func tapPhotos(_ sender: Any) {
        let vc = PhotosViewController()
        vc.loadPhotos()
        vc.modalPresentationStyle = .fullScreen
        self.navigationController?.pushViewController(vc, animated: true)
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
