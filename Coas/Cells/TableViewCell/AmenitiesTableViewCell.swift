//
//  AmenitiesTableViewCell.swift
//  Coas
//
//  Created by Sivaramsingh on 09/08/18.
//  Copyright © 2018 com. All rights reserved.
//

import UIKit
import KTCenterFlowLayout
private let kReuseAmenitiesCollectionCellID = "reuseAmenitiesCollectionCellID"

class AmenitiesTableViewCell: UITableViewCell {

    
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        let layout: KTCenterFlowLayout = KTCenterFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        layout.itemSize = CGSize(width: 50.0, height: 50.0)
        layout.minimumInteritemSpacing = 20
        layout.minimumLineSpacing = 20
        collectionView.collectionViewLayout = layout
        collectionView.register(UINib(nibName: "\(AmenitiesCollectionViewCell.self)", bundle: nil), forCellWithReuseIdentifier: kReuseAmenitiesCollectionCellID)
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}


extension AmenitiesTableViewCell {
    
    func setCollectionViewDataSourceDelegate<D: UICollectionViewDataSource & UICollectionViewDelegate>(_ dataSourceDelegate: D, forRow row: Int) {
        
        collectionView.delegate = dataSourceDelegate
        collectionView.dataSource = dataSourceDelegate
        collectionView.tag = row
        collectionView.setContentOffset(collectionView.contentOffset, animated:true) // Stops collection view if it was scrolling.
        collectionView.reloadData()
    }
    
    var collectionViewOffset: CGFloat {
        set { collectionView.contentOffset.x = newValue }
        get { return collectionView.contentOffset.x }
    }
}
