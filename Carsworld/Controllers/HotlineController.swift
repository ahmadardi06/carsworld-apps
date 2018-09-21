//
//  HotlineController.swift
//  Carsworld
//
//  Created by carsworld Indonesia on 21/09/18.
//  Copyright © 2018 Carsworld Indonesia. All rights reserved.
//
import UIKit

class ChatController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    let cellId = "cellId"
    
    let chatWith = ["Carfix", "Nasmoco", "Andalan Finance", "Carsworld"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupMenuBar()
        setupCollectionViews()
    }
    
    @objc func setupMenuBar() {
        navigationController?.hidesBarsOnSwipe = false
        navigationController?.navigationBar.isTranslucent = false
        navigationItem.title = "Chat With"
        navigationController?.navigationBar.tintColor = UIColor.white
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
    }
    
    @objc func setupCollectionViews() {
        collectionView?.backgroundColor = .white
        
        collectionView?.register(ChatWithCell.self, forCellWithReuseIdentifier: cellId)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return chatWith.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! ChatWithCell
        cell.titleLabel.text = chatWith[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 100)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
}

class SaranController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    let cellId = "cellId"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupMenuBar()
        setupCollectionViews()
    }
    
    @objc func setupMenuBar() {
        navigationController?.hidesBarsOnSwipe = false
        navigationController?.navigationBar.isTranslucent = false
        navigationItem.title = "Saran"
        navigationController?.navigationBar.tintColor = UIColor.white
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
    }
    
    @objc func setupCollectionViews() {
        collectionView?.backgroundColor = .white
        
        collectionView?.register(SaranCell.self, forCellWithReuseIdentifier: cellId)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! SaranCell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height)
    }
    
}

class FaqController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    let cellId = "cellId"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupMenuBar()
        setupCollectionViews()
    }
    
    @objc func setupMenuBar() {
        navigationController?.hidesBarsOnSwipe = false
        navigationController?.navigationBar.isTranslucent = false
        navigationItem.title = "Frequently Asked Question"
        navigationController?.navigationBar.tintColor = UIColor.white
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
    }
    
    @objc func setupCollectionViews() {
        collectionView?.backgroundColor = .white
        
        collectionView?.register(FaqCell.self, forCellWithReuseIdentifier: cellId)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! FaqCell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height)
    }
    
}
