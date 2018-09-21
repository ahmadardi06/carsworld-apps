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
    
    var homeController: HomeController?
    
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
    
    lazy var carsWorldImg: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "carsworld")
        img.layer.masksToBounds = true
        img.contentMode = .scaleAspectFit
        img.autoSetDimension(.height, toSize: 128)
        return img
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
        button.addTarget(self, action: #selector(self.handleEdit), for: .touchUpInside)
        return button
    }()

    lazy var logoutButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = warnaCarsworld
        button.autoSetDimension(.height, toSize: 35.0)
        button.addTarget(self, action: #selector(self.handleLogout), for: .touchUpInside)
        button.setTitle("Logout application", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 13)
        return button
    }()

    override func setupViews() {
        
        addSubview(carsWorldImg)
        addSubview(avatar)
        addSubview(upperView)
        addSubview(segmentedControl)
        addSubview(editButton)

        addSubview(logoutButton)

        setupConstraints()

        bringSubview(toFront: carsWorldImg)
        bringSubview(toFront: avatar)
        
        addSubview(colView)
        colView.register(PersonalCell.self, forCellWithReuseIdentifier: cellId)
        colView.register(YourCarsCell.self, forCellWithReuseIdentifier: yourCarsId)
        colView.register(SocialCell.self, forCellWithReuseIdentifier: socialId)
        
        addConstraintWithFormat(format: "H:|[v0]|", views: colView)
        addConstraintWithFormat(format: "V:|-248-[v0]-40-|", views: colView)
        
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
        
        carsWorldImg.autoPinEdge(toSuperviewEdge: .top, withInset: -24)
        carsWorldImg.autoPinEdge(toSuperviewEdge: .left, withInset: 16)
        carsWorldImg.autoPinEdge(toSuperviewEdge: .right, withInset: 16)
        
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

        logoutButton.autoPinEdge(toSuperviewEdge: .left)
        logoutButton.autoPinEdge(toSuperviewEdge: .right)
        logoutButton.autoPinEdge(toSuperviewEdge: .bottom)

    }
    
    @objc func controlChanged() {
        let indexPath = IndexPath(item: segmentedControl.selectedSegmentIndex, section: 0)
        colView.scrollToItem(at: indexPath, at: [], animated: true)
    }
    
    @objc func handleEdit(sender: UIButton) {
        print("one")
    }
    
    @objc func handleLogout() {
        homeController?.showSignIn()
    }
    
}

class LoginCell: BaseCell {
    
    var signInController: SignInController?
    
    lazy var logoImg: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "carsworld")
        img.contentMode = .scaleAspectFit
        img.autoSetDimension(.height, toSize: 150)
        return img
    }()
    
    lazy var usernameField: UITextField = {
        let field = UITextField()
        field.placeholder = "enter username"
        field.font = UIFont.systemFont(ofSize: 14)
        field.borderStyle = .roundedRect
        field.autocorrectionType = .no
        field.keyboardType = .default
        field.returnKeyType = .done
        field.clearButtonMode = .whileEditing
        field.contentVerticalAlignment = .center
        return field
    }()
    
    lazy var passwordField: UITextField = {
        let field = UITextField()
        field.placeholder = "enter password"
        field.font = UIFont.systemFont(ofSize: 14)
        field.borderStyle = .roundedRect
        field.autocorrectionType = .no
        field.keyboardType = .default
        field.returnKeyType = .done
        field.clearButtonMode = .whileEditing
        field.contentVerticalAlignment = .center
        field.isSecureTextEntry = true
        return field
    }()
    
    lazy var submitButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("Login", for: .normal)
        btn.autoSetDimension(.height, toSize: 35)
        btn.layer.cornerRadius = 5
        btn.layer.borderColor = UIColor(white: 0.4, alpha: 0.4).cgColor
        btn.layer.borderWidth = 0.5
        btn.backgroundColor = warnaCarsworld
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 13)
        btn.addTarget(self, action: #selector(self.handleLogin), for: .touchUpInside)
        return btn
    }()
    
    lazy var lupaSandiButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("Lupa Kata Sandi ? Klik Disini", for: .normal)
        btn.autoSetDimension(.height, toSize: 35)
        btn.backgroundColor = .clear
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 11)
        btn.addTarget(self, action: #selector(self.handleLupaSandi), for: .touchUpInside)
        return btn
    }()
    
    lazy var registerButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("Belum Memiliki Akun ? DAFTAR", for: .normal)
        btn.autoSetDimension(.height, toSize: 35)
        btn.backgroundColor = UIColor.gray
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 13)
        btn.addTarget(self, action: #selector(self.handleRegister), for: .touchUpInside)
        return btn
    }()
    
    override func setupViews() {
        
        addSubview(logoImg)
        addSubview(usernameField)
        addSubview(passwordField)
        addSubview(submitButton)
        addSubview(lupaSandiButton)
        addSubview(registerButton)
        
        logoImg.autoPinEdge(toSuperviewEdge: .top, withInset: 40.0)
        logoImg.autoPinEdge(toSuperviewEdge: .left, withInset: 32.0)
        logoImg.autoPinEdge(toSuperviewEdge: .right, withInset: 32.0)
        
        usernameField.autoPinEdge(.top, to: .bottom, of: logoImg, withOffset: 24.0)
        usernameField.autoPinEdge(toSuperviewEdge: .left, withInset: 32.0)
        usernameField.autoPinEdge(toSuperviewEdge: .right, withInset: 32.0)
        
        passwordField.autoPinEdge(.top, to: .bottom, of: usernameField, withOffset: 16.0)
        passwordField.autoPinEdge(toSuperviewEdge: .left, withInset: 32.0)
        passwordField.autoPinEdge(toSuperviewEdge: .right, withInset: 32.0)
        
        submitButton.autoPinEdge(.top, to: .bottom, of: passwordField, withOffset: 24.0)
        submitButton.autoPinEdge(toSuperviewEdge: .left, withInset: 32.0)
        submitButton.autoPinEdge(toSuperviewEdge: .right, withInset: 32.0)
        
        lupaSandiButton.autoPinEdge(.top, to: .bottom, of: submitButton, withOffset: 16.0)
        lupaSandiButton.autoPinEdge(toSuperviewEdge: .left, withInset: 32.0)
        lupaSandiButton.autoPinEdge(toSuperviewEdge: .right, withInset: 32.0)
        
        registerButton.autoPinEdge(toSuperviewEdge: .bottom, withInset: 20.0)
        registerButton.autoPinEdge(toSuperviewEdge: .left)
        registerButton.autoPinEdge(toSuperviewEdge: .right)
        
    }
    
    @objc func handleRegister() {
        signInController?.showSignUp()
    }
    
    @objc func handleLogin() {
        signInController?.showHome()
    }
    
    @objc func handleLupaSandi() {
        signInController?.showLupaSandi()
    }
}

