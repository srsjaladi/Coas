//
//  RentingViewController.swift
//  Coas
//
//  Created by Sivaramsingh on 28/07/18.
//  Copyright © 2018 com. All rights reserved.
//

import UIKit
import MBProgressHUD
import CoreLocation
private let kReuseTableCellID = "RentingTableViewCell"

class RentingViewController: UIViewController,UITableViewDelegate, UITableViewDataSource,AlertInfoVCDelegate,CLLocationManagerDelegate {

    @IBOutlet weak var tblView: UITableView!
    @IBOutlet weak var btnFilter: UIButton!
    var arrRoomDetails = [AllRoomsModel]()
    var locationManager = CLLocationManager()
    var strType: String = ""
    var strMinValue : String = ""
    var strMaxValue : String = ""
    var strRange : String = "0.0"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNeedsStatusBarAppearanceUpdate()
        strMinValue = "0.0"
        strMaxValue = "500.0"
        strType = "hour"
        
        self.locationManager.requestWhenInUseAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.startUpdatingLocation()
        }
        
        // Do any additional setup after loading the view.
          self.tblView.register(UINib(nibName: "\(RentingTableViewCell.self)", bundle: nil), forCellReuseIdentifier: kReuseTableCellID)
        self.gettingAllRoomDetials(strFilter: "and (priceper\(strType) between \(strMinValue)  and \(strMaxValue))")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - TableView Protocol
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 240
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.arrRoomDetails.count
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: kReuseTableCellID, for: indexPath) as! RentingTableViewCell
        
        let ObjCurrent = self.arrRoomDetails[indexPath.row]
        if ObjCurrent.images.count > 0 {
            if let imageURL = URL(string: (ObjCurrent.images[0].image))
            {
                 cell.imgForRenting.af_setImage(
                    withURL: imageURL,
                    placeholderImage: UIImage(named: "Rent"),
                    filter: nil,
                    imageTransition: .crossDissolve(0.1)
                )
            }
        }
        cell.lblForTitle.text = ObjCurrent.room_title
        self.getLocationWith(ObjCurrent.room_longitude, lat: ObjCurrent.room_latitude) { (strAddress, error) in
            cell.lblForSubTitle.text = strAddress
        }
        
        if self.strType == "hour" {
             cell.lblForPrice.text = String(format: "  $\(ObjCurrent.priceperhour)/Hour")
        }
        else
        {
            cell.lblForPrice.text = String(format: "  $\(ObjCurrent.pricepernight)/Night")
        }
       
        
        return cell
        
        
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        self.locationManager = manager
    }
    
    func getLocationWith(
        _ lng: String?,
        lat : String?,
        handler: @escaping (_ cityName :String?,_ error: NSError?) -> Void
        )
    {
        var center : CLLocationCoordinate2D = CLLocationCoordinate2D()
        let lat: Double = Double("\(lat!)")!
        //21.228124
        let lon: Double = Double("\(lng!)")!
        //72.833770
        let ceo: CLGeocoder = CLGeocoder()
        center.latitude = lat
        center.longitude = lon
        
        let loc: CLLocation = CLLocation(latitude:center.latitude, longitude: center.longitude)
        
        
        ceo.reverseGeocodeLocation(loc, completionHandler:
            {(placemarks, error) in
                if (error != nil)
                {
                    print("reverse geodcode fail: \(error!.localizedDescription)")
                    handler("", error! as NSError)
                }
                if placemarks != nil
                {
                    let pm = placemarks! as [CLPlacemark]
                    
                    if pm.count > 0 {
                        let pm = placemarks![0]
                        
                        var addressString : String = ""
                        if pm.subLocality != nil {
                            addressString = addressString + pm.subLocality! + ", "
                        }
                        if pm.thoroughfare != nil {
                            addressString = addressString + pm.thoroughfare! + ", "
                        }
                        if pm.locality != nil {
                            addressString = addressString + pm.locality! + ", "
                        }
                        if pm.country != nil {
                            addressString = addressString + pm.country! + ", "
                        }
                        if pm.postalCode != nil {
                            addressString = addressString + pm.postalCode! + " "
                        }
                        print(addressString)
                        handler(addressString, nil)
                        
                    }
                }
        })
    }
    
    
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let homeStoryboard = UIStoryboard(name: "Other", bundle: nil)
        let rentDetailsVC = homeStoryboard.instantiateViewController(withIdentifier: "BookingRoomDetailsViewController") as! BookingRoomDetailsViewController
        rentDetailsVC.objCurrent = self.arrRoomDetails[indexPath.row]
        self.navigationController?.pushViewController(rentDetailsVC, animated: true)
    }
    
    // MARK: - UIButton Action Methods
    
    @IBAction func btnMEnuClicked(_ sender: Any) {
        self.openLeft()
    }
 
    @IBAction func btnFilterClicked(_ sender: Any) {
        
        let homeStoryboard = UIStoryboard(name: "Home", bundle: nil)
        let alertVC = homeStoryboard.instantiateViewController(withIdentifier: "AlertViewController") as! AlertViewController
        alertVC.delegate = self
        self.navigationController?.present(alertVC, animated: true)
    }
    
    func btnApplyClicked(strRange: String, strMin: String, strMax: String, strType: String) {
        self.strType = strType
        self.strMinValue = strMin
        self.strMaxValue = strMax
        self.strRange =  strRange
        self.gettingAllRoomDetials(strFilter: "and (priceper\(self.strType) between \(self.strMinValue)  and \(self.strMaxValue))")
    }
    
    func btnCancelClicked() {
        
    }
    
    func gettingAllRoomDetials(strFilter : String)  {
        MBProgressHUD.showHUDAddedGlobal()
        CoasAPI.sharedInstance.getAllRoomDetails((CurrentUser.sharedInstance.user?.id)!,filter: strFilter, handler: { (allRoomDetails, error) in
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
                if self.strRange != "0.0"
                {
                    for item in allRoomDetails!
                    {
                        //self.locationManager
                        let location = CLLocation(latitude:Double(item.room_latitude)!, longitude: Double(item.room_latitude)!)
                        let currentLocation = self.locationManager.location
                        let distance = currentLocation!.distance(from: location)
                        
                        if distance <= Double(self.strRange)!
                        {
                            self.arrRoomDetails.append(item)
                        }
                    }
                }
                else
                {
                    self.arrRoomDetails = allRoomDetails!
                }
               
                self.tblView.reloadData()
            }
        })
    }
}
