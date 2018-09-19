//
//  AccountCell.swift
//  Carsworld
//
//  Created by carsworld Indonesia on 18/09/18.
//  Copyright © 2018 Carsworld Indonesia. All rights reserved.
//

import UIKit
import PureLayout

class AccountCell: BaseCell, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    let cellId = "cellId"
    let yourCarsId = "yourCarsId"
    let socialId = "socialId"
    
    lazy var colView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = UIColor.white
        cv.dataSource = self
        cv.delegate = self
        return cv
    }()
    
    let warnaCarsworld = UIColor.rgb(red: 54, green: 118, blue: 203)
    let otherColor = UIColor.rgb(red: 40, green: 88, blue: 151)
    
    lazy var avatar: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "user"))
        imageView.autoSetDimensions(to: CGSize(width: 128.0, height: 128.0))
        imageView.layer.borderWidth = 3.0
        imageView.layer.borderColor = warnaCarsworld.cgColor
        imageView.layer.cornerRadius = 64.0
        imageView.clipsToBounds = true
        return imageView
    }()

    lazy var upperView: UIView = {
        let view = UIView()
        view.autoSetDimension(.height, toSize: 128)
        view.backgroundColor = warnaCarsworld
        return view
    }()

    lazy var segmentedControl: UISegmentedControl = {
        let control = UISegmentedControl(items: ["Personal", "Your Cars", "Social"])
        control.autoSetDimension(.height, toSize: 32.0)
        control.selectedSegmentIndex = 0
        control.layer.borderColor = warnaCarsworld.cgColor
        control.tintColor = warnaCarsworld
        control.addTarget(self, action: #selector(self.controlChanged), for: .valueChanged)
        return control
    }()

    lazy var editButton: UIButton = {
        let button = UIButton()
        button.setTitle("Edit", for: .normal)
        button.setTitleColor(warnaCarsworld, for: .normal)
        button.layer.cornerRadius = 4.0
        button.layer.borderColor = warnaCarsworld.cgColor
        button.layer.borderWidth = 1.0
        button.tintColor = warnaCarsworld
        button.backgroundColor = .clear
        button.autoSetDimension(.width, toSize: 64.0)
        button.autoSetDimension(.height, toSize: 32.0)
        return button
    }()

    lazy var logoutButton: UIButton = {
        let button = UIButton()
        button.setTitle("Logout", for: .normal)
        button.setTitleColor(warnaCarsworld, for: .normal)
        button.layer.cornerRadius = 4.0
        button.layer.borderColor = warnaCarsworld.cgColor
        button.layer.borderWidth = 1.0
        button.tintColor = warnaCarsworld
        button.backgroundColor = .clear
        button.autoSetDimension(.width, toSize: 96.0)
        button.autoSetDimension(.height, toSize: 32.0)
        return button
    }()

    override func setupViews() {
        
        addSubview(avatar)
        addSubview(upperView)
        addSubview(segmentedControl)
        addSubview(editButton)

        addSubview(logoutButton)

        setupConstraints()

        bringSubview(toFront: avatar)
        
        addSubview(colView)
        colView.register(PersonalCell.self, forCellWithReuseIdentifier: cellId)
        colView.register(YourCarsCell.self, forCellWithReuseIdentifier: yourCarsId)
        colView.register(SocialCell.self, forCellWithReuseIdentifier: socialId)
        
        addConstraintWithFormat(format: "H:|[v0]|", views: colView)
        addConstraintWithFormat(format: "V:|-248-[v0]-45-|", views: colView)
        
        colView.isPagingEnabled = true
        
        let flowLayout = colView.collectionViewLayout as! UICollectionViewFlowLayout
        flowLayout.scrollDirection = .horizontal
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let identifier: String
        if indexPath.item == 1 {
            identifier = yourCarsId
        }
        else if indexPath.item == 2 {
            identifier = socialId
        }
        else {
            identifier = cellId
        }
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: frame.width, height: frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }

    @objc func setupConstraints() {
        avatar.autoAlignAxis(toSuperviewAxis: .vertical)
        avatar.autoPinEdge(toSuperviewEdge: .top, withInset: 64.0)

        upperView.autoPinEdge(toSuperviewEdge: .left)
        upperView.autoPinEdge(toSuperviewEdge: .right)
        upperView.autoPinEdgesToSuperviewEdges(with: .zero, excludingEdge: .bottom)

        segmentedControl.autoPinEdge(toSuperviewEdge: .left, withInset: 8.0)
        segmentedControl.autoPinEdge(toSuperviewEdge: .right, withInset: 8.0)
        segmentedControl.autoPinEdge(.top, to: .bottom, of: avatar, withOffset: 16.0)

        editButton.autoPinEdge(.top, to: .bottom, of: upperView, withOffset: 16.0)
        editButton.autoPinEdge(toSuperviewEdge: .right, withInset: 8.0)

        logoutButton.autoPinEdge(toSuperviewEdge: .left, withInset: 10)
        logoutButton.autoPinEdge(toSuperviewEdge: .right, withInset: 10)
        logoutButton.autoPinEdge(toSuperviewEdge: .bottom, withInset: 10)

    }
    
    @objc func controlChanged() {
        let indexPath = IndexPath(item: segmentedControl.selectedSegmentIndex, section: 0)
        colView.scrollToItem(at: indexPath, at: [], animated: true)
    }
    
}
