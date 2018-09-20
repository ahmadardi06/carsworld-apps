//
//  NotifikasiCell.swift
//  Carsworld
//
//  Created by carsworld Indonesia on 20/09/18.
//  Copyright © 2018 Carsworld Indonesia. All rights reserved.
//

import UIKit

class NotifikasiCell: BaseCell {
    
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
        lbl.text = "General Service"
        lbl.font = UIFont.boldSystemFont(ofSize: 16)
        return lbl
    }()
    
    lazy var descLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "Mobil Toyota Avanza - Body Repair"
        lbl.font = UIFont.boldSystemFont(ofSize: 14)
        return lbl
    }()
    
    lazy var createAtLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "20 Januari 2018 - 17.24 WIB"
        lbl.font = UIFont.systemFont(ofSize: 13)
        return lbl
    }()
    
    lazy var divider: UIView = {
        let div = UIView()
        div.backgroundColor = UIColor(white: 0.4, alpha: 0.4)
        div.autoSetDimension(.height, toSize: 0.5)
        return div
    }()
    
    override func setupViews() {
        addSubview(iconTransaction)
        addSubview(titleLabel)
        addSubview(descLabel)
        addSubview(createAtLabel)
        addSubview(divider)
        
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
        
        divider.autoPinEdge(.top, to: .bottom, of: createAtLabel, withOffset: 8.0)
        divider.autoPinEdge(toSuperviewEdge: .right, withInset: 8.0)
        divider.autoPinEdge(toSuperviewEdge: .left, withInset: 80.0)
        
        
    }
    
}
