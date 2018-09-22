//
//  ServiceController.swift
//  Carsworld
//
//  Created by carsworld Indonesia on 20/09/18.
//  Copyright © 2018 Carsworld Indonesia. All rights reserved.
//
import UIKit

class ServiceController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    let cellId = "cellId"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupMenuBar()
        setupCollectionViews()
    }
    
    @objc func setupMenuBar() {
        navigationController?.hidesBarsOnSwipe = false
        navigationController?.navigationBar.isTranslucent = false
        navigationItem.title = "Service"
        navigationController?.navigationBar.tintColor = UIColor.white
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
    }
    
    @objc func setupCollectionViews() {
        collectionView?.backgroundColor = .white
        
        collectionView?.register(ServiceView.self, forCellWithReuseIdentifier: cellId)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! ServiceView
        cell.serviceController = self
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height)
    }
    
    func showServiceDetail() {
        navigationController?.pushViewController(ServiceDetailController(collectionViewLayout: UICollectionViewFlowLayout()), animated: true)
    }
    
}


class ServiceView: BaseCell, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    let cellId = "cellId"
    var serviceController: ServiceController?
    
    lazy var searchField: UITextField = {
        let field = UITextField()
        field.placeholder = "search name"
        field.font = UIFont.systemFont(ofSize: 14)
        field.borderStyle = .roundedRect
        field.autocorrectionType = .no
        field.keyboardType = .default
        field.returnKeyType = .done
        field.clearButtonMode = .whileEditing
        field.contentVerticalAlignment = .center
        return field
    }()
    
    lazy var tambahButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("Tambah Kendaraan", for: .normal)
        btn.autoSetDimension(.height, toSize: 36)
        btn.backgroundColor = warnaCarsworld
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 13)
        return btn
    }()
    
    lazy var colView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .white
        cv.delegate = self
        cv.dataSource = self
        return cv
    }()
    
    override func setupViews() {
        
        colView.register(ServiceItemCell.self, forCellWithReuseIdentifier: cellId)
        
        addSubview(searchField)
        addSubview(tambahButton)
        addSubview(colView)
        
        searchField.autoPinEdge(toSuperviewEdge: .top, withInset: 8)
        searchField.autoPinEdge(toSuperviewEdge: .left, withInset: 8)
        searchField.autoPinEdge(toSuperviewEdge: .right, withInset: 8)
        
        colView.autoPinEdge(toSuperviewEdge: .right)
        colView.autoPinEdge(toSuperviewEdge: .left)
        colView.autoPinEdge(.top, to: .bottom, of: searchField, withOffset: 8)
        colView.autoPinEdge(.bottom, to: .top, of: tambahButton, withOffset: 0)
        
        tambahButton.autoPinEdge(toSuperviewEdge: .bottom)
        tambahButton.autoPinEdge(toSuperviewEdge: .left)
        tambahButton.autoPinEdge(toSuperviewEdge: .right)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! ServiceItemCell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: frame.width, height: 75)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        serviceController?.showServiceDetail()
    }
    
}


class ServiceItemCell: BaseCell {
    
    lazy var iconMobil: UIImageView = {
        let img = UIImageView()
        img.autoSetDimension(.height, toSize: 64)
        img.autoSetDimension(.width, toSize: 64)
        img.image = UIImage(named: "mobillist")
        img.layer.cornerRadius = 22
        return img
    }()
    
    lazy var brandMobil: UILabel = {
        let lbl = UILabel()
        lbl.text = "Toyota"
        lbl.font = UIFont.boldSystemFont(ofSize: 16)
        return lbl
    }()
    
    lazy var typeMobil: UILabel = {
        let lbl = UILabel()
        lbl.text = "Avanza"
        lbl.font = UIFont.systemFont(ofSize: 14)
        lbl.textColor = UIColor.gray
        return lbl
    }()
    
    lazy var nopolMobil: UILabel = {
        let lbl = UILabel()
        lbl.text = "N 5609 ZB"
        lbl.font = UIFont.systemFont(ofSize: 12)
        return lbl
    }()
    
    override func setupViews() {
        
        addSubview(iconMobil)
        addSubview(brandMobil)
        addSubview(typeMobil)
        addSubview(nopolMobil)
        
        iconMobil.autoPinEdge(toSuperviewEdge: .left, withInset: 16.0)
        iconMobil.autoPinEdge(toSuperviewEdge: .top, withInset: 8.0)
        
        brandMobil.autoPinEdge(.left, to: .right, of: iconMobil, withOffset: 16.0)
        brandMobil.autoPinEdge(toSuperviewEdge: .top, withInset: 10.0)
        brandMobil.autoPinEdge(toSuperviewEdge: .right, withInset: 8.0)
        
        typeMobil.autoPinEdge(.left, to: .right, of: iconMobil, withOffset: 16.0)
        typeMobil.autoPinEdge(.top, to: .bottom, of: brandMobil, withOffset: 1.0)
        typeMobil.autoPinEdge(toSuperviewEdge: .right, withInset: 8.0)
        
        nopolMobil.autoPinEdge(.left, to: .right, of: iconMobil, withOffset: 16.0)
        nopolMobil.autoPinEdge(.top, to: .bottom, of: typeMobil, withOffset: 4.0)
        nopolMobil.autoPinEdge(toSuperviewEdge: .right, withInset: 8.0)
    }
}

class ServiceDetailController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    let cellId = "cellId"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupCollectionViews()
    }
    
    @objc func setupCollectionViews() {
        collectionView?.backgroundColor = .white
        
        collectionView?.register(ServiceDetailView.self, forCellWithReuseIdentifier: cellId)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! ServiceDetailView
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height)
    }
    
}

class ServiceDetailView: BaseCell, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    let cellId = "cellId"
    
    lazy var segmentedControl: UISegmentedControl = {
        let control = UISegmentedControl(items: ["Service Status", "Booking Service"])
        control.autoSetDimension(.height, toSize: 32.0)
        control.selectedSegmentIndex = 0
        control.layer.borderColor = warnaCarsworld.cgColor
        control.tintColor = warnaCarsworld
        control.addTarget(self, action: #selector(self.controlChanged), for: .valueChanged)
        return control
    }()
    
    lazy var colView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .white
        cv.delegate = self
        cv.dataSource = self
        return cv
    }()
    
    override func setupViews() {
        
        addSubview(segmentedControl)
        addSubview(colView)
        
        colView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: cellId)
        
        segmentedControl.autoPinEdge(toSuperviewEdge: .top, withInset: 8)
        segmentedControl.autoPinEdge(toSuperviewEdge: .left, withInset: 8)
        segmentedControl.autoPinEdge(toSuperviewEdge: .right, withInset: 8)
        
        colView.autoPinEdge(.top, to: .bottom, of: segmentedControl, withOffset: 8)
        colView.autoPinEdge(toSuperviewEdge: .left, withInset: 8)
        colView.autoPinEdge(toSuperviewEdge: .right, withInset: 8)
        colView.autoPinEdge(toSuperviewEdge: .bottom, withInset: 8)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath)
        cell.backgroundColor = .red
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: frame.width, height: frame.height)
    }
    
    @objc func controlChanged() {
        let indexPath = IndexPath(item: segmentedControl.selectedSegmentIndex, section: 0)
        colView.scrollToItem(at: indexPath, at: [], animated: true)
    }
    
}
