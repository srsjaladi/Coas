//
//  HomeViewController.swift
//  Coas
//
//  Created by Sivaramsingh on 28/07/18.
//  Copyright © 2018 com. All rights reserved.
//

import UIKit
import MBProgressHUD

class HomeViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
         MBProgressHUD.dismissGlobalHUD()
         setNeedsStatusBarAppearanceUpdate()
        self.navigationController?.navigationBar.isHidden = true

        // Do any additional setup after loading the view.
    }
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    

}
