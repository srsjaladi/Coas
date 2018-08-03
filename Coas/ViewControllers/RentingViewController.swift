//
//  RentingViewController.swift
//  Coas
//
//  Created by Sivaramsingh on 28/07/18.
//  Copyright © 2018 com. All rights reserved.
//

import UIKit
private let kReuseTableCellID = "RentingTableViewCell"

class RentingViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tblView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNeedsStatusBarAppearanceUpdate()
        // Do any additional setup after loading the view.
          self.tblView.register(UINib(nibName: "\(RentingTableViewCell.self)", bundle: nil), forCellReuseIdentifier: kReuseTableCellID)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - TableView Protocol
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 235
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 10
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: kReuseTableCellID, for: indexPath) as! RentingTableViewCell
        
        
        return cell
        
        
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let homeStoryboard = UIStoryboard(name: "Other", bundle: nil)
        let rentDetailsVC = homeStoryboard.instantiateViewController(withIdentifier: "RentDetailsViewController") as! RentDetailsViewController
        self.navigationController?.pushViewController(rentDetailsVC, animated: true)
    }
    
    // MARK: - UIButton Action Methods
    
    @IBAction func btnMEnuClicked(_ sender: Any) {
        self.openLeft()
    }
 
   
}
