//
//  TransactionCell.swift
//  Carsworld
//
//  Created by carsworld Indonesia on 19/09/18.
//  Copyright © 2018 Carsworld Indonesia. All rights reserved.
//

import UIKit

class TransactionCell: BaseCell {
    
    lazy var iconTransaction: UIImageView = {
        let img = UIImageView()
        img.autoSetDimension(.height, toSize: 75)
        img.autoSetDimension(.width, toSize: 75)
        img.image = UIImage(named: "user")
        img.layer.cornerRadius = 22
        return img
    }()
    
    lazy var titleLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "New Car"
        lbl.font = UIFont.boldSystemFont(ofSize: 16)
        return lbl
    }()
    
    lazy var descLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "Proses Pembelian unit Toyota Avanza 2015"
        lbl.font = UIFont.boldSystemFont(ofSize: 14)
        return lbl
    }()
    
    lazy var createAtLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "20 Januari 2018 - 17.24 WIB"
        lbl.font = UIFont.systemFont(ofSize: 13)
        return lbl
    }()
    
    override func setupViews() {
        addSubview(iconTransaction)
        addSubview(titleLabel)
        addSubview(descLabel)
        addSubview(createAtLabel)
        
        iconTransaction.autoPinEdge(toSuperviewEdge: .left, withInset: 8.0)
        iconTransaction.autoPinEdge(toSuperviewEdge: .top, withInset: 8.0)
        
        titleLabel.autoPinEdge(.left, to: .right, of: iconTransaction, withOffset: 8.0)
        titleLabel.autoPinEdge(toSuperviewEdge: .top, withInset: 10.0)
        titleLabel.autoPinEdge(toSuperviewEdge: .right, withInset: 8.0)
        
        descLabel.autoPinEdge(.left, to: .right, of: iconTransaction, withOffset: 8.0)
        descLabel.autoPinEdge(.top, to: .bottom, of: titleLabel, withOffset: 8.0)
        descLabel.autoPinEdge(toSuperviewEdge: .right, withInset: 8.0)
        
        createAtLabel.autoPinEdge(.left, to: .right, of: iconTransaction, withOffset: 8.0)
        createAtLabel.autoPinEdge(.top, to: .bottom, of: descLabel, withOffset: 8.0)
        createAtLabel.autoPinEdge(toSuperviewEdge: .right, withInset: 8.0)
        
    }
}

class ServiceCell: BaseCell, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    let cellId = "cellId"
    
    lazy var colView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .white
        cv.dataSource = self
        cv.delegate = self
        return cv
    }()
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath)
        cell.layer.borderWidth = 0.2
        cell.layer.borderColor = UIColor.gray.cgColor
        return cell
    }
    
    override func setupViews() {
        backgroundColor = .green
        
        addSubview(colView)
        colView.register(TransactionCell.self, forCellWithReuseIdentifier: cellId)
        
        colView.autoSetDimensions(to: CGSize(width: frame.width, height: frame.height))
        colView.autoPinEdge(toSuperviewEdge: .top, withInset: 28.0)
        colView.autoPinEdge(toSuperviewEdge: .left)
        colView.autoPinEdge(toSuperviewEdge: .right)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: frame.width, height: 100)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
}

class UsedCarsCell: BaseCell, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    let cellId = "cellId"
    
    lazy var colView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .white
        cv.dataSource = self
        cv.delegate = self
        return cv
    }()
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath)
        cell.layer.borderWidth = 0.2
        cell.layer.borderColor = UIColor.gray.cgColor
        return cell
    }
    
    override func setupViews() {
        backgroundColor = .green
        
        addSubview(colView)
        colView.register(TransactionCell.self, forCellWithReuseIdentifier: cellId)
        
        colView.autoSetDimensions(to: CGSize(width: frame.width, height: frame.height))
        colView.autoPinEdge(toSuperviewEdge: .top, withInset: 28.0)
        colView.autoPinEdge(toSuperviewEdge: .left)
        colView.autoPinEdge(toSuperviewEdge: .right)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: frame.width, height: 100)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}

class NewCarsCell: BaseCell, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    let cellId = "cellId"
    
    lazy var colView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .white
        cv.dataSource = self
        cv.delegate = self
        return cv
    }()
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath)
        cell.layer.borderWidth = 0.2
        cell.layer.borderColor = UIColor.gray.cgColor
        return cell
    }
    
    override func setupViews() {
        backgroundColor = .green
        
        addSubview(colView)
        colView.register(TransactionCell.self, forCellWithReuseIdentifier: cellId)
        
        colView.autoSetDimensions(to: CGSize(width: frame.width, height: frame.height))
        colView.autoPinEdge(toSuperviewEdge: .top, withInset: 28.0)
        colView.autoPinEdge(toSuperviewEdge: .left)
        colView.autoPinEdge(toSuperviewEdge: .right)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: frame.width, height: 100)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}

class ShopCell: BaseCell, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    let cellId = "cellId"
    
    lazy var colView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .white
        cv.dataSource = self
        cv.delegate = self
        return cv
    }()
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath)
        cell.layer.borderWidth = 0.2
        cell.layer.borderColor = UIColor.gray.cgColor
        return cell
    }
    
    override func setupViews() {
        backgroundColor = .green
        
        addSubview(colView)
        colView.register(TransactionCell.self, forCellWithReuseIdentifier: cellId)
        
        colView.autoSetDimensions(to: CGSize(width: frame.width, height: frame.height))
        colView.autoPinEdge(toSuperviewEdge: .top, withInset: 28.0)
        colView.autoPinEdge(toSuperviewEdge: .left)
        colView.autoPinEdge(toSuperviewEdge: .right)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: frame.width, height: 100)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}

class RentalCell: BaseCell, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    let cellId = "cellId"
    
    lazy var colView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .white
        cv.dataSource = self
        cv.delegate = self
        return cv
    }()
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath)
        cell.layer.borderWidth = 0.2
        cell.layer.borderColor = UIColor.gray.cgColor
        return cell
    }
    
    override func setupViews() {
        backgroundColor = .green
        
        addSubview(colView)
        colView.register(TransactionCell.self, forCellWithReuseIdentifier: cellId)
        
        colView.autoSetDimensions(to: CGSize(width: frame.width, height: frame.height))
        colView.autoPinEdge(toSuperviewEdge: .top, withInset: 28.0)
        colView.autoPinEdge(toSuperviewEdge: .left)
        colView.autoPinEdge(toSuperviewEdge: .right)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: frame.width, height: 100)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
