//
//  AddRoomAmetiesViewController.swift
//  Coas
//
//  Created by Sivaramsingh on 18/08/18.
//  Copyright © 2018 com. All rights reserved.
//

import UIKit
import MBProgressHUD
private let kReuseTableCellID = "FacilitiesTableViewCell"

class AddRoomAmetiesViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    
    @IBOutlet weak var btnBack: UIBarButtonItem!
    @IBOutlet weak var tblView: UITableView!
    var arrAmenitiesDetails = [AmenitiesModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.tblView.register(UINib(nibName: "\(FacilitesTableViewCell.self)", bundle: nil), forCellReuseIdentifier: kReuseTableCellID)
        self.gettingAllAmenitiesDetials()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func gettingAllAmenitiesDetials()  {
        MBProgressHUD.showHUDAddedGlobal()
        CoasAPI.sharedInstance.getAmenitiesDetails(handler: { (allAmenitiesDetails, error) in
            if let error: CoasError = error {
                MBProgressHUD.dismissGlobalHUD()
                switch error.code {
                case .Default:
                    self.showErrorAlert(error)
                    break
                default:
                    self.showErrorAlert(error)
                    break
                }
            }
            else
            {
                MBProgressHUD.dismissGlobalHUD()
                self.arrAmenitiesDetails = allAmenitiesDetails!
                self.tblView.reloadData()
            }
        })
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
        
        let ObjCurrent = self.arrAmenitiesDetails[indexPath.row]
        cell.lblTitle.text = ObjCurrent.amenity
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
