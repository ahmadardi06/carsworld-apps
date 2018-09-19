//
//  ProfileCell.swift
//  Carsworld
//
//  Created by carsworld Indonesia on 19/09/18.
//  Copyright © 2018 Carsworld Indonesia. All rights reserved.
//

import UIKit

let warnaCarsworld = UIColor.rgb(red: 54, green: 118, blue: 203)

class PersonalCell: BaseCell {
    
    lazy var nameLbl: UILabel = {
        let lbl = UILabel()
        lbl.text = "Nama Lengkap"
        lbl.textColor = warnaCarsworld
        lbl.font = UIFont.boldSystemFont(ofSize: 15)
        return lbl
    }()
    
    lazy var nameLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "Ahmad Ardiansyah"
        lbl.font = UIFont.systemFont(ofSize: 15)
        return lbl
    }()
    
    lazy var nomorLbl: UILabel = {
        let lbl = UILabel()
        lbl.text = "Nomor Handphone"
        lbl.textColor = warnaCarsworld
        lbl.font = UIFont.boldSystemFont(ofSize: 15)
        return lbl
    }()
    
    lazy var nomorLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "+62 823 3409 3822"
        lbl.font = UIFont.systemFont(ofSize: 15)
        return lbl
    }()
    
    lazy var emailLbl: UILabel = {
        let lbl = UILabel()
        lbl.text = "Email"
        lbl.textColor = warnaCarsworld
        lbl.font = UIFont.boldSystemFont(ofSize: 15)
        return lbl
    }()
    lazy var emailLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "ahmad.ardiansyah@carsworld.id"
        lbl.font = UIFont.systemFont(ofSize: 15)
        return lbl
    }()
    
    lazy var alamatLbl: UILabel = {
        let lbl = UILabel()
        lbl.text = "Alamat"
        lbl.textColor = warnaCarsworld
        lbl.font = UIFont.boldSystemFont(ofSize: 15)
        return lbl
    }()
    
    let alamatLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.font = UIFont.systemFont(ofSize: 15)
        label.text = "Jl. Dusun Ketewel Timur RT/07 RW/06 Desa Sememu Kec. Pasirian Kab. Lumajang"
        return label
    }()
    
    override func setupViews() {
        
        addSubview(nameLbl)
        addSubview(nameLabel)
        addSubview(nomorLbl)
        addSubview(nomorLabel)
        addSubview(emailLbl)
        addSubview(emailLabel)
        addSubview(alamatLbl)
        addSubview(alamatLabel)
        
        nameLbl.autoPinEdge(toSuperviewEdge: .left, withInset: 10.0)
        nameLbl.autoPinEdge(toSuperviewEdge: .right, withInset: 10.0)
        nameLbl.autoPinEdge(toSuperviewEdge: .top, withInset: 150.0)
        
        nameLabel.autoPinEdge(toSuperviewEdge: .left, withInset: 15.0)
        nameLabel.autoPinEdge(toSuperviewEdge: .right, withInset: 15.0)
        nameLabel.autoPinEdge(.top, to: .bottom, of: nameLbl, withOffset: 8.0)
        
        nomorLbl.autoPinEdge(toSuperviewEdge: .left, withInset: 10.0)
        nomorLbl.autoPinEdge(toSuperviewEdge: .right, withInset: 10.0)
        nomorLbl.autoPinEdge(.top, to: .bottom, of: nameLabel, withOffset: 12.0)
        
        nomorLabel.autoPinEdge(toSuperviewEdge: .left, withInset: 15.0)
        nomorLabel.autoPinEdge(toSuperviewEdge: .right, withInset: 15.0)
        nomorLabel.autoPinEdge(.top, to: .bottom, of: nomorLbl, withOffset: 8.0)
        
        emailLbl.autoPinEdge(toSuperviewEdge: .left, withInset: 10.0)
        emailLbl.autoPinEdge(toSuperviewEdge: .right, withInset: 10.0)
        emailLbl.autoPinEdge(.top, to: .bottom, of: nomorLabel, withOffset: 12.0)
        
        emailLabel.autoPinEdge(toSuperviewEdge: .left, withInset: 15.0)
        emailLabel.autoPinEdge(toSuperviewEdge: .right, withInset: 15.0)
        emailLabel.autoPinEdge(.top, to: .bottom, of: emailLbl, withOffset: 8.0)
        
        alamatLbl.autoPinEdge(toSuperviewEdge: .left, withInset: 10.0)
        alamatLbl.autoPinEdge(toSuperviewEdge: .right, withInset: 10.0)
        alamatLbl.autoPinEdge(.top, to: .bottom, of: emailLabel, withOffset: 12.0)
        
        alamatLabel.autoPinEdge(toSuperviewEdge: .left, withInset: 15.0)
        alamatLabel.autoPinEdge(toSuperviewEdge: .right, withInset: 15.0)
        alamatLabel.autoPinEdge(.top, to: .bottom, of: alamatLbl, withOffset: 8.0)
        
    }
}

class CarsCell: BaseCell {
    
    lazy var imgCar: UIImageView = {
        let img = UIImageView()
        img.autoSetDimension(.height, toSize: 168.0)
        img.image = UIImage(named: "cars")
        img.layer.cornerRadius = 5
        img.contentMode = .scaleAspectFill
        img.layer.masksToBounds = true
        return img
    }()
    
    lazy var nameCar: UILabel = {
        let lbl = UILabel()
        lbl.text = "Toyota All New Rush"
        lbl.font = UIFont.boldSystemFont(ofSize: 15)
        return lbl
    }()
    
