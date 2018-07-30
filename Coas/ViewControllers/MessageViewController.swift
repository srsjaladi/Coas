//
//  MessageViewController.swift
//  Coas
//
//  Created by Sivaramsingh on 28/07/18.
//  Copyright © 2018 com. All rights reserved.
//

import UIKit
private let kReuseTableCellID = "ChatTableViewCell"

class MessageViewController: UIViewController,UITableViewDelegate, UITableViewDataSource  {
    
    
    @IBOutlet weak var tblView: UITableView!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
          self.tblView.register(UINib(nibName: "\(ChatTableViewCell.self)", bundle: nil), forCellReuseIdentifier: kReuseTableCellID)
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
        
        return 100.0
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      
        return 10
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: kReuseTableCellID, for: indexPath) as! ChatTableViewCell
        
       
        return cell
        
        
    }
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
      
    }
    
      // MARK: - UIButton Action Methods
    
    @IBAction func Menuclicked(_ sender: Any) {
        self.openLeft()
    }
    
    @IBAction func SubMenuClicked(_ sender: Any) {
    }
    
    @IBAction func btnAddClicked(_ sender: Any) {
    }
    
}
