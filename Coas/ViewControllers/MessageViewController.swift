//
//  MessageViewController.swift
//  Coas
//
//  Created by Sivaramsingh on 28/07/18.
//  Copyright © 2018 com. All rights reserved.
//

import UIKit
import Applozic

class MessageViewController: UIViewController {
    
    
    @IBOutlet weak var chatContentView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "CHATS"
        self.navigationController?.navigationItem.title = "CHATS"
         setNeedsStatusBarAppearanceUpdate()
        
        ALUserDefaultsHandler.setBottomTabBarHidden(false)
        ALApplozicSettings.setColorForSendMessages(UIColor(red: 213/255, green: 0.0/255, blue: 0.0/255, alpha:1))
        ALApplozicSettings.setColorForReceiveMessages(UIColor(red: 255.0/255, green: 255.0/255, blue: 255.0/255, alpha:1))
        ALApplozicSettings.setUserProfileHidden(false)
        ALApplozicSettings.hideRefreshButton(false)
        ALApplozicSettings.setStatusBarBGColor(UIColor.black)
        ALApplozicSettings.setStatusBarStyle(UIStatusBarStyle.lightContent)
        ALApplozicSettings.setMsgTextViewBGColor(UIColor.clear)
        ALApplozicSettings.setTitleForConversationScreen("CHATS")
        ALApplozicSettings.setGroupOption(false)
        ALApplozicSettings.setColorForNavigationItem(UIColor.white)
        ALApplozicSettings.setColorForNavigation(UIColor.clear)
        ALApplozicSettings.setFontFace("Oswald-Medium")
        ALApplozicSettings.setColorForSendButton(UIColor(red: 213/255, green: 0.0/255, blue: 0.0/255, alpha:1))
        ALApplozicSettings.setDefaultGroupType(Int(PRIVATE.rawValue))
        ALApplozicSettings.setAudioVideoEnabled(true)
        ALApplozicSettings.setNotificationTitle("Chats")
        ALApplozicSettings.setFilterContactsStatus(true)
        ALApplozicSettings.setMsgContainerVC("MessageViewController")
        ALApplozicSettings.setColorForTypeMsgBackground(UIColor.clear)
        
        // Add child view controller view to container
        let story = UIStoryboard(name: "Applozic", bundle: Bundle(for: ALMessagesViewController.self))
        let controller = story.instantiateViewController(withIdentifier: "ALViewController")
        controller.view.frame = self.view.bounds
        self.addChildViewController(controller)
        chatContentView.frame = self.view.frame
        chatContentView.addSubview(controller.view)
        controller.didMove(toParentViewController: self)
        
                
        // Do any additional setup after loading the view.
    }

    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
       
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
    // MARK: - UIButton Action Methods
    
    @IBAction func Menuclicked(_ sender: Any) {
        self.openLeft()
    }
    
   
    @IBAction func SubMenuClicked(_ sender: Any) {
        
    }
    
    @IBAction func btnAddClicked(_ sender: Any) {
        let story = UIStoryboard(name: "Applozic", bundle: Bundle(for: ALNewContactsViewController.self))
        let controller = story.instantiateViewController(withIdentifier: "ALNewContactsViewController")
       self.navigationController?.pushViewController(controller, animated: true)
       
        
    }
    
}
