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
       
        
        // Add child view controller view to container
        let story = UIStoryboard(name: "Applozic", bundle: Bundle(for: ALMessagesViewController.self))
        let controller = story.instantiateViewController(withIdentifier: "ALViewController")
        addChildViewController(controller)
        chatContentView.frame = self.view.frame
        controller.view.frame = self.view.frame
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
        
       
        
    }
    
}
