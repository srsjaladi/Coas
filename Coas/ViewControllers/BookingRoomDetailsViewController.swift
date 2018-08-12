//
//  BookingRoomDetailsViewController.swift
//  Coas
//
//  Created by Sivaramsingh on 09/08/18.
//  Copyright © 2018 com. All rights reserved.
//

import UIKit
import CoreLocation

private let kReuseAmenitiesCellID = "reuseAmenitiesTableCellID"
private let kReuseArrangementsTableCellID = "reuseArrangementsTableCellID"
private let kReuseCostCellID = "reuseCostCellID"
private let kReuseHotelRoomDetailsCellID = "reuseHotelRoomDetailsCellID"
private let kReuseAmenitiesCollectionCellID = "reuseAmenitiesCollectionCellID"
private let kReuseArrangementsCollectionCellID = "reuseArrangementsCollectionCellID"

private let kAmenitiesCollectionViewTag = 200
private let kArrangementsCollectionViewTag = 100

class BookingRoomDetailsViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,CLLocationManagerDelegate {

    @IBOutlet weak var tblView: UITableView!
    @IBOutlet weak var btnForBook: UIButton!
    var headerView: HotelSectionHeaderCReusableView!
    var amenitiesHeight : Float = 50.0
    var objCurrent = AllRoomsModel()
    var isHourClicked : Bool = false
    
    weak var AmentitiescollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
         setNeedsStatusBarAppearanceUpdate()
        headerView = (Bundle.main.loadNibNamed("HotelSectionHeaderCReusableView", owner: self, options: nil)![0] as? HotelSectionHeaderCReusableView)
        
        let nibName = UINib(nibName: "HotelSectionHeaderCReusableView", bundle: nil)
        self.tblView.register(nibName, forHeaderFooterViewReuseIdentifier: "HotelSectionHeaderCReusableView")
        if self.objCurrent.images.count > 0
        {
            if let imageURL = URL(string: ( self.objCurrent.images[0].image))
            {
                headerView.ImgView.af_setImage(
                    withURL: imageURL,
                    placeholderImage: UIImage(named: "rent"),
                    filter: nil,
                    imageTransition: .crossDissolve(0.1)
                )
            }
        }
        
        self.tblView.tableHeaderView = self.headerView
        
        self.tblView.register(UINib(nibName: "\(AmenitiesTableViewCell.self)", bundle: nil), forCellReuseIdentifier: kReuseAmenitiesCellID)
        
        self.tblView.register(UINib(nibName: "\(ArrangementsTableViewCell.self)", bundle: nil), forCellReuseIdentifier: kReuseArrangementsTableCellID)
        
        self.tblView.register(UINib(nibName: "\(HotelRoomDetailsTableViewCell.self)", bundle: nil), forCellReuseIdentifier: kReuseHotelRoomDetailsCellID)
        
        self.tblView.register(UINib(nibName: "\(CostTableViewCell.self)", bundle: nil), forCellReuseIdentifier: kReuseCostCellID)

        // Do any additional setup after loading the view.
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        if self.AmentitiescollectionView  != nil {
              self.amenitiesHeight = Float(self.AmentitiescollectionView.contentSize.height)
        }
      
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btnforbookclicked(_ sender: Any) {
    
        let homeStoryboard = UIStoryboard(name: "Other", bundle: nil)
        let bookDetailsVC = homeStoryboard.instantiateViewController(withIdentifier: "BookingDetailsViewController") as! BookingDetailsViewController
        bookDetailsVC.objCurrent = self.objCurrent
        self.navigationController?.pushViewController(bookDetailsVC, animated: true)
    }
    
    // MARK: - TableView Protocol
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 4
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if indexPath.section == 0
        {
            return 160.0
        }
        else if indexPath.section == 1
        {
            return CGFloat(self.amenitiesHeight)
        }
        else if indexPath.section == 2
        {
            return 120.0
        }
        else
        {
            return 50.0
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        if (section == 1 || section == 2)
        {
            return 35.0
        }
        else
        {
            return 0.0
        }
        
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let label : UILabel = UILabel()
        label.frame = CGRect(x: 0, y: 0, width: self.tblView.frame.size.width, height: 35.0)
        label.textAlignment = .center
        label.textColor = UIColor.darkGray
        label.font = UIFont.dinProMedium(15.0)
        if(section == 1){
            label.text = "Amenities"
        } else if (section == 2){
            
            label.text = "Room Arrangements"
        }
        return label
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: kReuseHotelRoomDetailsCellID, for: indexPath) as! HotelRoomDetailsTableViewCell
            cell.lblManagerName.text = self.objCurrent.name
            self.getLocationWith(self.objCurrent.room_longitude, lat: self.objCurrent.room_latitude) { (strAddress, error) in
                cell.lblAddress.text  = strAddress
            }
            cell.lblHotelName.text = self.objCurrent.room_name
            cell.lblDescription.text = self.objCurrent.room_desc
            
