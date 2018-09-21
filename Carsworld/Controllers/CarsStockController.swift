//
//  ServiceController.swift
//  Carsworld
//
//  Created by carsworld Indonesia on 20/09/18.
//  Copyright © 2018 Carsworld Indonesia. All rights reserved.
//
import UIKit

class CarsStockController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    let cellId = "cellId"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupMenuBar()
        setupCollectionViews()
    }
    
    @objc func setupMenuBar() {
        navigationController?.hidesBarsOnSwipe = false
        navigationController?.navigationBar.isTranslucent = false
        navigationItem.title = "Cars Stock"
        navigationController?.navigationBar.tintColor = UIColor.white
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
    }
    
    @objc func setupCollectionViews() {
        collectionView?.backgroundColor = .white
    }
}
