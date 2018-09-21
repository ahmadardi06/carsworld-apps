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

class SaldoCell: BaseCell {
    
    lazy var iconTransaction: UIImageView = {
        let img = UIImageView()
        img.autoSetDimension(.height, toSize: 50)
        img.autoSetDimension(.width, toSize: 50)
        img.image = UIImage(named: "user")
        img.layer.cornerRadius = 22
        return img
    }()
    
    lazy var titleLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "Ahmad Ardiansyah"
        lbl.font = UIFont.boldSystemFont(ofSize: 14)
        return lbl
    }()
    
    lazy var descLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "+62 823 3409 3822"
        lbl.font = UIFont.systemFont(ofSize: 11)
        lbl.textColor = UIColor.gray
        return lbl
    }()
    
    lazy var createAtLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "Online"
        lbl.font = UIFont.systemFont(ofSize: 10)
        lbl.textColor = UIColor.rgb(red: 118, green: 213, blue: 114)
        return lbl
    }()
    
    lazy var dividerProfile: UIView = {
        let div = UIView()
        div.autoSetDimension(.height, toSize: 0.5)
        div.backgroundColor = UIColor(white: 0.4, alpha: 0.4)
        return div
    }()
    
    lazy var saldoText: UILabel = {
        let lbl = UILabel()
        lbl.text = "Rp 1.750.000,00"
        lbl.font = UIFont.boldSystemFont(ofSize: 25)
        lbl.layer.cornerRadius = 5
        lbl.layer.borderColor = UIColor(white: 0.4, alpha: 0.4).cgColor
        lbl.layer.borderWidth = 0.5
        lbl.autoSetDimension(.height, toSize: 75)
        lbl.textAlignment = .center
        return lbl
    }()
    
    lazy var topUpButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("Top Up", for: .normal)
        btn.autoSetDimension(.height, toSize: 100)
        btn.autoSetDimension(.width, toSize: 160)
        btn.layer.cornerRadius = 5
        btn.layer.borderColor = UIColor(white: 0.4, alpha: 0.4).cgColor
        btn.layer.borderWidth = 0.5
        btn.backgroundColor = warnaCarsworld
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 25)
        return btn
    }()
    
    lazy var historyButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("History", for: .normal)
        btn.autoSetDimension(.height, toSize: 100)
        btn.autoSetDimension(.width, toSize: 160)
        btn.layer.cornerRadius = 5
        btn.layer.borderColor = UIColor(white: 0.4, alpha: 0.4).cgColor
        btn.layer.borderWidth = 0.5
        btn.backgroundColor = warnaCarsworld
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 25)
        return btn
    }()
    
    override func setupViews() {
        backgroundColor = .white
        
        addSubview(iconTransaction)
        addSubview(titleLabel)
        addSubview(descLabel)
        addSubview(createAtLabel)
        addSubview(dividerProfile)
        addSubview(saldoText)
        
        addSubview(topUpButton)
        addSubview(historyButton)
        
        iconTransaction.autoPinEdge(toSuperviewEdge: .left, withInset: 16.0)
        iconTransaction.autoPinEdge(toSuperviewEdge: .top, withInset: 8.0)
        
        titleLabel.autoPinEdge(.left, to: .right, of: iconTransaction, withOffset: 16.0)
        titleLabel.autoPinEdge(toSuperviewEdge: .top, withInset: 10.0)
        titleLabel.autoPinEdge(toSuperviewEdge: .right, withInset: 8.0)
        
        descLabel.autoPinEdge(.left, to: .right, of: iconTransaction, withOffset: 16.0)
        descLabel.autoPinEdge(.top, to: .bottom, of: titleLabel, withOffset: 1.0)
        descLabel.autoPinEdge(toSuperviewEdge: .right, withInset: 8.0)
        
        createAtLabel.autoPinEdge(.left, to: .right, of: iconTransaction, withOffset: 16.0)
        createAtLabel.autoPinEdge(.top, to: .bottom, of: descLabel, withOffset: 4.0)
        createAtLabel.autoPinEdge(toSuperviewEdge: .right, withInset: 8.0)
        
        dividerProfile.autoPinEdge(toSuperviewEdge: .left, withInset: 8.0)
        dividerProfile.autoPinEdge(toSuperviewEdge: .right, withInset: 8.0)
        dividerProfile.autoPinEdge(.top, to: .bottom, of: createAtLabel, withOffset: 8.0)
        
        saldoText.autoPinEdge(.top, to: .bottom, of: dividerProfile, withOffset: 16.0)
        saldoText.autoPinEdge(toSuperviewEdge: .left, withInset: 16.0)
        saldoText.autoPinEdge(toSuperviewEdge: .right, withInset: 16.0)
        
        topUpButton.autoPinEdge(.top, to: .bottom, of: saldoText, withOffset: 16.0)
        topUpButton.autoPinEdge(toSuperviewEdge: .left, withInset: 16.0)
        
        historyButton.autoPinEdge(.top, to: .bottom, of: saldoText, withOffset: 16.0)
        historyButton.autoPinEdge(toSuperviewEdge: .right, withInset: 16.0)
    }
}

