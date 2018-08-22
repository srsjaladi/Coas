//
//  AddBedRommArrangementsVC.swift
//  Coas
//
//  Created by Sivaramsingh on 18/08/18.
//  Copyright © 2018 com. All rights reserved.
//

import UIKit
private let kReuseTableCellID = "BedRoomArrangementsTableViewCell"

class AddBedRommArrangementsVC: UIViewController,UITableViewDelegate,UITableViewDataSource,AlertBedInfoVCDelegate {

    @IBOutlet weak var btnBack: UIBarButtonItem!
    @IBOutlet weak var tblView: UITableView!
    var noOfBedRooms : Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
         self.tblView.register(UINib(nibName: "\(BedRoomArrangementsTableViewCell.self)", bundle: nil), forCellReuseIdentifier: kReuseTableCellID)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btnBackClicked(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    // MARK: - TableView Protocol
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 90.0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return noOfBedRooms
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: kReuseTableCellID, for: indexPath) as! BedRoomArrangementsTableViewCell
        
        cell.lblTitle.text = "Bedroom\(indexPath.row+1)"
        cell.lblDetails.tag = indexPath.row + 10
        cell.btnAddBeds.tag = indexPath.row + 20
        cell.btnAddBeds.addTarget(self, action: #selector(buttonClicked(sender:)), for: .touchUpInside)
        return cell
        
    }
    
    @objc func buttonClicked(sender: UIButton) {
        
        sender.isSelected = !sender.isSelected
        let homeStoryboard = UIStoryboard(name: "Room", bundle: nil)
        let alertVC = homeStoryboard.instantiateViewController(withIdentifier: "AlertTypeBedViewController") as! AlertTypeBedViewController
        alertVC.delegate = self
        alertVC.currentag = sender.tag
        self.navigationController?.present(alertVC, animated: true)
    }
    
     func btnOkClicked(strSingle: Int, strDouble: Int, strKing: Int, strQueen: Int, currentTag: Int)
    {
        let indexPath = IndexPath(row: (currentTag - 20), section: 0)
        let cell = self.tblView.cellForRow(at: indexPath) as! BedRoomArrangementsTableViewCell?
        cell?.lblDetails.text = "\(strSingle) SingleBeds, \(strDouble) DoubleBeds, \(strKing) KingBeds,\(strQueen) QueenBeds"
    }
}
