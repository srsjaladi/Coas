
//
//  ProductDetailsViewController.swift
//  Coas
//
//  Created by Sivaramsingh on 09/08/18.
//  Copyright © 2018 com. All rights reserved.
//

import UIKit
import CoreLocation

private let kReuseHotelRoomDetailsCellID = "reuseHotelRoomDetailsCellID"
private let kReuseProductRoomDetailsCellID = "ProductDetailsTableViewCell"


class ProductDetailsViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,CLLocationManagerDelegate {
    
    @IBOutlet weak var tblView: UITableView!
    @IBOutlet weak var btnForAddtoCart: UIButton!
    var headerView: HotelSectionHeaderCReusableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNeedsStatusBarAppearanceUpdate()
        headerView = (Bundle.main.loadNibNamed("HotelSectionHeaderCReusableView", owner: self, options: nil)![0] as? HotelSectionHeaderCReusableView)
        
        let nibName = UINib(nibName: "HotelSectionHeaderCReusableView", bundle: nil)
        self.tblView.register(nibName, forHeaderFooterViewReuseIdentifier: "HotelSectionHeaderCReusableView")
        
        
        self.tblView.tableHeaderView = self.headerView
        self.tblView.register(UINib(nibName: "\(HotelRoomDetailsTableViewCell.self)", bundle: nil), forCellReuseIdentifier: kReuseHotelRoomDetailsCellID)
        
        self.tblView.register(UINib(nibName: "\(ProductDetailsTableViewCell.self)", bundle: nil), forCellReuseIdentifier: kReuseProductRoomDetailsCellID)
        
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btnforAddToCartclicked(_ sender: Any) {
        
       
    }
    
    // MARK: - TableView Protocol
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 2
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if indexPath.section == 0
        {
            return 160.0
        }
        else
        {
            return 50.0
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        return 0.0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: kReuseHotelRoomDetailsCellID, for: indexPath) as! HotelRoomDetailsTableViewCell
            cell.lblManagerName.text = "XXXX"
            cell.lblAddress.text  = "XXXX"
            cell.lblHotelName.text = "XXXX"
            cell.lblDescription.text = "XXXX"
            

            return cell
        }
        else
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: kReuseProductRoomDetailsCellID, for: indexPath) as! ProductDetailsTableViewCell
          
            
            return cell
            
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
        @IBAction func btnBackClicked(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
}