class PointCell: BaseCell, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    let cellId = "cellId"
    
    lazy var colView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .white
        cv.delegate = self
        cv.dataSource = self
        return cv
    }()
    
    lazy var iconTransaction: UIImageView = {
        let img = UIImageView()
        img.autoSetDimension(.height, toSize: 50)
        img.autoSetDimension(.width, toSize: 50)
        img.image = UIImage(named: "user")
        img.layer.cornerRadius = 22
        return img
    }()
    
    lazy var titleLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "Ahmad Ardiansyah"
        lbl.font = UIFont.boldSystemFont(ofSize: 14)
        return lbl
    }()
    
    lazy var descLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "+62 823 3409 3822"
        lbl.font = UIFont.systemFont(ofSize: 11)
        lbl.textColor = UIColor.gray
        return lbl
    }()
    
    lazy var createAtLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "Online"
        lbl.font = UIFont.systemFont(ofSize: 10)
        lbl.textColor = UIColor.rgb(red: 118, green: 213, blue: 114)
        return lbl
    }()
    
    lazy var pointLabel: UILabel = {
        let lbl = UILabel()
        lbl.autoSetDimension(.height, toSize: 50)
        lbl.autoSetDimension(.width, toSize: 100)
        lbl.text = "560 Point"
        lbl.font = UIFont.boldSystemFont(ofSize: 16)
        lbl.textColor = warnaCarsworld
        lbl.layer.borderWidth = 0.5
        lbl.layer.borderColor = UIColor(white: 0.4, alpha: 0.4).cgColor
        lbl.textAlignment = .center
        return lbl
    }()
    
    lazy var dividerProfile: UIView = {
        let div = UIView()
        div.autoSetDimension(.height, toSize: 0.5)
        div.backgroundColor = UIColor(white: 0.4, alpha: 0.4)
        return div
    }()
    
    override func setupViews() {
        backgroundColor = .white
        
        colView.register(ItemPointCell.self, forCellWithReuseIdentifier: cellId)
        
        addSubview(iconTransaction)
        addSubview(titleLabel)
        addSubview(descLabel)
        addSubview(createAtLabel)
        addSubview(pointLabel)
        addSubview(dividerProfile)
        addSubview(colView)
        
        iconTransaction.autoPinEdge(toSuperviewEdge: .left, withInset: 16.0)
        iconTransaction.autoPinEdge(toSuperviewEdge: .top, withInset: 8.0)
        
        titleLabel.autoPinEdge(.left, to: .right, of: iconTransaction, withOffset: 16.0)
        titleLabel.autoPinEdge(toSuperviewEdge: .top, withInset: 10.0)
        titleLabel.autoPinEdge(toSuperviewEdge: .right, withInset: 8.0)
        
        descLabel.autoPinEdge(.left, to: .right, of: iconTransaction, withOffset: 16.0)
        descLabel.autoPinEdge(.top, to: .bottom, of: titleLabel, withOffset: 1.0)
        descLabel.autoPinEdge(toSuperviewEdge: .right, withInset: 8.0)
        
        createAtLabel.autoPinEdge(.left, to: .right, of: iconTransaction, withOffset: 16.0)
        createAtLabel.autoPinEdge(.top, to: .bottom, of: descLabel, withOffset: 4.0)
        createAtLabel.autoPinEdge(toSuperviewEdge: .right, withInset: 8.0)
        
        pointLabel.autoPinEdge(toSuperviewEdge: .right, withInset: 16.0)
        pointLabel.autoPinEdge(toSuperviewEdge: .top, withInset: 8.0)
        
        dividerProfile.autoPinEdge(toSuperviewEdge: .left, withInset: 8.0)
        dividerProfile.autoPinEdge(toSuperviewEdge: .right, withInset: 8.0)
        dividerProfile.autoPinEdge(.top, to: .bottom, of: createAtLabel, withOffset: 8.0)
        
        colView.autoPinEdge(.top, to: .bottom, of: dividerProfile, withOffset: 8.0)
        colView.autoPinEdge(toSuperviewEdge: .left, withInset: 8.0)
        colView.autoPinEdge(toSuperviewEdge: .right, withInset: 8.0)
        colView.autoPinEdge(toSuperviewEdge: .bottom, withInset: 8.0)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! ItemPointCell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: frame.width, height: 160)
    }
    
}

