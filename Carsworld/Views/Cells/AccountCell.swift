//
//  AccountCell.swift
//  Carsworld
//
//  Created by carsworld Indonesia on 18/09/18.
//  Copyright © 2018 Carsworld Indonesia. All rights reserved.
//

import UIKit
import PureLayout

class AccountCell: BaseCell {
    
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
        button.autoSetDimension(.width, toSize: 96.0)
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
    
    lazy var nameLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "Ahmad Ardiansyah"
        lbl.font = UIFont.systemFont(ofSize: 14)
        return lbl
    }()
    
    override func setupViews() {
        addSubview(avatar)
        addSubview(upperView)
        addSubview(segmentedControl)
        addSubview(editButton)
        addSubview(nameLabel)
        addSubview(logoutButton)
        
        setupConstraints()
        
        bringSubview(toFront: avatar)
        
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
        
        nameLabel.autoPinEdge(toSuperviewEdge: .left, withInset: 10.0)
        nameLabel.autoPinEdge(toSuperviewEdge: .right, withInset: 10.0)
        nameLabel.autoPinEdge(.top, to: .bottom, of: segmentedControl, withOffset: 16.0)
        
        logoutButton.autoPinEdge(toSuperviewEdge: .left, withInset: 10)
        logoutButton.autoPinEdge(toSuperviewEdge: .right, withInset: 10)
        logoutButton.autoPinEdge(toSuperviewEdge: .bottom, withInset: 10)
        
    }
    
    @objc func controlChanged() {
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            print("you click personal")
        case 1:
            print("you click your cars")
        case 2:
            print("you click social")
        default:
            print("you did not selected")
        }
    }
    
}


//import UIKit
//
//class AccountCell: BaseCell {
//
//    let profileImage: UIImageView = {
//        let img = UIImageView()
////        img.image = UIImage(named: "user")
//        img.backgroundColor = .blue
//        img.layer.cornerRadius = 22
//        return img
//    }()
//
//    let nameLabel: UILabel = {
//        let lbl = UILabel()
//        lbl.text = "Ahmad Ardiansyah"
//        lbl.font = UIFont.boldSystemFont(ofSize: 20)
////        lbl.backgroundColor = .blue
//        return lbl
//    }()
//
//    let emailLabel: UILabel = {
//        let lbl = UILabel()
////        lbl.text = "ahmad.ardiansyah@carsworld.id"
//        lbl.backgroundColor = .red
//        lbl.font = UIFont.systemFont(ofSize: 14)
//        lbl.textColor = UIColor.rgb(red: 230, green: 230, blue: 230)
//        return lbl
//    }()
//
//    override func setupViews() {
//
//        addSubview(profileImage)
//        addSubview(nameLabel)
//        addSubview(emailLabel)
//
//        addConstraintWithFormat(format: "H:|-16-[v0(100)]-12-[v1]-12-|", views: profileImage, nameLabel)
//        addConstraintWithFormat(format: "V:|-16-[v0(100)]|", views: profileImage)
//        addConstraintWithFormat(format: "V:|-24-[v0(32)]|", views: nameLabel)
//
//        addConstraint(NSLayoutConstraint(item: emailLabel, attribute: .top, relatedBy: .equal, toItem: nameLabel, attribute: .bottom, multiplier: 1, constant: 8))
//        addConstraint(NSLayoutConstraint(item: emailLabel, attribute: .left, relatedBy: .equal, toItem: profileImage, attribute: .right, multiplier: 1, constant: 8))
//        addConstraint(NSLayoutConstraint(item: emailLabel, attribute: .right, relatedBy: .equal, toItem: self, attribute: .right, multiplier: 1, constant: 0))
//        addConstraint(NSLayoutConstraint(item: emailLabel, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 0, constant: 30))
//
//    }
//}
