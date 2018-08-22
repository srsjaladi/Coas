

//
//  AddingRoomViewController.swift
//  Coas
//
//  Created by Sivaramsingh on 17/08/18.
//  Copyright © 2018 com. All rights reserved.
//

import UIKit
private let kReuseCollectionCellID = "ProductCollectionViewCell"

class ProductsViewController: UIViewController,UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    
    @IBOutlet weak var btnback: UIBarButtonItem!
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        setNeedsStatusBarAppearanceUpdate()
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        layout.itemSize = CGSize(width: (self.view.frame.width - 30)/2, height: 200)
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 10
        layout.scrollDirection = .vertical
        collectionView.collectionViewLayout = layout
        collectionView.register(UINib(nibName: "\(ProductCollectionViewCell.self)", bundle: nil), forCellWithReuseIdentifier: kReuseCollectionCellID)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - CollectionView Protocol
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return 5
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: kReuseCollectionCellID, for: indexPath) as! ProductCollectionViewCell
        
        return cell
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
    {
        let homeStoryboard = UIStoryboard(name: "Other", bundle: nil)
        let rentDetailsVC = homeStoryboard.instantiateViewController(withIdentifier: "ProductDetailsViewController") as! ProductDetailsViewController
        self.navigationController?.pushViewController(rentDetailsVC, animated: true)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: (self.view.frame.width - 30)/2, height: 200)
        
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    @IBAction func btnBackClicked(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    

}

