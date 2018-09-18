//
//  FeedCell.swift
//  YoutubeApplication
//
//  Created by carsworld Indonesia on 17/09/18.
//  Copyright © 2018 Carsworld Indonesia. All rights reserved.
//

import UIKit

class HomeSource: BaseCell, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    let cellId = "cellId"
    var videos: [Voucher]?
    
    lazy var colView: UICollectionView = {
        let layout = UICollectionViewFlowLayout ()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = UIColor.white
        cv.dataSource = self
        cv.delegate = self
        return cv
    }()
    
    func setupDataApi() {
        ApiService.sharedInstance.fetchVideos { (videos: [Voucher]) in
            self.videos = videos
            self.colView.reloadData()
        }
    }
    
    override func setupViews() {
        super.setupViews()
        
        setupDataApi()
        
        addSubview(colView)
        addConstraintWithFormat(format: "H:|[v0]|", views: colView)
        addConstraintWithFormat(format: "V:|[v0]|", views: colView)
        
        colView.register(VoucherCell.self, forCellWithReuseIdentifier: cellId)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return videos?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as! VoucherCell
        
        cell.video = videos? [indexPath.item]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height = (frame.width - 16 - 16) * 9 / 16
        return CGSize(width: frame.width, height: height + 16 + 88)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    
}
