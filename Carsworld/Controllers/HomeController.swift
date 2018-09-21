//
//  ViewController.swift
//  Carsworld
//
//  Created by carsworld Indonesia on 18/09/18.
//  Copyright © 2018 Carsworld Indonesia. All rights reserved.
//

import UIKit

class HomeController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    let cellId = "cellId"
    let historyId = "historyId"
    let hotlineId = "hotlineId"
    let accountId = "accountId"
    let voucherId = "voucherId"
    
    var homeController: HomeController?
    
    let titleMenu = ["Carsworld","History","Hotline","Account","Voucher"]
    let warnaCarsworld = UIColor.rgb(red: 54, green: 118, blue: 203)
    
    lazy var menuBar: MenuBar = {
        let mb = MenuBar()
        mb.homeController = self
        return mb
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.isTranslucent = false
        
        let title = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width - 32, height: view.frame.height))
        title.text = "Carsworld"
        title.textColor = UIColor.white
        title.font = UIFont.boldSystemFont(ofSize: 20)
        navigationItem.titleView = title
        
        setupMenuBar()
        setupNavBarRight()
        setupCollectionView()
    }
    
    @objc func setupCollectionView() {
        if let flowLayout = collectionView?.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.scrollDirection = .horizontal
            flowLayout.minimumLineSpacing = 0
        }
        
        collectionView?.backgroundColor = UIColor.white
        
        //register source
        collectionView?.register(HomeSource.self, forCellWithReuseIdentifier: cellId)
        collectionView?.register(HistorySource.self, forCellWithReuseIdentifier: historyId)
        collectionView?.register(HotlineSource.self, forCellWithReuseIdentifier: hotlineId)
        collectionView?.register(AccountSource.self, forCellWithReuseIdentifier: accountId)
        collectionView?.register(VoucherSource.self, forCellWithReuseIdentifier: voucherId)
        
        collectionView?.isPagingEnabled = true
        
        // membatasi untuk scroll bawahnya menu bar atas
        collectionView?.contentInset = UIEdgeInsets(top: 50, left: 0, bottom: 0, right: 0)
        collectionView?.scrollIndicatorInsets = UIEdgeInsets(top: 50, left: 0, bottom: 0, right: 0)
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.item == 1 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: historyId, for: indexPath) as! HistorySource
            cell.homeController = self
            return cell
        } else if indexPath.item == 2 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: hotlineId, for: indexPath) as! HotlineSource
            cell.homeController = self
            return cell
        } else if indexPath.item == 3 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: accountId, for: indexPath) as! AccountSource
            cell.homeController = self
            return cell
        } else if indexPath.item == 4 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: voucherId, for: indexPath) as! VoucherSource
            cell.homeController = self
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! HomeSource
            cell.homeController = self
            return cell
        }
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height - 50)
    }
    
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let getValueX = scrollView.contentOffset.x
        menuBar.awalHorizontalView?.constant = getValueX / 5
    }
    
    private func setupMenuBar() {
        navigationController?.hidesBarsOnSwipe = true
        
        let redView = UIView()
        redView.backgroundColor = warnaCarsworld
        view.addSubview(redView)
        view.addConstraintWithFormat(format: "H:|[v0]|", views: redView)
        view.addConstraintWithFormat(format: "V:[v0(50)]", views: redView)
        
        view.addSubview(menuBar)
        view.addConstraintWithFormat(format: "H:|[v0]|", views: menuBar)
        view.addConstraintWithFormat(format: "V:[v0(50)]", views: menuBar)
        
        menuBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
    }
    
    private func setupNavBarRight() {
        let goldBtn = UIBarButtonItem(image: #imageLiteral(resourceName: "membership-16").withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(self.handleGoldMember))
        let notifBtn = UIBarButtonItem(image: #imageLiteral(resourceName: "notification-16").withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(self.handleNotification))
        
        navigationItem.rightBarButtonItems = [goldBtn, notifBtn]
    }
    
    @objc func showAppDetail(controller: UICollectionViewController) {
        navigationController?.pushViewController(controller, animated: true)
    }
    
    @objc func showMenuDetail(controller: UICollectionViewController) {
        navigationController?.pushViewController(controller, animated: true)
    }
    
    @objc func showSignIn() {
        let appDetail = SignInController(collectionViewLayout: UICollectionViewFlowLayout())
        navigationController?.pushViewController(appDetail, animated: true)
    }
    
    @objc func showChatWith() {
        let appDetail = ChatController(collectionViewLayout: UICollectionViewFlowLayout())
        navigationController?.pushViewController(appDetail, animated: true)
    }

    @objc func showSaran() {
        let appDetail = SaranController(collectionViewLayout: UICollectionViewFlowLayout())
        navigationController?.pushViewController(appDetail, animated: true)
    }
    
    @objc func showFaq() {
        let appDetail = FaqController(collectionViewLayout: UICollectionViewFlowLayout())
        navigationController?.pushViewController(appDetail, animated: true)
    }
    
    @objc func showSaldo() {
        let appDetail = SaldoController(collectionViewLayout: UICollectionViewFlowLayout())
        navigationController?.pushViewController(appDetail, animated: true)
    }
    
    @objc func showPoint() {
        let appDetail = PointController(collectionViewLayout: UICollectionViewFlowLayout())
        navigationController?.pushViewController(appDetail, animated: true)
    }
    
    @objc func handleGoldMember() {
        let layout = UICollectionViewFlowLayout()
        let memberController = MemberController(collectionViewLayout: layout)
        navigationController?.pushViewController(memberController, animated: false)
    }
    
    @objc func handleNotification() {
        let layout = UICollectionViewFlowLayout()
        let notifikasiController = NotifikasiController(collectionViewLayout: layout)
        navigationController?.pushViewController(notifikasiController, animated: false)
    }
    
    @objc func scrollToViewIndex(menuIndex: Int) {
        let indexPath = IndexPath(item: menuIndex, section: 0)
        collectionView?.scrollToItem(at: indexPath, at: [], animated: true)
    }
    
    override func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let hasilBagi = targetContentOffset.pointee.x / view.frame.width
        let indexPath = IndexPath(item: Int(hasilBagi), section: 0)
        menuBar.collectionView.selectItem(at: indexPath, animated: true, scrollPosition: [])
        setTitleMenuBar(menuIndex: Int(hasilBagi))
    }
    
    @objc func setTitleMenuBar(menuIndex: Int) {
        let title = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width - 32, height: view.frame.height))
        title.text = "\(titleMenu[menuIndex])"
        title.textColor = UIColor.white
        title.font = UIFont.boldSystemFont(ofSize: 20)
        navigationItem.titleView = title
    }

}

