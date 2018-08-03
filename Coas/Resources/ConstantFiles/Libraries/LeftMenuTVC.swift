//
//  LeftMenuTVC.swift
//  Kollectin
//
//  Created by Pablo on 1/11/16.
//  Copyright © 2016 Pablo. All rights reserved.
//

import UIKit
import AlamofireImage
import MBProgressHUD

private enum MenuOption: String {
    case Home =  "HOME"
    case MyAccount = "MY ACCOUNT"
    case BookingHistory = "BOOKING HISTORY"
    case ManageYourRooms = "MANAGE YOUR ROOMS"
    case OrderHistroty = "ORDER HISTORY"
    case MyProducts = "MY PRODUCTS"
    case Support = "SUPPORT"
    case ChangePassword = "CHANGE PASSWORD"
    case LogOut = "LOGOUT"
}

class LeftMenuTVC: UIViewController, UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var lblUserName: UILabel!
    fileprivate var rowsList = [[MenuOption]]()
    var containerHomeVC: HomeViewController!
    var myProfileVC: ProfileViewController!
    

    fileprivate var selectedMenu: MenuOption = .Home
    fileprivate var actualAvailableMenuItems: [MenuOption]?
    
    
    var refreshHomeContainer: Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNeedsStatusBarAppearanceUpdate()
        self.customizeSlideMenu()
        self.profileImage.layer.cornerRadius = self.profileImage.frame.width/2;
        self.profileImage.layer.masksToBounds = true
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setNeedsStatusBarAppearanceUpdate()
        rowsList = self.availableMenu()
        if let imageURL = URL(string: (CurrentUser.sharedInstance.user?.image)!)
        {
            self.profileImage.af_setImage(
                withURL: imageURL,
                placeholderImage: UIImage(named: "DefaultImage"),
                filter: nil,
                imageTransition: .crossDissolve(0.3)
            )
        }
        self.lblUserName.text = CurrentUser.sharedInstance.user?.firstName ?? ""
        self.tableView.reloadData()
    }
    

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        NotificationCenter.default.removeObserver(self)
    }
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    @IBAction func logOutPressed(_ sender: UIButton) {
        self.closeLeft()
    }
    
    fileprivate func customizeSlideMenu() {
        self.slideMenuController()?.changeLeftViewWidth(280)
    }
    
    fileprivate func availableMenu() -> [[MenuOption]] {
        
        var menuItems: [[MenuOption]] = []
        
        var list = [MenuOption]()
        list.append(.Home)
        list.append(.MyAccount)
        list.append(.BookingHistory)
        list.append(.ManageYourRooms)
        list.append(.OrderHistroty)
        list.append(.MyProducts)
        list.append(.Support)
        list.append(.ChangePassword)
        list.append(.LogOut)
        menuItems.append(list)
    
        return menuItems
    }
    
    fileprivate func changeViewController(_ menu: MenuOption) {
        switch menu {
        case .Home:
            self.closeLeft()
            let homeStoryboard = UIStoryboard(name: "Home", bundle: nil)
            self.containerHomeVC = homeStoryboard.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
            let navigationController = UINavigationController(rootViewController: self.containerHomeVC)
            navigationController.navigationItem.title = "My Profile"
            self.slideMenuController()?.changeMainViewController(navigationController, close: true)
            break
        case .MyAccount:
//            self.closeLeft()
//            let homeStoryboard = UIStoryboard(name: "Main", bundle: nil)
//            self.myProfileVC = homeStoryboard.instantiateViewController(withIdentifier: "ProfileViewController") as! ProfileViewController
//            let navigationController = UINavigationController(rootViewController: self.myProfileVC)
//            self.slideMenuController()?.changeMainViewController(navigationController, close: true)
            break
        case .LogOut:
            self.closeLeft()
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            appDelegate.goToLogin(true)
            break
         
        default:
            
            break
        }
    }
    
    // MARK: - TableView Protocol
    
     func numberOfSections(in tableView: UITableView) -> Int {
        
        return rowsList.count
    }
    
     func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 50.0
    }
    
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rowsList[section].count
    }
    
     func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        var height :CGFloat = section == 0 ? 0.0 : 30.0
        if UIScreen.main.bounds.height < 481 {
        
            height = 10.0
        }
        return height
    }
    
     func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
    
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 10.0))
        headerView.backgroundColor = UIColor.clear
        return headerView
    }
    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LeftMenuTVCell", for: indexPath) as! LeftMenuTVCell
        
        let rows = rowsList[indexPath.section]
        if let menu:MenuOption = rows[indexPath.row] {
            
            cell.titlemenu.text = menu.rawValue
            cell.picker.image = UIImage(named: menu.rawValue)
        }
        
        return cell
        
    }
    
     func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let menu:MenuOption = rowsList[indexPath.section][indexPath.row]
        {
            if selectedMenu == menu
            {
                closeLeft()
            }
            else
            {
                selectedMenu = menu
                changeViewController(menu)
                tableView.reloadData()
                hasToScroll()
            }
        }
    }
    
    func selectHomeScreen() {
    
        refreshHomeContainer = false
        changeViewController(.Home)
    }
    
  
    
    //MARK - Check tableview table
    
    func hasToScroll() {
        let screenHeight = UIScreen.main.bounds.height
        let headerFrame = self.tableView.tableHeaderView?.frame
        
        let headerSpace : CGFloat = screenHeight > 480 ? 40 : 20
        
        self.tableView.tableHeaderView?.frame = CGRect(
            x: headerFrame!.origin.x,
            y: headerFrame!.origin.y,
            width: headerFrame!.size.width,
            height: headerSpace
        )
        self.tableView.tableHeaderView = self.tableView.tableHeaderView
    }
    
}

