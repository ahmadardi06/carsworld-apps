//
//  NotifikasiCell.swift
//  Carsworld
//
//  Created by carsworld Indonesia on 20/09/18.
//  Copyright © 2018 Carsworld Indonesia. All rights reserved.
//

import UIKit

class MemberCell: BaseCell {
    
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
        lbl.text = "Ahmad Ardiansyah"
        lbl.font = UIFont.boldSystemFont(ofSize: 16)
        return lbl
    }()
    
    lazy var descLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "+62 823 3409 3822"
        lbl.font = UIFont.systemFont(ofSize: 14)
        lbl.textColor = UIColor.gray
        return lbl
    }()
    
    lazy var createAtLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "Online"
        lbl.font = UIFont.systemFont(ofSize: 11)
        lbl.textColor = UIColor.rgb(red: 118, green: 213, blue: 114)
        return lbl
    }()
    
    lazy var divider: UIView = {
        let div = UIView()
        div.backgroundColor = UIColor(white: 0.4, alpha: 0.4)
        div.autoSetDimension(.height, toSize: 0.5)
        return div
    }()
    
    lazy var imgMember: UIImageView = {
        let img = UIImageView()
        img.autoSetDimension(.height, toSize: 200)
        img.image = UIImage(named: "promos1")
        img.layer.cornerRadius = 10
        img.layer.borderColor = UIColor.rgb(red: 230, green: 230, blue: 230).cgColor
        img.layer.borderWidth = 0.5
        img.layer.masksToBounds = true
        return img
    }()
    
    lazy var masaBerlaku: UILabel = {
        let lbl = UILabel()
        lbl.textColor = UIColor.gray
        lbl.text = "Masa Berlaku"
        lbl.font = UIFont.systemFont(ofSize: 15)
        return lbl
    }()
    
    lazy var masaBerlaku1: UILabel = {
        let lbl = UILabel()
        lbl.text = "30 Desember 2018"
        lbl.font = UIFont.boldSystemFont(ofSize: 15)
        return lbl
    }()
    
    lazy var nomorTelepon: UILabel = {
        let lbl = UILabel()
        lbl.textColor = UIColor.gray
        lbl.text = "Nomor telepon"
        lbl.font = UIFont.systemFont(ofSize: 15)
        return lbl
    }()
    
    lazy var nomorTelepon1: UILabel = {
        let lbl = UILabel()
        lbl.text = "+62 823 3409 3822"
        lbl.font = UIFont.boldSystemFont(ofSize: 15)
        return lbl
    }()
    
    lazy var emailMember: UILabel = {
        let lbl = UILabel()
        lbl.textColor = UIColor.gray
        lbl.text = "Email"
        lbl.font = UIFont.systemFont(ofSize: 15)
        return lbl
    }()
    
    lazy var emailMember1: UILabel = {
        let lbl = UILabel()
        lbl.text = "ahmad.ardiansyah@carsworld.id"
        lbl.font = UIFont.boldSystemFont(ofSize: 15)
        return lbl
    }()
    
    lazy var memberJenis: UILabel = {
        let lbl = UILabel()
        lbl.textColor = UIColor.gray
        lbl.text = "Member"
        lbl.font = UIFont.systemFont(ofSize: 15)
        return lbl
    }()
    
    lazy var memberJenis1: UILabel = {
        let lbl = UILabel()
        lbl.text = "Emergency"
        lbl.font = UIFont.boldSystemFont(ofSize: 15)
        return lbl
    }()
    
    lazy var perpanjangButton: UIButton = {
        let button = UIButton()
        button.setTitle("Perpanjang Member", for: .normal)
        button.setTitleColor(warnaCarsworld, for: .normal)
        button.layer.cornerRadius = 4.0
        button.layer.borderColor = warnaCarsworld.cgColor
        button.layer.borderWidth = 1.0
        button.tintColor = warnaCarsworld
        button.backgroundColor = .clear
        button.autoSetDimension(.height, toSize: 40.0)
        button.addTarget(self, action: #selector(self.handlePerpanjang), for: .touchUpInside)
        return button
    }()
    
    override func setupViews() {
        addSubview(iconTransaction)
        addSubview(titleLabel)
        addSubview(descLabel)
        addSubview(createAtLabel)
        addSubview(divider)
        addSubview(imgMember)
        addSubview(masaBerlaku)
        addSubview(masaBerlaku1)
        addSubview(nomorTelepon)
        addSubview(nomorTelepon1)
        addSubview(emailMember)
        addSubview(emailMember1)
        addSubview(memberJenis)
        addSubview(memberJenis1)
        addSubview(perpanjangButton)
        
        iconTransaction.autoPinEdge(toSuperviewEdge: .left, withInset: 16.0)
        iconTransaction.autoPinEdge(toSuperviewEdge: .top, withInset: 16.0)
        
        titleLabel.autoPinEdge(.left, to: .right, of: iconTransaction, withOffset: 16.0)
        titleLabel.autoPinEdge(toSuperviewEdge: .top, withInset: 24.0)
        titleLabel.autoPinEdge(toSuperviewEdge: .right)
        
        descLabel.autoPinEdge(.left, to: .right, of: iconTransaction, withOffset: 16.0)
        descLabel.autoPinEdge(.top, to: .bottom, of: titleLabel, withOffset: 4.0)
        descLabel.autoPinEdge(toSuperviewEdge: .right)

        createAtLabel.autoPinEdge(.left, to: .right, of: iconTransaction, withOffset: 16.0)
        createAtLabel.autoPinEdge(.top, to: .bottom, of: descLabel, withOffset: 4.0)
        createAtLabel.autoPinEdge(toSuperviewEdge: .right, withInset: 8.0)

        divider.autoPinEdge(.top, to: .bottom, of: createAtLabel, withOffset: 26.0)
        divider.autoPinEdge(toSuperviewEdge: .right, withInset: 16.0)
        divider.autoPinEdge(toSuperviewEdge: .left, withInset: 16.0)
        
        imgMember.autoPinEdge(.top, to: .bottom, of: divider, withOffset: 16.0)
        imgMember.autoPinEdge(toSuperviewEdge: .right, withInset: 16.0)
        imgMember.autoPinEdge(toSuperviewEdge: .left, withInset: 16.0)
        
        masaBerlaku.autoPinEdge(.top, to: .bottom, of: imgMember, withOffset: 24.0)
        masaBerlaku.autoPinEdge(toSuperviewEdge: .left, withInset: 16.0)
        
        masaBerlaku1.autoPinEdge(.top, to: .bottom, of: imgMember, withOffset: 24.0)
        masaBerlaku1.autoPinEdge(toSuperviewEdge: .right, withInset: 24.0)
        
        nomorTelepon.autoPinEdge(.top, to: .bottom, of: masaBerlaku, withOffset: 24.0)
        nomorTelepon.autoPinEdge(toSuperviewEdge: .left, withInset: 16.0)
        
        nomorTelepon1.autoPinEdge(.top, to: .bottom, of: masaBerlaku, withOffset: 24.0)
        nomorTelepon1.autoPinEdge(toSuperviewEdge: .right, withInset: 24.0)
        
        emailMember.autoPinEdge(.top, to: .bottom, of: nomorTelepon, withOffset: 24.0)
        emailMember.autoPinEdge(toSuperviewEdge: .left, withInset: 16.0)
        
        emailMember1.autoPinEdge(.top, to: .bottom, of: nomorTelepon, withOffset: 24.0)
        emailMember1.autoPinEdge(toSuperviewEdge: .right, withInset: 24.0)
        
        memberJenis.autoPinEdge(.top, to: .bottom, of: emailMember, withOffset: 24.0)
        memberJenis.autoPinEdge(toSuperviewEdge: .left, withInset: 16.0)
        
        memberJenis1.autoPinEdge(.top, to: .bottom, of: emailMember, withOffset: 24.0)
        memberJenis1.autoPinEdge(toSuperviewEdge: .right, withInset: 24.0)
        
        perpanjangButton.autoPinEdge(.top, to: .bottom, of:  memberJenis, withOffset: 24.0)
        perpanjangButton.autoPinEdge(toSuperviewEdge: .left, withInset: 16.0)
        perpanjangButton.autoPinEdge(toSuperviewEdge: .right, withInset: 16.0)
        
    }
    
    @objc func handlePerpanjang() {
        print("under construction")
    }
    
}
