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
    let menuHomeId = "menuHomeId"
    
    var homeController: HomeController?
    
    let titleApps = ["All Promo","Top Listing Promotion","News & Tips - Trick","Explore","Holiday"]
    
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
    
    lazy var saldoButton: UIButton = {
        let button = UIButton()
        button.setTitle("Saldo", for: .normal)
        button.setTitleColor(warnaCarsworld, for: .normal)
        button.layer.cornerRadius = 4.0
        button.layer.borderColor = warnaCarsworld.cgColor
        button.layer.borderWidth = 1.0
        button.tintColor = warnaCarsworld
        button.backgroundColor = .clear
        button.autoSetDimension(.width, toSize: 64.0)
        button.autoSetDimension(.height, toSize: 50.0)
        button.addTarget(self, action: #selector(self.handleSaldo), for: .touchUpInside)
        return button
    }()
    
    lazy var pointButton: UIButton = {
        let button = UIButton()
        button.setTitle("Point", for: .normal)
        button.setTitleColor(warnaCarsworld, for: .normal)
        button.layer.cornerRadius = 4.0
        button.layer.borderColor = warnaCarsworld.cgColor
        button.layer.borderWidth = 1.0
        button.tintColor = warnaCarsworld
        button.backgroundColor = .clear
        button.autoSetDimension(.width, toSize: 64.0)
        button.autoSetDimension(.height, toSize: 50.0)
        button.addTarget(self, action: #selector(self.handleSaldo), for: .touchUpInside)
        return button
    }()
    
    lazy var dividerProfile: UIView = {
        let div = UIView()
        div.autoSetDimension(.height, toSize: 0.5)
        div.backgroundColor = UIColor(white: 0.4, alpha: 0.4)
        return div
    }()
    
    lazy var colView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .white
        cv.dataSource = self
        cv.delegate = self
        return cv
    }()
    
    override func setupViews() {
        super.setupViews()
        
        colView.register(HomeCell.self, forCellWithReuseIdentifier: cellId)
        colView.register(MenuHomeCell.self, forCellWithReuseIdentifier: menuHomeId)
        colView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(iconTransaction)
        addSubview(titleLabel)
        addSubview(descLabel)
        addSubview(createAtLabel)
        addSubview(dividerProfile)
        addSubview(pointButton)
        addSubview(saldoButton)
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
        
        pointButton.autoPinEdge(toSuperviewEdge: .top, withInset: 8.0)
        pointButton.autoPinEdge(toSuperviewEdge: .right, withInset: 8.0)
        
        saldoButton.autoPinEdge(toSuperviewEdge: .top, withInset: 8.0)
        saldoButton.autoPinEdge(.right, to: .left, of: pointButton, withOffset: -8.0)
        
        dividerProfile.autoPinEdge(toSuperviewEdge: .left, withInset: 8.0)
        dividerProfile.autoPinEdge(toSuperviewEdge: .right, withInset: 8.0)
        dividerProfile.autoPinEdge(.top, to: .bottom, of: createAtLabel, withOffset: 8.0)
        
        addConstraintWithFormat(format: "H:|[v0]|", views: colView)
        addConstraintWithFormat(format: "V:|-70-[v0]|", views: colView)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        if indexPath.item == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: menuHomeId, for: indexPath) as! MenuHomeCell
            cell.homeController = homeController
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! HomeCell
            cell.titleApps.text = titleApps[indexPath.item]
            cell.homeController = homeController

            return cell
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if indexPath.item == 0 {
            return CGSize(width: frame.width, height: 210)
        } else  {
            return CGSize(width: frame.width, height: 170)
        }
        
    }
    
    @objc func handleSaldo() {
        print("under construction")
        
    }
    
    @objc func handlePoint() {
        print("under construction")
    }
    
    
}
