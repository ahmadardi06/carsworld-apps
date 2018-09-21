 //
 //  VideoCell.swift
 //  YoutubeApplication
 //
 //  Created by carsworld Indonesia on 13/09/18.
 //  Copyright © 2018 Carsworld Indonesia. All rights reserved.
 //
 
 import UIKit
 
 class HotlineCell: BaseCell {
    
    var homeController: HomeController?
    
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
 
 class ChatWithCell: BaseCell {
    
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
        lbl.text = "Customer Service to Us"
        lbl.font = UIFont.systemFont(ofSize: 14)
        return lbl
    }()
    
    lazy var createAtLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "Online"
        lbl.textColor = UIColor.rgb(red: 118, green: 213, blue: 114)
        lbl.font = UIFont.systemFont(ofSize: 13)
        return lbl
    }()
    
    lazy var divider: UIView = {
        let div = UIView()
        div.autoSetDimension(.height, toSize: 0.5)
        div.backgroundColor = UIColor(white: 0.4, alpha: 0.4)
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
        titleLabel.autoPinEdge(toSuperviewEdge: .top, withInset: 14.0)
        titleLabel.autoPinEdge(toSuperviewEdge: .right, withInset: 8.0)
        
        descLabel.autoPinEdge(.left, to: .right, of: iconTransaction, withOffset: 8.0)
        descLabel.autoPinEdge(.top, to: .bottom, of: titleLabel, withOffset: 4.0)
        descLabel.autoPinEdge(toSuperviewEdge: .right, withInset: 8.0)
        
        createAtLabel.autoPinEdge(.left, to: .right, of: iconTransaction, withOffset: 8.0)
        createAtLabel.autoPinEdge(.top, to: .bottom, of: descLabel, withOffset: 4.0)
        createAtLabel.autoPinEdge(toSuperviewEdge: .right, withInset: 8.0)
        
        divider.autoPinEdge(toSuperviewEdge: .left, withInset: 8.0)
        divider.autoPinEdge(toSuperviewEdge: .right, withInset: 8.0)
        divider.autoPinEdge(.top, to: .bottom, of: createAtLabel, withOffset: 16.0)
    }
    
 }
 
 class SaranCell: BaseCell, UIPickerViewDataSource, UIPickerViewDelegate {
    
    let problems = ["-select-","Finance","Service","New Cars","Nasmoco"]
    
    lazy var bgView: UIView = {
        let vw = UIView()
        vw.autoSetDimension(.height, toSize: 150)
        vw.backgroundColor = warnaCarsworld
        return vw
    }()
    
    lazy var carsWorldImg: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "carsworld")
        img.layer.masksToBounds = true
        img.contentMode = .scaleAspectFit
        img.autoSetDimension(.height, toSize: 150)
        return img
    }()
    
    lazy var tentangText: UILabel = {
        let lbl = UILabel()
        lbl.text = "Saran Tentang"
        lbl.font = UIFont.systemFont(ofSize: 12)
        return lbl
    }()
    
    lazy var perihalField: UITextField = {
        let pick = UIPickerView()
        pick.delegate = self
        pick.dataSource = self

        let field = UITextField()
        field.autoSetDimension(.width, toSize: 240)
        field.font = UIFont.systemFont(ofSize: 14)
        field.borderStyle = .roundedRect
        field.autocorrectionType = .no
        field.keyboardType = .default
        field.returnKeyType = .done
        field.clearButtonMode = .whileEditing
        field.contentVerticalAlignment = .center
        
        field.inputView = pick
        field.placeholder = problems[0]

        return field
    }()
    
    lazy var descField: UITextView = {
        let field = UITextView()
        field.autoSetDimension(.height, toSize: 150)
        field.layer.cornerRadius = 5
        field.layer.borderColor = UIColor(white: 0.4, alpha: 0.4).cgColor
        field.layer.borderWidth = 0.5
        return field
    }()
    
    lazy var submitButton: UIButton = {
        let btn = UIButton()
        btn.autoSetDimension(.height, toSize: 35)
        btn.layer.cornerRadius = 5
        btn.layer.borderColor = UIColor(white: 0.4, alpha: 0.4).cgColor
        btn.layer.borderWidth = 0.5
        btn.setTitle("Kirim Saran Anda", for: .normal)
        btn.backgroundColor = warnaCarsworld
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 13)
        return btn
    }()
    
    override func setupViews() {
       
        addSubview(bgView)
        addSubview(carsWorldImg)
        addSubview(tentangText)
        addSubview(perihalField)
        addSubview(descField)
        addSubview(submitButton)
        
        bgView.autoPinEdge(toSuperviewEdge: .top)
        bgView.autoPinEdge(toSuperviewEdge: .left)
        bgView.autoPinEdge(toSuperviewEdge: .right)
        
        carsWorldImg.autoPinEdge(toSuperviewEdge: .top)
        carsWorldImg.autoPinEdge(toSuperviewEdge: .left, withInset: 16.0)
        carsWorldImg.autoPinEdge(toSuperviewEdge: .right, withInset: 16.0)

        tentangText.autoPinEdge(.top, to: .bottom, of: carsWorldImg, withOffset: 13.0)
        tentangText.autoPinEdge(toSuperviewEdge: .left, withInset: 12.0)

        perihalField.autoPinEdge(.top, to: .bottom, of: carsWorldImg, withOffset: 8.0)
        perihalField.autoPinEdge(toSuperviewEdge: .right, withInset: 8.0)
        
        descField.autoPinEdge(.top, to: .bottom, of: perihalField, withOffset: 8.0)
        descField.autoPinEdge(toSuperviewEdge: .left, withInset: 8.0)
        descField.autoPinEdge(toSuperviewEdge: .right, withInset: 8.0)
        
        submitButton.autoPinEdge(.top, to: .bottom, of: descField, withOffset: 8.0)
        submitButton.autoPinEdge(toSuperviewEdge: .left, withInset: 8.0)
        submitButton.autoPinEdge(toSuperviewEdge: .right, withInset: 8.0)
        
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return problems.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return problems[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        perihalField.text = problems[row]
    }
    
 }

 class FaqCell: BaseCell, UIPickerViewDataSource, UIPickerViewDelegate {
    
    let ketentuans = ["-ketentuan pengguna-","Ketentuan 1","Ketentuan 2","Ketentuan 3"]
    let syaratas = ["-syarat dan ketentuan-","Syarat 1","Syarat 2","Syarat 3"]
    
    lazy var bgView: UIView = {
        let vw = UIView()
        vw.autoSetDimension(.height, toSize: 150)
        vw.backgroundColor = warnaCarsworld
        return vw
    }()
    
    lazy var carsWorldImg: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "carsworld")
        img.layer.masksToBounds = true
        img.contentMode = .scaleAspectFit
        img.autoSetDimension(.height, toSize: 150)
        return img
    }()
    
    lazy var ketentuanField: UITextField = {
        let pick = UIPickerView()
        pick.delegate = self
        pick.dataSource = self
        pick.tag = 0
        
        let field = UITextField()
        field.inputView = pick
        field.placeholder = ketentuans[0]
        
        field.font = UIFont.systemFont(ofSize: 14)
        field.borderStyle = .roundedRect
        field.autocorrectionType = .no
        field.keyboardType = .default
        field.returnKeyType = .done
        field.clearButtonMode = .whileEditing
        field.contentVerticalAlignment = .center
        
        return field
    }()
    
    lazy var syaratField: UITextField = {
        let pick = UIPickerView()
        pick.delegate = self
        pick.dataSource = self
        pick.tag = 1
        
        let field = UITextField()
        field.inputView = pick
        field.placeholder = syaratas[0]
        
        field.font = UIFont.systemFont(ofSize: 14)
        field.borderStyle = .roundedRect
        field.autocorrectionType = .no
        field.keyboardType = .default
        field.returnKeyType = .done
        field.clearButtonMode = .whileEditing
        field.contentVerticalAlignment = .center
        
        return field
    }()
    
    lazy var submitButton: UIButton = {
        let btn = UIButton()
        btn.autoSetDimension(.height, toSize: 35)
        btn.layer.cornerRadius = 5
        btn.layer.borderColor = UIColor(white: 0.4, alpha: 0.4).cgColor
        btn.layer.borderWidth = 0.5
        btn.setTitle("Submit", for: .normal)
        btn.backgroundColor = warnaCarsworld
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 13)
        return btn
    }()
    
    override func setupViews() {
        
        addSubview(bgView)
        addSubview(carsWorldImg)
        addSubview(ketentuanField)
        addSubview(syaratField)
        addSubview(submitButton)
        
        bgView.autoPinEdge(toSuperviewEdge: .top)
        bgView.autoPinEdge(toSuperviewEdge: .left)
        bgView.autoPinEdge(toSuperviewEdge: .right)
        
        carsWorldImg.autoPinEdge(toSuperviewEdge: .top)
        carsWorldImg.autoPinEdge(toSuperviewEdge: .left, withInset: 16.0)
        carsWorldImg.autoPinEdge(toSuperviewEdge: .right, withInset: 16.0)
        
        ketentuanField.autoPinEdge(toSuperviewEdge: .left, withInset: 12.0)
        ketentuanField.autoPinEdge(toSuperviewEdge: .right, withInset: 12.0)
        ketentuanField.autoPinEdge(.top, to: .bottom, of: carsWorldImg, withOffset: 16.0)
        
        syaratField.autoPinEdge(toSuperviewEdge: .left, withInset: 12.0)
        syaratField.autoPinEdge(toSuperviewEdge: .right, withInset: 12.0)
        syaratField.autoPinEdge(.top, to: .bottom, of: ketentuanField, withOffset: 16.0)
        
        submitButton.autoPinEdge(toSuperviewEdge: .left, withInset: 12.0)
        submitButton.autoPinEdge(toSuperviewEdge: .right, withInset: 12.0)
        submitButton.autoPinEdge(.top, to: .bottom, of: syaratField, withOffset: 16.0)
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView.tag == 0 {
            return ketentuans.count
        } else {
            return syaratas.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView.tag == 0 {
            return ketentuans[row]
        } else {
            return syaratas[row]
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView.tag == 0 {
            ketentuanField.text = ketentuans[row]
        } else {
            syaratField.text = syaratas[row]
        }
    }
    
 }