class RegisterCell: BaseCell {
    
    var signUpController: SignUpController?
    
    lazy var logoImg: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "carsworld")
        img.contentMode = .scaleAspectFit
        img.autoSetDimension(.height, toSize: 150)
        return img
    }()
    
    lazy var ktpField: UITextField = {
        let field = UITextField()
        field.placeholder = "enter nomor KTP"
        field.font = UIFont.systemFont(ofSize: 14)
        field.borderStyle = .roundedRect
        field.autocorrectionType = .no
        field.keyboardType = .default
        field.returnKeyType = .done
        field.clearButtonMode = .whileEditing
        field.contentVerticalAlignment = .center
        return field
    }()
    
    lazy var usernameField: UITextField = {
        let field = UITextField()
        field.placeholder = "enter username"
        field.font = UIFont.systemFont(ofSize: 14)
        field.borderStyle = .roundedRect
        field.autocorrectionType = .no
        field.keyboardType = .default
        field.returnKeyType = .done
        field.clearButtonMode = .whileEditing
        field.contentVerticalAlignment = .center
        return field
    }()
    
    lazy var passwordField: UITextField = {
        let field = UITextField()
        field.placeholder = "enter password"
        field.font = UIFont.systemFont(ofSize: 14)
        field.borderStyle = .roundedRect
        field.autocorrectionType = .no
        field.keyboardType = .default
        field.returnKeyType = .done
        field.clearButtonMode = .whileEditing
        field.contentVerticalAlignment = .center
        field.isSecureTextEntry = true
        return field
    }()
    
    lazy var nomorField: UITextField = {
        let field = UITextField()
        field.placeholder = "enter nomor telepon"
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
        btn.setTitle("Register", for: .normal)
        btn.autoSetDimension(.height, toSize: 35)
        btn.layer.cornerRadius = 5
        btn.layer.borderColor = UIColor(white: 0.4, alpha: 0.4).cgColor
        btn.layer.borderWidth = 0.5
        btn.backgroundColor = warnaCarsworld
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 13)
        btn.addTarget(self, action: #selector(self.showLogin), for: .touchUpInside)
        return btn
    }()
    
    lazy var registerButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("Sudah Memiliki Akun ? LOGIN", for: .normal)
        btn.autoSetDimension(.height, toSize: 35)
        btn.backgroundColor = UIColor.gray
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 13)
        btn.addTarget(self, action: #selector(self.showLogin), for: .touchUpInside)
        return btn
    }()
    
    override func setupViews() {
        
        addSubview(logoImg)
        addSubview(ktpField)
        addSubview(usernameField)
        addSubview(passwordField)
        addSubview(nomorField)
        addSubview(submitButton)
        addSubview(registerButton)
        
        logoImg.autoPinEdge(toSuperviewEdge: .top, withInset: 40.0)
        logoImg.autoPinEdge(toSuperviewEdge: .left, withInset: 32.0)
        logoImg.autoPinEdge(toSuperviewEdge: .right, withInset: 32.0)
        
        ktpField.autoPinEdge(.top, to: .bottom, of: logoImg, withOffset: 24.0)
        ktpField.autoPinEdge(toSuperviewEdge: .left, withInset: 32.0)
        ktpField.autoPinEdge(toSuperviewEdge: .right, withInset: 32.0)
        
        usernameField.autoPinEdge(.top, to: .bottom, of: ktpField, withOffset: 16.0)
        usernameField.autoPinEdge(toSuperviewEdge: .left, withInset: 32.0)
        usernameField.autoPinEdge(toSuperviewEdge: .right, withInset: 32.0)
        
        passwordField.autoPinEdge(.top, to: .bottom, of: usernameField, withOffset: 16.0)
        passwordField.autoPinEdge(toSuperviewEdge: .left, withInset: 32.0)
        passwordField.autoPinEdge(toSuperviewEdge: .right, withInset: 32.0)
        
        nomorField.autoPinEdge(.top, to: .bottom, of: passwordField, withOffset: 16.0)
        nomorField.autoPinEdge(toSuperviewEdge: .left, withInset: 32.0)
        nomorField.autoPinEdge(toSuperviewEdge: .right, withInset: 32.0)
        
        submitButton.autoPinEdge(.top, to: .bottom, of: nomorField, withOffset: 24.0)
        submitButton.autoPinEdge(toSuperviewEdge: .left, withInset: 32.0)
        submitButton.autoPinEdge(toSuperviewEdge: .right, withInset: 32.0)
        
        registerButton.autoPinEdge(toSuperviewEdge: .bottom, withInset: 20.0)
        registerButton.autoPinEdge(toSuperviewEdge: .left)
        registerButton.autoPinEdge(toSuperviewEdge: .right)
        
    }
    
    @objc func showLogin() {
        signUpController?.showLogin()
    }
    
}


