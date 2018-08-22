//
//  AddRoomMoreInfoViewController.swift
//  Coas
//
//  Created by Sivaramsingh on 21/08/18.
//  Copyright © 2018 com. All rights reserved.
//

import UIKit
import MBProgressHUD

private let kReuseTableCellID = "FacilitiesTableViewCell"

class AddRoomMoreInfoViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    
    @IBOutlet weak var tblHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var btnBack: UIBarButtonItem!
    @IBOutlet weak var tblView: UITableView!
    var arrAmenitiesDetails = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        arrAmenitiesDetails = ["Climb Stairs","Suitable for Children","Suitable for Infants","Suitable for Pets","Danger Animals","Potential Noise","Survellaince","Weapons","Amenity Limitations"]
        self.tblView.register(UINib(nibName: "\(FacilitesTableViewCell.self)", bundle: nil), forCellReuseIdentifier: kReuseTableCellID)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.tblHeightConstraint.constant = self.tblView.contentSize.height
    }
    // MARK: - TableView Protocol
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 60
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.arrAmenitiesDetails.count
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: kReuseTableCellID, for: indexPath) as! FacilitesTableViewCell
        
        cell.lblTitle.text = self.arrAmenitiesDetails[indexPath.row]
        cell.SwitchForSelect.tag = indexPath.row
        cell.SwitchForSelect.addTarget(self, action: #selector(buttonClicked(sender:)), for: .touchUpInside)
        return cell
        
    }
    
    @objc func buttonClicked(sender: UISwitch) {
        
        sender.isSelected = !sender.isSelected
    }
    
    
    @IBAction func btnBackClicked(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
}
