//
//  RentDetailsViewController.swift
//  Coas
//
//  Created by Sivaramsingh on 01/08/18.
//  Copyright © 2018 com. All rights reserved.
//

import UIKit

class RentDetailsViewController: UIViewController {

    
    @IBOutlet weak var btnBook: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func btnBookClicked(_ sender: Any) {
        
        let homeStoryboard = UIStoryboard(name: "Other", bundle: nil)
        let roomDetailsVC = homeStoryboard.instantiateViewController(withIdentifier: "RoomDetailsViewController") as! RoomDetailsViewController
        self.navigationController?.pushViewController(roomDetailsVC, animated: true)
        
    }
    

}
