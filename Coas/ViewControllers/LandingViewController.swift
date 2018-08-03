//
//  LandingViewController.swift
//  Coas
//
//  Created by Sivaramsingh on 28/07/18.
//  Copyright © 2018 com. All rights reserved.
//

import UIKit
import Applozic
import MBProgressHUD

class LandingViewController: UIViewController {
    
    @IBOutlet weak var btnSignin: UIButton!
    @IBOutlet weak var btnBackBtn: UIButton!
    @IBOutlet weak var btnRegister: UIButton!
    @IBOutlet weak var ViewSignIn: UIView!
    @IBOutlet weak var viewSignin2: UIView!
    @IBOutlet weak var viewRegister: UIView!
    @IBOutlet weak var viewRegister2: UIView!
    @IBOutlet weak var btnTopLogin: UIButton!
    @IBOutlet weak var btnTopRegister: UIButton!
    @IBOutlet weak var btnCantSignin: UIButton!
    @IBOutlet weak var txtfldUsername: UITextField!
    @IBOutlet weak var txtfldPassword: UITextField!
    @IBOutlet weak var txtfldFirstname: UITextField!
    @IBOutlet weak var txtfldLastname: UITextField!
    @IBOutlet weak var txtfldPhone: UITextField!
    @IBOutlet weak var txtfldEmail: UITextField!
    @IBOutlet weak var txtfldRegPassword: UITextField!
    @IBOutlet weak var txtfldConfrimPassword: UITextField!
    
    private var isEmailValid = false
    private var isPasswordValid = false
    
    private var isFirstnameValid = false
    private var isLastnameValid = false
    private var isRegEmailValid = false
    private var isPhoneValid = false
    private var isRegPasswordValid = false
    private var isConfirmPasswordValid = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
         setNeedsStatusBarAppearanceUpdate()
        self.navigationController?.navigationBar.isHidden = true
        btnTopLogin.isEnabled = true
        viewSignin2.isHidden = true
        viewRegister2.isHidden = true
        btnBackBtn.isHidden = true
        