            if let imageURL = URL(string: ( self.objCurrent.image))
            {
                cell.imgProfile.af_setImage(
                    withURL: imageURL,
                    placeholderImage: UIImage(named: "profile_picture"),
                    filter: nil,
                    imageTransition: .crossDissolve(0.1)
                )
            }
            
            return cell
        }
        else if indexPath.section == 1
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: kReuseAmenitiesCellID, for: indexPath) as! AmenitiesTableViewCell
            self.AmentitiescollectionView = cell.collectionView
            cell.setCollectionViewDataSourceDelegate(self, forRow: kAmenitiesCollectionViewTag)
            cell.collectionViewOffset = 0
            
            return cell
            
        }
        else if indexPath.section == 2
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: kReuseArrangementsTableCellID, for: indexPath) as! ArrangementsTableViewCell
            cell.setCollectionViewDataSourceDelegate(self, forRow: kArrangementsCollectionViewTag)
            cell.collectionViewOffset = 0
            return cell
        }
        else
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: kReuseCostCellID, for: indexPath) as! CostTableViewCell
            cell.lblHour.text = "$\(self.objCurrent.priceperhour)/hour"
            cell.lblNight.text = "$\(self.objCurrent.pricepernight)/night"
            cell.btnHour.tag = 200
            cell.btnNight.tag = 300
            cell.btnHour.addTarget(self, action: #selector(BookingRoomDetailsViewController.btnHourClicked), for: .touchUpInside)
             cell.btnNight.addTarget(self, action: #selector(BookingRoomDetailsViewController.btnNightClicked), for: .touchUpInside)
            cell.btnHour.isSelected = true
            self.isHourClicked = true
            
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    @objc func btnHourClicked(_ sender: UIButton)
    {
        let btnhour = self.view.viewWithTag((sender).tag) as? UIButton
        let btnNight = self.view.viewWithTag(300) as? UIButton
        btnNight?.isSelected = (btnhour?.isSelected)!
        btnhour?.isSelected = !(btnhour?.isSelected)!
       
        if (btnhour?.isSelected)! {
            isHourClicked = true
        }
        else
        {
            isHourClicked = false
        }
        
    }
    
    @objc func btnNightClicked(_ sender: UIButton)
    {
        let btnNight = self.view.viewWithTag((sender).tag) as? UIButton
        let btnhour = self.view.viewWithTag(200) as? UIButton
        btnhour?.isSelected = (btnNight?.isSelected)!
        btnNight?.isSelected = !(btnNight?.isSelected)!
       
        if (btnhour?.isSelected)! {
            isHourClicked = true
        }
        else
        {
            isHourClicked = false
        }
    }
    
    @IBAction func btnBackClicked(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
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
        })
    }

}

extension BookingRoomDetailsViewController : UICollectionViewDelegate, UICollectionViewDataSource
{
    // MARK: - CollectionView Protocol
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        if (collectionView.tag ==  kAmenitiesCollectionViewTag)
        {
            return self.objCurrent.amenities.count
        }
        else if (collectionView.tag ==  kArrangementsCollectionViewTag)
        {
            return self.objCurrent.bedrooms.count
        }
        else{
            return 0
        }
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        if (collectionView.tag ==  kAmenitiesCollectionViewTag) {
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: kReuseAmenitiesCollectionCellID, for: indexPath) as! AmenitiesCollectionViewCell
            
            if self.objCurrent.amenities.count > 0 {
                if let imageURL = URL(string: (self.objCurrent.amenities[indexPath.row].amenityImage))
                {
                    cell.imgView.af_setImage(
                        withURL: imageURL,
                        placeholderImage: UIImage(named: "wifi"),
                        filter: nil,
                        imageTransition: .crossDissolve(0.1)
                    )
                }
            }
            
            return cell
        }
        else
        {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: kReuseArrangementsCollectionCellID, for: indexPath) as! ArrangementsCollectionViewCell
            
            let objForBedRoom = self.objCurrent.bedrooms[indexPath.row]
            cell.lblTitle.text = objForBedRoom.bedRoomName
            cell.lblType1.text = "\(objForBedRoom.singleBed) SingleBed(s)"
            cell.lblType2.text = "\(objForBedRoom.doubleBed) DoubleBed(s)"
            cell.lblType3.text = "\(objForBedRoom.queen) QueenSizeBed(s), \(objForBedRoom.king) KingSizeBed(s)"
            
            return cell
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
    {
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: IndexPath) -> CGSize {
        
         if (collectionView.tag ==  kAmenitiesCollectionViewTag)
         {
            return CGSize(width: 50.0 , height: 50.0)
        }
        else
         {
            return CGSize(width: 210.0 , height: 110.0)
        }
    }
    
}

