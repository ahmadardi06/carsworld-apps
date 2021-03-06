//
//  ServiceController.swift
//  Carsworld
//
//  Created by carsworld Indonesia on 20/09/18.
//  Copyright © 2018 Carsworld Indonesia. All rights reserved.
//
import UIKit

class SignInController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    let cellId = "cellId"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupMenuBar()
        setupCollectionViews()
    }
    
    @objc func setupMenuBar() {
        navigationController?.navigationBar.isHidden = true

    }
    
    @objc func setupCollectionViews() {
        collectionView?.backgroundColor = warnaAtasMenuBar
        
        collectionView?.register(LoginCell.self, forCellWithReuseIdentifier: cellId)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! LoginCell
        cell.signInController = self
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height)
    }
    
    @objc func showSignUp() {
        let appDetail = SignUpController(collectionViewLayout: UICollectionViewFlowLayout())
        navigationController?.pushViewController(appDetail, animated: true)
    }
    
    @objc func showHome() {
        let appDetail = HomeController(collectionViewLayout: UICollectionViewFlowLayout())
        view.window?.rootViewController = UINavigationController(rootViewController: appDetail)
    }
    
    @objc func showLupaSandi() {
        let appDetail = LupaSandiController(collectionViewLayout: UICollectionViewFlowLayout())
        navigationController?.pushViewController(appDetail, animated: true)
    }
}
