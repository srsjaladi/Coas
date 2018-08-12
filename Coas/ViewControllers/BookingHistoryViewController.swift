//
//  BookingHistoryViewController.swift
//  Coas
//
//  Created by Sivaramsingh on 07/08/18.
//  Copyright © 2018 com. All rights reserved.
//

import UIKit
import MBProgressHUD

private let kReuseTableCellID = "BookingHistoryTableViewCell"

class BookingHistoryViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tblView: UITableView!
   
    var arrBookingDetails = [RoomModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
         self.tblView.register(UINib(nibName: "\(BookingHistoryTableViewCell.self)", bundle: nil), forCellReuseIdentifier: kReuseTableCellID)
        
        self.gettingRoomDetials()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func gettingRoomDetials()  {
        MBProgressHUD.showHUDAddedGlobal()
        CoasAPI.sharedInstance.getHistoryRoomBookingDetails((CurrentUser.sharedInstance.user?.id)!, handler: { (allHistoryBRoomDetails, error) in
            if let error: CoasError = error {
                MBProgressHUD.dismissGlobalHUD()
                switch error.code {
                case .Default:
                    self.showErrorAlert(error)
                    break
                default:
                    self.showErrorAlert(error)
                    break
                }
            }
            else
            {
                MBProgressHUD.dismissGlobalHUD()
                self.arrBookingDetails = allHistoryBRoomDetails!
                self.tblView.reloadData()
            }
        })
    }
    
    
    // MARK: - TableView Protocol
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 153
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.arrBookingDetails.count
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: kReuseTableCellID, for: indexPath) as! BookingHistoryTableViewCell
        let Objcurrent = self.arrBookingDetails[indexPath.row]
        
        cell.lblTitle.text = Objcurrent.room_name
        cell.lblCheckIn.text = self.convertToNormalDate(unixStampString: Objcurrent.book_checkin)
        cell.lblCheckOut.text = self.convertToNormalDate(unixStampString: Objcurrent.book_checkout)
        cell.lblOrderId.text = Objcurrent.book_date
        cell.lblAmount.text = Objcurrent.book_amount
        cell.btnCancel.tag = 150 + indexPath.row
        
        return cell
        
        
    }
    
    func convertToNormalDate(unixStampString: String) -> String {
        let epocTime = TimeInterval(unixStampString)! / 1000
        let date = Date(timeIntervalSince1970: epocTime)
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = TimeZone(abbreviation: "GMT") //Set timezone that you want
        dateFormatter.locale = NSLocale.current
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm" //Specify your format that you want
        let strDate = dateFormatter.string(from: date)
        print(strDate)
        
        return strDate
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
//        let homeStoryboard = UIStoryboard(name: "Other", bundle: nil)
//        let rentDetailsVC = homeStoryboard.instantiateViewController(withIdentifier: "BookingRoomDetailsViewController") as! BookingRoomDetailsViewController
//        self.navigationController?.pushViewController(rentDetailsVC, animated: true)
    }

    @IBAction func btnMenuClicked(_ sender: Any) {
        self.openLeft()
    }

}

