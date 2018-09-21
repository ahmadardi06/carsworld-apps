//
//  HistoryCell.swift
//  Carsworld
//
//  Created by carsworld Indonesia on 19/09/18.
//  Copyright © 2018 Carsworld Indonesia. All rights reserved.
//

import UIKit

class HistoryCell: BaseCell, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

    let cellId = "cellId"
    let usedCarsId = "usedCarsId"
    let newCarsId = "newCarsId"
    let shopId = "shopId"
    let rentalId = "rentalId"
    
    let menuIcon = ["Service", "Used Cars", "New Cars", "Shop", "Rental"]
    
    lazy var colView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .white
        cv.dataSource = self
        cv.delegate = self
        return cv
    }()
    
    lazy var segmentedControl: UISegmentedControl = {
        let control = UISegmentedControl(items: menuIcon)
        control.autoSetDimension(.height, toSize: 32.0)
        control.selectedSegmentIndex = 0
        control.layer.borderColor = warnaCarsworld.cgColor
        control.tintColor = warnaCarsworld
        control.addTarget(self, action: #selector(self.controlChanged), for: .valueChanged)
        return control
    }()
    
    override func setupViews() {
        
        let flowLayout = colView.collectionViewLayout as! UICollectionViewFlowLayout
        flowLayout.scrollDirection = .horizontal
        flowLayout.minimumLineSpacing = 0
        
        addSubview(segmentedControl)
        segmentedControl.autoPinEdge(toSuperviewEdge: .left, withInset: 8.0)
        segmentedControl.autoPinEdge(toSuperviewEdge: .right, withInset: 8.0)
        segmentedControl.autoPinEdge(toSuperviewEdge: .top, withInset: 16.0)
        
        addSubview(colView)
        colView.autoPinEdge(.top, to: .bottom, of: segmentedControl, withOffset: 4.0)
        colView.autoPinEdge(toSuperviewEdge: .left)
        colView.autoPinEdge(toSuperviewEdge: .right)
        colView.autoPinEdge(toSuperviewEdge: .bottom)
//        addConstraintWithFormat(format: "H:|[v0]|", views: colView)
//        addConstraintWithFormat(format: "V:|-54-[v0]|", views: colView)
        
        colView.register(ServiceCell.self, forCellWithReuseIdentifier: cellId)
        colView.register(UsedCarsCell.self, forCellWithReuseIdentifier: usedCarsId)
        colView.register(NewCarsCell.self, forCellWithReuseIdentifier: newCarsId)
        colView.register(ShopCell.self, forCellWithReuseIdentifier: shopId)
        colView.register(RentalCell.self, forCellWithReuseIdentifier: rentalId)
        
        colView.isPagingEnabled = true
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return menuIcon.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let identifier: String
        
        if indexPath.item == 1 {
            identifier = usedCarsId
        } else if indexPath.item == 2 {
            identifier = newCarsId
        } else if indexPath.item == 3 {
            identifier = shopId
        } else if indexPath.item == 4 {
            identifier = rentalId
        } else {
            identifier = cellId
        }
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: frame.width, height: frame.height + 16)
    }
    
    @objc func controlChanged() {
        let indexPath = IndexPath(item: segmentedControl.selectedSegmentIndex, section: 0)
        colView.scrollToItem(at: indexPath, at: [], animated: true)
    }
    
}
