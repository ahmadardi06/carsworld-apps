//
//  MoreCell.swift
//  Carsworld
//
//  Created by carsworld Indonesia on 21/09/18.
//  Copyright © 2018 Carsworld Indonesia. All rights reserved.
//

import UIKit

class MoreCell: BaseCell, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

    let cellId = "cellId"
    var moreController: MoreController?
    
    lazy var colView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .white
        cv.delegate = self
        cv.dataSource = self
        return cv
    }()
    
    lazy var textLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "Semua menu di Carsworld"
        lbl.font = UIFont.boldSystemFont(ofSize: 16)
        return lbl
    }()
    
    let menuIcon = [
        "service","newcars","usedcar","insurance","carsworldshop","auction",
        "finance","carstok","nasmoco","emergency","marketplace","rental"
    ]
    let menuText = [
        "Service","New Cars","Used Cars","Insurance","Carsworld Shop","Auction",
        "Finance","Cars Stock","Nasmoco","Emergency","Cars Marketplace","Rental"
    ]
    let menuController = [
        ServiceController(collectionViewLayout: UICollectionViewFlowLayout()),
        NewCarsController(collectionViewLayout: UICollectionViewFlowLayout()),
        UsedCarsController(collectionViewLayout: UICollectionViewFlowLayout()),
        InsuranceController(collectionViewLayout: UICollectionViewFlowLayout()),
        ShopController(collectionViewLayout: UICollectionViewFlowLayout()),
        AuctionController(collectionViewLayout: UICollectionViewFlowLayout()),
        FinanceController(collectionViewLayout: UICollectionViewFlowLayout()),
        CarsStockController(collectionViewLayout: UICollectionViewFlowLayout()),
        NasmocoController(collectionViewLayout: UICollectionViewFlowLayout()),
        EmergencyController(collectionViewLayout: UICollectionViewFlowLayout()),
        MarketplaceController(collectionViewLayout: UICollectionViewFlowLayout()),
        RentalController(collectionViewLayout: UICollectionViewFlowLayout())
    ]
    
    override func setupViews() {
        
        colView.register(MenuItemCell.self, forCellWithReuseIdentifier: cellId)
        
        addSubview(textLabel)
        addSubview(colView)
        
        textLabel.autoPinEdge(toSuperviewEdge: .top, withInset: 8)
        textLabel.autoPinEdge(toSuperviewEdge: .left, withInset: 8)
        textLabel.autoPinEdge(toSuperviewEdge: .right, withInset: 8)
        
        colView.autoPinEdge(.top, to: .bottom, of: textLabel, withOffset: 8)
        colView.autoPinEdge(toSuperviewEdge: .left, withInset: 8)
        colView.autoPinEdge(toSuperviewEdge: .right, withInset: 8)
        colView.autoPinEdge(toSuperviewEdge: .bottom, withInset: 8)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 12
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! MenuItemCell
        cell.menuIcon.image = UIImage(named: menuIcon[indexPath.item])
        cell.menuText.text = menuText[indexPath.item]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let numberOfColumns: CGFloat = 4
        let itemWidth = ((frame.width - 16) - (numberOfColumns - 1)) / numberOfColumns
        return CGSize(width: itemWidth, height: itemWidth)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        moreController?.showMenuDetail(controller: menuController[indexPath.item])
    }

}
