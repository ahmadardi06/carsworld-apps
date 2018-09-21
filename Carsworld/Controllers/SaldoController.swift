//
//  ServiceController.swift
//  Carsworld
//
//  Created by carsworld Indonesia on 20/09/18.
//  Copyright © 2018 Carsworld Indonesia. All rights reserved.
//
import UIKit

class SaldoController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    let cellId = "cellId"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupMenuBar()
        setupCollectionViews()
    }
    
    @objc func setupMenuBar() {
        navigationController?.hidesBarsOnSwipe = false
        navigationController?.navigationBar.isTranslucent = false
        navigationItem.title = "Saldo Anda"
        navigationController?.navigationBar.tintColor = UIColor.white
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
    }
    
    @objc func setupCollectionViews() {
        collectionView?.backgroundColor = .white
        
        collectionView?.register(SaldoCell.self, forCellWithReuseIdentifier: cellId)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! SaldoCell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height)
    }
    
}
