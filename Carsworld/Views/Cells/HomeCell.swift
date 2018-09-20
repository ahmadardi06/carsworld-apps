//
//  HomeCell.swift
//  Carsworld
//
//  Created by carsworld Indonesia on 20/09/18.
//  Copyright © 2018 Carsworld Indonesia. All rights reserved.
//

import UIKit

class HomeCell: BaseCell, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    let cellId = "cellId"
    
    var homeController: HomeController?
    
    let colView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .white
        cv.translatesAutoresizingMaskIntoConstraints = false
        return cv
    }()
    
    let titleApps: UILabel = {
        let lbl = UILabel()
        lbl.text = "Top Listing Promotion"
        lbl.font = UIFont.boldSystemFont(ofSize: 13)
        return lbl
    }()
    
    let dividerApps: UIView = {
        let div = UIView()
        div.backgroundColor = UIColor(white: 0.4, alpha: 0.4)
        return div
    }()
    
    override func setupViews() {
        
        backgroundColor = .white
        colView.dataSource = self
        colView.delegate = self
        
        addSubview(colView)
        addSubview(titleApps)
        addSubview(dividerApps)
        
        colView.register(AppsCell.self, forCellWithReuseIdentifier: cellId )
        
        addConstraintWithFormat(format: "H:|-8-[v0]-8-|", views: colView)
        addConstraintWithFormat(format: "V:|-8-[v0]-8-[v1]-8-[v2(0.5)]|", views: titleApps, colView, dividerApps)
        
        addConstraintWithFormat(format: "H:|-8-[v0]-8-|", views: titleApps)
        addConstraintWithFormat(format: "H:|-8-[v0]-8-|", views: dividerApps)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 250, height: frame.height - 35)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0.5
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        homeController?.showAppDetail()
        print("item mobil detail")
    }
    
}

class AppsCell: BaseCell {
    
    let imgPromo: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "cars")
        img.layer.cornerRadius = 8.0
        img.layer.masksToBounds = true
        img.contentMode = .scaleAspectFill
        img.layer.borderColor = UIColor.darkGray.cgColor
        img.layer.borderWidth = 0.5
        return img
    }()
    
    override func setupViews() {
        
        addSubview(imgPromo)
        
        imgPromo.autoPinEdge(toSuperviewEdge: .top, withInset: 4.0)
        imgPromo.autoPinEdge(toSuperviewEdge: .left, withInset: 4.0)
        imgPromo.autoPinEdge(toSuperviewEdge: .bottom, withInset: 4.0)
        imgPromo.autoPinEdge(toSuperviewEdge: .right, withInset: 4.0)
        
    }
}

class MenuHomeCell: BaseCell, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    let cellId = "cellId"
    
    var homeController: HomeController?
    
    let colView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .white
        cv.translatesAutoresizingMaskIntoConstraints = false
        return cv
    }()
    
    override func setupViews() {
        
        backgroundColor = .white
        colView.dataSource = self
        colView.delegate = self
        
        addSubview(colView)

        colView.register(MenuItemCell.self, forCellWithReuseIdentifier: cellId )
        
        addConstraintWithFormat(format: "H:|[v0]|", views: colView)
        addConstraintWithFormat(format: "V:|[v0]|", views: colView)
        
    }
    
    let menuIcon = ["service","newcars","usedcar","insurance","carsworldshop","auction","finance","more-2"]
    let menuText = ["Service","New Cars","Used Cars","Insurance","Carsworld Shop","Auction","Finance","More"]
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return menuIcon.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! MenuItemCell
        cell.menuText.text = menuText[indexPath.item]
        cell.menuIcon.image = UIImage(named: menuIcon[indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        //grid 4 and this setting
        let numberOfColumns: CGFloat = 4
        let itemWidth = (frame.width - (numberOfColumns - 1)) / numberOfColumns
        return CGSize(width: itemWidth, height: itemWidth)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1.0
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        homeController?.showMenuDetail()
    }
    
}

class MenuItemCell: BaseCell {
    
    let menuIcon: UIImageView = {
        let img = UIImageView()
        img.autoSetDimension(.height, toSize: 50.0)
        img.autoSetDimension(.width, toSize: 50.0)
        img.image = UIImage(named: "voucher")
        img.contentMode = .scaleAspectFill
        return img
    }()
    
    let menuText: UILabel = {
        let lbl = UILabel()
        lbl.text = "Menu"
        lbl.font = UIFont.systemFont(ofSize: 10)
        lbl.textAlignment = .center
        return lbl
    }()
    
    override func setupViews() {
        
        addSubview(menuIcon)
        addSubview(menuText)
        
        menuIcon.autoPinEdge(toSuperviewEdge: .top, withInset: 24)
        menuIcon.autoPinEdge(toSuperviewEdge: .left, withInset: 24)
        menuIcon.autoPinEdge(toSuperviewEdge: .right, withInset: 24)
        
        menuText.autoPinEdge(.top, to: .bottom, of: menuIcon, withOffset: 8.0)
        menuText.autoPinEdge(toSuperviewEdge: .left, withInset: 4.0)
        menuText.autoPinEdge(toSuperviewEdge: .bottom, withInset: -4.0)
        menuText.autoPinEdge(toSuperviewEdge: .right, withInset: 4.0)
        
    }
    
}
