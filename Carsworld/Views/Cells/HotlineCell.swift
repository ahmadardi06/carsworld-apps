 //
 //  VideoCell.swift
 //  YoutubeApplication
 //
 //  Created by carsworld Indonesia on 13/09/18.
 //  Copyright © 2018 Carsworld Indonesia. All rights reserved.
 //
 
 import UIKit
 
 class HotlineCell: BaseCell {
    
    var iconImage: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "hotline")
        img.contentMode = .scaleAspectFit
        return img
    }()
    
    var textLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "Chat"
        lbl.textAlignment = .center
        lbl.font = UIFont.systemFont(ofSize: 15)
        return lbl
    }()
    
    override func setupViews() {
        addSubview(iconImage)
        addSubview(textLabel)
        
        addConstraintWithFormat(format: "H:|-38-[v0(56)]-16-|", views: iconImage)
        addConstraintWithFormat(format: "H:|-16-[v0]-16-|", views: textLabel)
        addConstraintWithFormat(format: "V:|-24-[v0(56)]-8-[v1(20)]", views: iconImage, textLabel)
    }
    
 }
 
 class HeaderHotlineCell: BaseCell {
    
    var titleLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "Selamat Datang,"
        lbl.font = UIFont.boldSystemFont(ofSize: 14)
        return lbl
    }()
    
    var textLabel: UITextView = {
        let lbl = UITextView()
        lbl.text = "Di menu kami, Anda dapat memberikan kami kritik dan saran untuk menjadikan kami yang lebih baik."
        return lbl
    }()
    
    override func setupViews() {
        addSubview(titleLabel)
        addSubview(textLabel)
        
        addConstraintWithFormat(format: "H:|-16-[v0]-16-|", views: titleLabel)
        addConstraintWithFormat(format: "H:|-16-[v0]-16-|", views: textLabel)
        
        addConstraintWithFormat(format: "V:|-16-[v0]-[v1]|", views: titleLabel, textLabel)
    }
 }
