//
//  AddRoomNameAndFinalViewController.swift
//  Coas
//
//  Created by Sivaramsingh on 18/08/18.
//  Copyright © 2018 com. All rights reserved.
//

import UIKit

class AddRoomNameAndFinalViewController: UIViewController {

    @IBOutlet weak var imgDefault1: UIImageView!
    @IBOutlet weak var imgDefault2: UIImageView!
    @IBOutlet weak var imgDefault3: UIImageView!
    @IBOutlet weak var txtfldName: UITextField!
    @IBOutlet weak var txtVwDescription: UITextView!
    @IBOutlet weak var txtfldPerHour: UITextField!
    @IBOutlet weak var txtfldPerNight: UITextField!
    @IBOutlet weak var btnBack: UIBarButtonItem!
 
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btnBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    

  

}
