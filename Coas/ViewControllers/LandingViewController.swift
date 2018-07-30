//
//  LandingViewController.swift
//  Coas
//
//  Created by Sivaramsingh on 28/07/18.
//  Copyright © 2018 com. All rights reserved.
//

import UIKit

class LandingViewController: UIViewController {
    
    @IBOutlet weak var btnSignin: UIButton!
    @IBOutlet weak var btnRegister: UIButton!
    @IBOutlet weak var ViewSignIn: UIView!
    @IBOutlet weak var viewSignin2: UIView!
    @IBOutlet weak var viewRegister: UIView!
    @IBOutlet weak var viewRegister2: UIView!
    @IBOutlet weak var btnTopLogin: UIButton!
    @IBOutlet weak var btnTopRegister: UIButton!
    @IBOutlet weak var btnCantSignin: UIButton!
    
 
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
        
        viewSignin2.isHidden = true
        viewRegister2.isHidden = true
    
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillAppear(animated)
         self.navigationController?.navigationBar.isHidden = false
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        self.navigationController?.navigationBar.isHidden = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btnRegisterClicked(_ sender: Any) {
        self.view.endEditing(true)
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.goToHome(true)
    }
    @IBAction func btnSigninClicked(_ sender: Any) {
        self.view.endEditing(true)
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.goToHome(true)
    }
    
    @IBAction func btnTopLoginClicked(_ sender: Any) {
        btnTopLogin.isSelected = !btnTopLogin.isSelected
        
        if btnTopLogin.isSelected {
            let transition = CATransition()
            transition.type = kCATransitionPush
            transition.duration = 0.9
            transition.subtype = kCATransitionFromLeft
            self.viewSignin2.layer.add(transition, forKey: nil)
            viewSignin2.isHidden = false
            viewRegister2.isHidden = true
        }
       
    }
    
    
    @IBAction func btnCantSignClicked(_ sender: Any) {
    }
    
    @IBAction func btnTopRegisterClicked(_ sender: Any) {
        btnTopRegister.isSelected = !btnTopRegister.isSelected
        
        if btnTopRegister.isSelected {
            let transition = CATransition()
            transition.type = kCATransitionPush
            transition.duration = 0.9
            transition.subtype = kCATransitionFromLeft
            self.viewRegister2.layer.add(transition, forKey: nil)
            viewRegister2.isHidden = false
            viewRegister.isHidden = true
            viewSignin2.isHidden = true
            ViewSignIn.isHidden = true
        }
    }
    
    
    
    
    
    
    
    
    
}