    lazy var yearCar: UILabel = {
        let lbl = UILabel()
        lbl.text = "2018"
        lbl.textColor = UIColor.darkGray
        lbl.font = UIFont.systemFont(ofSize: 14)
        return lbl
    }()
    
    override func setupViews() {
        addSubview(imgCar)
        addSubview(nameCar)
        addSubview(yearCar)
        
        imgCar.autoPinEdge(toSuperviewEdge: .left, withInset: 10.0)
        imgCar.autoPinEdge(toSuperviewEdge: .right, withInset: 10.0)
        imgCar.autoPinEdgesToSuperviewEdges(with: .zero, excludingEdge: .bottom)
        
        nameCar.autoPinEdge(toSuperviewEdge: .left, withInset: 16.0)
        nameCar.autoPinEdge(toSuperviewEdge: .right, withInset: 16.0)
        nameCar.autoPinEdge(.top, to: .bottom, of: imgCar, withOffset: 8.0)
        
        yearCar.autoPinEdge(toSuperviewEdge: .left, withInset: 16.0)
        yearCar.autoPinEdge(toSuperviewEdge: .right, withInset: 16.0)
        yearCar.autoPinEdge(.top, to: .bottom, of: nameCar, withOffset: 8.0)
    }

}

class YourCarsCell: BaseCell, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    let cellId = "cellId"
    
    lazy var colView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .white
        cv.dataSource = self
        cv.delegate = self
        return cv
    }()
    
    override func setupViews() {
        
        addSubview(colView)
        colView.register(CarsCell.self, forCellWithReuseIdentifier: cellId)
//        addConstraintWithFormat(format: "H:|[v0]|", views: colView)
//        addConstraintWithFormat(format: "V:|[v0]|", views: colView)
        colView.autoPinEdge(toSuperviewEdge: .left, withInset: 16.0)
        colView.autoPinEdge(toSuperviewEdge: .right, withInset: 16.0)
        colView.autoPinEdge(toSuperviewEdge: .bottom, withInset: 150)
        colView.autoPinEdge(toSuperviewEdge: .top, withInset: 150)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: frame.width, height: 224)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
}

class SocialCell: BaseCell {
    
    lazy var instaLbl: UILabel = {
        let lbl = UILabel()
        lbl.text = "Instagram"
        lbl.textColor = warnaCarsworld
        lbl.font = UIFont.boldSystemFont(ofSize: 15)
        return lbl
    }()
    
    lazy var instaLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "@ardi.pc"
        lbl.font = UIFont.systemFont(ofSize: 15)
        return lbl
    }()
    
    lazy var twitLbl: UILabel = {
        let lbl = UILabel()
        lbl.text = "Twitter"
        lbl.textColor = warnaCarsworld
        lbl.font = UIFont.boldSystemFont(ofSize: 15)
        return lbl
    }()
    
    lazy var twitLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "@ardi.pc"
        lbl.font = UIFont.systemFont(ofSize: 15)
        return lbl
    }()
    
    lazy var fbLbl: UILabel = {
        let lbl = UILabel()
        lbl.text = "Facebook"
        lbl.textColor = warnaCarsworld
        lbl.font = UIFont.boldSystemFont(ofSize: 15)
        return lbl
    }()
    
    lazy var fbLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "@ardi.pc"
        lbl.font = UIFont.systemFont(ofSize: 15)
        return lbl
    }()
    
    override func setupViews() {
        addSubview(instaLbl)
        addSubview(instaLabel)
        
        addSubview(twitLbl)
        addSubview(twitLabel)
        
        addSubview(fbLbl)
        addSubview(fbLabel)
        
        instaLbl.autoPinEdge(toSuperviewEdge: .left, withInset: 20)
        instaLbl.autoPinEdge(toSuperviewEdge: .right, withInset: 20)
        instaLbl.autoPinEdge(toSuperviewEdge: .top, withInset: 150)
        
        instaLabel.autoPinEdge(toSuperviewEdge: .left, withInset: 25.0)
        instaLabel.autoPinEdge(toSuperviewEdge: .right, withInset: 25.0)
        instaLabel.autoPinEdge(.top, to: .bottom, of: instaLbl, withOffset: 8.0)
        
        twitLbl.autoPinEdge(toSuperviewEdge: .left, withInset: 20.0)
        twitLbl.autoPinEdge(toSuperviewEdge: .right, withInset: 20.0)
        twitLbl.autoPinEdge(.top, to: .bottom, of: instaLabel, withOffset: 8.0)
        
        twitLabel.autoPinEdge(toSuperviewEdge: .left, withInset: 25.0)
        twitLabel.autoPinEdge(toSuperviewEdge: .right, withInset: 25.0)
        twitLabel.autoPinEdge(.top, to: .bottom, of: twitLbl, withOffset: 8.0)
        
        fbLbl.autoPinEdge(toSuperviewEdge: .left, withInset: 20.0)
        fbLbl.autoPinEdge(toSuperviewEdge: .right, withInset: 20.0)
        fbLbl.autoPinEdge(.top, to: .bottom, of: twitLabel, withOffset: 8.0)
        
        fbLabel.autoPinEdge(toSuperviewEdge: .left, withInset: 25.0)
        fbLabel.autoPinEdge(toSuperviewEdge: .right, withInset: 25.0)
        fbLabel.autoPinEdge(.top, to: .bottom, of: fbLbl, withOffset: 8.0)
    }
}