class ItemPointCell: BaseCell {
    
    lazy var iconPromo: UIImageView = {
        let imb = UIImageView()
        imb.autoSetDimension(.height, toSize: 120)
        imb.image = UIImage(named: "promos1")
        imb.layer.cornerRadius = 5
        imb.layer.borderColor = UIColor(white: 0.4, alpha: 0.4).cgColor
        imb.layer.borderWidth = 0.5
        imb.layer.masksToBounds = true
        imb.contentMode = .scaleAspectFill
        return imb
    }()
    
    lazy var titlePromo: UILabel = {
        let lbl = UILabel()
        lbl.text = "Service Potongan Rp 20.000,00"
        lbl.font = UIFont.systemFont(ofSize: 14)
        return lbl
    }()
    
    lazy var pointPromo: UILabel = {
        let lbl = UILabel()
        lbl.text = "200 Point"
        lbl.autoSetDimension(.height, toSize: 24)
        lbl.autoSetDimension(.width, toSize: 80)
        lbl.textAlignment = .center
        lbl.font = UIFont.systemFont(ofSize: 15)
        lbl.textColor = warnaCarsworld
        lbl.layer.borderWidth = 0.5
        lbl.layer.borderColor = UIColor(white: 0.4, alpha: 0.4).cgColor
        return lbl
    }()
    
    lazy var divider: UIView = {
        let iv = UIView()
        iv.backgroundColor = UIColor(white: 0.4, alpha: 0.4)
        iv.autoSetDimension(.height, toSize: 0.5)
        return iv
    }()
    
    override func setupViews() {
        addSubview(iconPromo)
        addSubview(titlePromo)
        addSubview(pointPromo)
        addSubview(divider)
        
        iconPromo.autoPinEdge(toSuperviewEdge: .top, withInset: 8)
        iconPromo.autoPinEdge(toSuperviewEdge: .left, withInset: 24)
        iconPromo.autoPinEdge(toSuperviewEdge: .right, withInset: 24)
        
        titlePromo.autoPinEdge(.top, to: .bottom, of: iconPromo, withOffset: 8)
        titlePromo.autoPinEdge(toSuperviewMargin: .left, withInset: 24)
        
        pointPromo.autoPinEdge(.top, to: .bottom, of: iconPromo, withOffset: 8)
        pointPromo.autoPinEdge(toSuperviewMargin: .right, withInset: 16)
        
        divider.autoPinEdge(.top, to: .bottom, of: pointPromo, withOffset: 8)
        divider.autoPinEdge(toSuperviewMargin: .left, withInset: 8)
        divider.autoPinEdge(toSuperviewMargin: .right, withInset: 8)
        
    }
}
