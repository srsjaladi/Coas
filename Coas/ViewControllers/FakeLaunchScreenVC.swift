//
//  FakeLaunchScreenVC.swift
//  Kollectin
//
//  Created by Pablo on 3/4/16.
//  Copyright © 2016 Pablo. All rights reserved.
//

import UIKit
import MBProgressHUD


class FakeLaunchScreenVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
       setNeedsStatusBarAppearanceUpdate()
        self.startUpRequests()
        
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    fileprivate func startUpRequests()
    {
        MBProgressHUD.showHUDAddedGlobal()
        CurrentUser.sharedInstance.getUser(handler: {(user) -> () in
            
            if user != nil
            {
                let delayTime = DispatchTime.now() + Double(Int64(0.3 * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC)
                DispatchQueue.main.asyncAfter(deadline: delayTime) {
                    let appDelegate = UIApplication.shared.delegate as! AppDelegate
                    appDelegate.goToHome(true, afterLaunchScreen: true)
                }
                
            }
            else
            {
                MBProgressHUD.dismissGlobalHUD()
                CurrentUser.sharedInstance.logOut()
            }
           
        })
    }
    
    
    
}
