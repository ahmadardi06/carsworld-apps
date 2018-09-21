//
//  PromoDetailController.swift
//  Carsworld
//
//  Created by carsworld Indonesia on 21/09/18.
//  Copyright © 2018 Carsworld Indonesia. All rights reserved.
//

import UIKit

class PromoDetailController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    let cellId = "cellId"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupMenuBar()
        setupCollectionViews()
    }
    
    @objc func setupMenuBar() {
        navigationController?.hidesBarsOnSwipe = false
        navigationController?.navigationBar.isTranslucent = false
        navigationItem.title = "Detail"
        navigationController?.navigationBar.tintColor = UIColor.white
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
    }
    
    @objc func setupCollectionViews() {
        collectionView?.backgroundColor = .white
        
        collectionView?.register(DetailCell.self, forCellWithReuseIdentifier: cellId)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! DetailCell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height)
    }
    
}

class DetailCell: BaseCell {
    
    lazy var detailImg: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "promos1")
        img.layer.borderColor = UIColor(white: 0.4, alpha: 0.4).cgColor
        img.layer.borderWidth = 0.5
        img.layer.cornerRadius = 5
        img.layer.masksToBounds = true
        img.contentMode = .scaleAspectFill
        img.autoSetDimension(.height, toSize: 200)
        return img
    }()
    
    lazy var descLabel: UITextView = {
        let lbl = UITextView()
        lbl.text = "Toyota Motor Corporation (TMC) (Toyota Jidōsha kabushiki-gaisha) TYO: 7203.T, NYSE: TM, LSE: TYT), adalah sebuah pabrikan mobil yang berasal dari Jepang, yang berpusat di Toyota, Aichi. Saat ini, Toyota merupakan pabrikan penghasil mobil terbesar di dunia. Di samping memproduksi mobil, Toyota juga memberikan pelayanan finansial, dan juga membuat robot. TMC merupakan anggota dari Grup Toyota dan memproduksi mobil dengan merek Toyota, Lexus dan Scion, Daihatsu dan Hino, dan memiliki sebagian kecil saham Subaru dan Isuzu."
        lbl.layer.borderWidth = 0.5
        lbl.layer.borderColor = UIColor(white: 0.4, alpha: 0.4).cgColor
        lbl.textColor = .black
        return lbl
    }()
    
    override func setupViews() {
        
        addSubview(detailImg)
        addSubview(descLabel)
        
        detailImg.autoPinEdge(toSuperviewMargin: .top, withInset: 8)
        detailImg.autoPinEdge(toSuperviewMargin: .left, withInset: 8)
        detailImg.autoPinEdge(toSuperviewMargin: .right, withInset: 8)
        
        descLabel.autoPinEdge(.top, to: .bottom, of: detailImg, withOffset: 8)
        descLabel.autoPinEdge(toSuperviewMargin: .left, withInset: 8)
        descLabel.autoPinEdge(toSuperviewMargin: .right, withInset: 8)
        descLabel.autoPinEdge(toSuperviewMargin: .bottom, withInset: 8)
    }
}