class LupaSandiCell: BaseCell {
    
    var lupaSandiController: LupaSandiController?
    
    lazy var logoImg: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "carsworld")
        img.contentMode = .scaleAspectFit
        img.autoSetDimension(.height, toSize: 150)
        return img
    }()
    
    lazy var ktpField: UITextField = {
        let field = UITextField()
        field.placeholder = "enter email"
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
        btn.setTitle("Kirim Verifikasi", for: .normal)
        btn.autoSetDimension(.height, toSize: 35)
        btn.layer.cornerRadius = 5
        btn.layer.borderColor = UIColor(white: 0.4, alpha: 0.4).cgColor
        btn.layer.borderWidth = 0.5
        btn.backgroundColor = warnaCarsworld
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 13)
        btn.addTarget(self, action: #selector(self.showLogin), for: .touchUpInside)
        return btn
    }()
    
    lazy var registerButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("Sudah Memiliki Akun ? LOGIN", for: .normal)
        btn.autoSetDimension(.height, toSize: 35)
        btn.backgroundColor = UIColor.gray
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 13)
        btn.addTarget(self, action: #selector(self.showLogin), for: .touchUpInside)
        return btn
    }()
    
    override func setupViews() {
        
        addSubview(logoImg)
        addSubview(ktpField)
        addSubview(submitButton)
        addSubview(registerButton)
        
        logoImg.autoPinEdge(toSuperviewEdge: .top, withInset: 40.0)
        logoImg.autoPinEdge(toSuperviewEdge: .left, withInset: 32.0)
        logoImg.autoPinEdge(toSuperviewEdge: .right, withInset: 32.0)
        
        ktpField.autoPinEdge(.top, to: .bottom, of: logoImg, withOffset: 24.0)
        ktpField.autoPinEdge(toSuperviewEdge: .left, withInset: 32.0)
        ktpField.autoPinEdge(toSuperviewEdge: .right, withInset: 32.0)
        
        submitButton.autoPinEdge(.top, to: .bottom, of: ktpField, withOffset: 24.0)
        submitButton.autoPinEdge(toSuperviewEdge: .left, withInset: 32.0)
        submitButton.autoPinEdge(toSuperviewEdge: .right, withInset: 32.0)
        
        registerButton.autoPinEdge(toSuperviewEdge: .bottom, withInset: 20.0)
        registerButton.autoPinEdge(toSuperviewEdge: .left)
        registerButton.autoPinEdge(toSuperviewEdge: .right)
        
    }
    
    @objc func showLogin() {
        lupaSandiController?.showLogin()
    }
}