        self.txtfldUsername.addTarget(self, action: #selector(LandingViewController.textFieldDidChange), for: UIControlEvents.editingChanged)
        self.txtfldPassword.addTarget(self, action: #selector(LandingViewController.textFieldDidChange), for: UIControlEvents.editingChanged)
        self.txtfldFirstname.addTarget(self, action: #selector(LandingViewController.textFieldDidChange), for: UIControlEvents.editingChanged)
        self.txtfldLastname.addTarget(self, action: #selector(LandingViewController.textFieldDidChange), for: UIControlEvents.editingChanged)
        self.txtfldPhone.addTarget(self, action: #selector(LandingViewController.textFieldDidChange), for: UIControlEvents.editingChanged)
        self.txtfldEmail.addTarget(self, action: #selector(LandingViewController.textFieldDidChange), for: UIControlEvents.editingChanged)
        self.txtfldRegPassword.addTarget(self, action: #selector(LandingViewController.textFieldDidChange), for: UIControlEvents.editingChanged)
        self.txtfldConfrimPassword.addTarget(self, action: #selector(LandingViewController.textFieldDidChange), for: UIControlEvents.editingChanged)
        
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
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

    fileprivate func validSigninEmail() {
        
        if let email = self.txtfldUsername.text, !email.isEmpty && email.count <= 40 && email.isEmail()
        {
            isEmailValid = true
        }
        else
        {
            isEmailValid = false
        }
    }
    
    fileprivate func validSinginPassword() {
        
        if let pw = self.txtfldPassword.text, !pw.isEmpty && pw.count > 0
        {
            isPasswordValid = true
        }
        else
        {
            isPasswordValid = false
        }
    }
    
    fileprivate func validRegisterEmail() {
        
        if let email = self.txtfldEmail.text, !email.isEmpty && email.count <= 40 && email.isEmail()
        {
            isRegEmailValid = true
        }
        else
        {
            isRegEmailValid = false
        }
    }
    
    fileprivate func validRegPassword() {
        
        if let pw = self.txtfldRegPassword.text, !pw.isEmpty && pw.count > 0
        {
            isRegPasswordValid = true
        }
        else
        {
            isRegPasswordValid = false
        }
    }
    
    fileprivate func validFirstname() {
        
        if let name = self.txtfldFirstname.text, !name.isEmpty && name.count <= 40
        {
            isFirstnameValid = true
        }
        else
        {
            isFirstnameValid = false
        }
    }
    
    fileprivate func validLastname() {
        
        if let lastName = self.txtfldLastname.text, !lastName.isEmpty && lastName.count > 0
        {
            isLastnameValid = true
        }
        else
        {
            isLastnameValid = false
        }
    }
    
    fileprivate func validConfirmPassword() {
        
        if let cPw = self.txtfldConfrimPassword.text, !cPw.isEmpty && cPw.count <= 40
        {
            isConfirmPasswordValid = true
        }
        else
        {
            isConfirmPasswordValid = false
        }
    }
    
    fileprivate func validPhone() {
        
        if let phone = self.txtfldPhone.text, !phone.isEmpty && phone.count > 0
        {
            isPhoneValid = true
        }
        else
        {
            isPhoneValid = false
        }
    }
    
    
    //MARK: UITextViewDelegate protocol
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if let nextTextField = self.view.viewWithTag(textField.tag + 1) as? UITextField
        {
            nextTextField.becomeFirstResponder()
            textField.resignFirstResponder()
        }
        else
        {
            textField.resignFirstResponder()
        }
        
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.layoutIfNeeded()
    }
    
    @objc func textFieldDidChange(_ textField: UITextField)
    {
        textField.layoutIfNeeded()
        switch textField {
        case self.txtfldUsername:
            self.isEmailValid = true
            self.validSigninEmail()
            break
        case self.txtfldPassword:
            self.isPasswordValid = true
            self.validSinginPassword()
            break
        case self.txtfldFirstname:
            self.isFirstnameValid = true
            self.validFirstname()
            break
        case self.txtfldLastname:
            self.isLastnameValid = true
            self.validLastname()
            break
        case self.txtfldEmail:
            self.isRegEmailValid = true
            self.validRegisterEmail()
            break
        case self.txtfldRegPassword:
            self.isRegPasswordValid = true
            self.validRegPassword()
            break
        case self.txtfldConfrimPassword:
            self.isConfirmPasswordValid = true
            self.validConfirmPassword()
            break
        case self.txtfldPhone:
            self.isPhoneValid = true
            self.validPhone()
            break
        default:
            break
        }
        
    }
    
    fileprivate func validateSignForm() -> Bool {
        
        if (isEmailValid)
        {
            if (isPasswordValid)
            {
                 return true
            }
            else
            {
                return false
            }
        }
        else
        {
            return false
        }
        
    }
    
    fileprivate func validateRegForm() -> Bool {
        
        if (isFirstnameValid && isLastnameValid && isPhoneValid && isRegEmailValid && isRegPasswordValid && isConfirmPasswordValid)
        {
            return true
        }
        return false
    }
    
    
    func showAlert(_ str: String) {
        let alertController = UIAlertController(title:"", message: str, preferredStyle: .alert)
        
        let accept = UIAlertAction(title: "Ok", style: .default, handler: nil)
        
        alertController.addAction(accept)
        
        self.present(alertController, animated: true, completion:nil)
    }
    
    @IBAction func btnRegisterClicked(_ sender: Any) {
        self.view.endEditing(true)
        if (self.validateRegForm()) {
            self.singup()
        }
        else
        {
            self.showAlert("Please enter all fields with valid data.")
        }
    }
    @IBAction func btnSigninClicked(_ sender: Any) {
        self.view.endEditing(true)
        if (self.validateSignForm()) {
            self.signIn()
        }
        else
        {
            self.showAlert("Please enter all fields with valid data.")
        }
    }
    
    @IBAction func btnTopLoginClicked(_ sender: Any) {
        btnTopLogin.isSelected = !btnTopLogin.isSelected
        
        if btnTopLogin.isSelected {
           btnTopLogin.isEnabled = false
            btnTopLogin.isSelected = false
            let transition = CATransition()
            transition.type = kCATransitionPush
            transition.duration = 0.9
            transition.subtype = kCATransitionFromLeft
            self.viewSignin2.layer.add(transition, forKey: nil)
            viewSignin2.isHidden = false
            viewRegister2.isHidden = true
            btnBackBtn.isHidden = true
        }
       
    }
    
    
    @IBAction func btnCantSignClicked(_ sender: Any) {
        
    }
    
    @IBAction func btnTopRegisterClicked(_ sender: Any) {
        btnTopRegister.isSelected = !btnTopRegister.isSelected
         btnTopLogin.isEnabled = true
        if btnTopRegister.isSelected {
            let transition = CATransition()
            transition.type = kCATransitionPush
            transition.duration = 0.9
            transition.subtype = kCATransitionFromLeft
            self.viewRegister2.layer.add(transition, forKey: nil)
            viewRegister2.isHidden = false
            btnBackBtn.isHidden = false
            viewRegister.isHidden = true
            viewSignin2.isHidden = true
            ViewSignIn.isHidden = true
            
            CATransaction.begin()
            CATransaction.setCompletionBlock {
                
                self.btnBackBtn.isHidden = false
            }
        }
    }
    
    
    @IBAction func btnBackBtnClicked(_ sender: Any) {
       
        self.btnTopRegister.isSelected = false
        self.btnTopLogin.isSelected = false
        btnTopLogin.isEnabled = true
        
        self.view.endEditing(true)
        let transition = CATransition()
        transition.type = kCATransitionPush
        transition.duration = 0.8
        transition.subtype = kCATransitionFromRight
        self.viewRegister2.layer.add(transition, forKey: nil)
        self.viewRegister2.isHidden = true
        
        
        CATransaction.begin()
        CATransaction.setCompletionBlock {
            
            self.viewRegister.isHidden = false
            self.ViewSignIn.isHidden = false
            self.viewSignin2.isHidden = true
            self.btnBackBtn.isHidden = true
            
        }
        
    }
    
    func signIn()
    {
        MBProgressHUD.showHUDAddedGlobal()
        CoasAPI.sharedInstance.signIn((self.txtfldUsername.text?.lowercased())!, password: self.txtfldPassword.text!) { (success, response) -> Void in
            print("signIn()")
            if (success) {
                
                print(response!)
               
                CurrentUser.sharedInstance.save()
                ALUserDefaultsHandler.setUserAuthenticationTypeId(1) 
                let alUser : ALUser =  ALUser()
                let appId = ALChatManager.applicationId
                alUser.applicationId = appId
                alUser.userId = CurrentUser.sharedInstance.user?.coasId
                alUser.email = CurrentUser.sharedInstance.user?.email
                alUser.imageLink = CurrentUser.sharedInstance.user?.image
                alUser.displayName = CurrentUser.sharedInstance.user?.firstName
                alUser.password = self.txtfldPassword.text!
                
                let chatManager = ALChatManager(applicationKey: appId as NSString)
                 MBProgressHUD.showHUDAddedGlobal()
                chatManager.registerUser(alUser) { (response, error) in
                     MBProgressHUD.dismissGlobalHUD()
                    if (error == nil)
                    {
                         MBProgressHUD.dismissGlobalHUD()
                        let appDelegate = UIApplication.shared.delegate as! AppDelegate
                        appDelegate.goToHome(true)
                    }else{
                         MBProgressHUD.dismissGlobalHUD()
                         self.showAlert("Error")
                    }
                }
            }
            else {
                if let error: CoasError = response as? CoasError {
                    switch error.code {
                        
                    case .noInternet:
                        self.showErrorAlert(error)
                    default:
                        self.showErrorAlert(error)
                        break
                    }
                }
                MBProgressHUD.dismissGlobalHUD()
            }
            
        }
    }
    
    
    func singup()  {
        MBProgressHUD.showHUDAddedGlobal()
        CoasAPI.sharedInstance.signUp((self.txtfldEmail.text?.lowercased())!, firstname: self.txtfldFirstname.text!, lastname: self.txtfldLastname.text!, phone:  self.txtfldPhone.text!, password: self.txtfldRegPassword.text!) { (success, response) -> Void in
            
            print(response!)
            if (success) {
                MBProgressHUD.dismissGlobalHUD()
                print(response!)
                CurrentUser.sharedInstance.save()
                
                let alertController = UIAlertController(title: "Success", message: "Please login.", preferredStyle: UIAlertControllerStyle.alert)
                
                let dismissAction = UIAlertAction(title: "Ok", style: UIAlertActionStyle.default) { (action) -> Void in
                    self.btnBackBtnClicked(self.btnBackBtn)
                }
                alertController.addAction(dismissAction)
                self.present(alertController, animated: true, completion: nil)
            
                
            }
            else {
                if let error: CoasError = response as? CoasError {
                    switch error.code {
                    case .Default:
                        self.showErrorAlert(error)
                        break
                    default:
                        self.showErrorAlert(error)
                        break
                    }
                }
                MBProgressHUD.dismissGlobalHUD()
            }
        }
    }
    
    
    
    
}
