//
//  BookingDetailsViewController.swift
//  Coas
//
//  Created by Sivaramsingh on 10/08/18.
//  Copyright © 2018 com. All rights reserved.
//

import UIKit
import MBProgressHUD
private let kReuseGuestCellID = "GuestsTableViewCell"

class BookingDetailsViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,UIPickerViewDataSource,
UIPickerViewDelegate,UITextFieldDelegate {

    @IBOutlet weak var priceView: UIView!
    @IBOutlet weak var btnForBook: UIButton!
    @IBOutlet weak var lblForPrice: UILabel!
    @IBOutlet weak var scrlView: UIScrollView!
    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var tblView: UITableView!
    @IBOutlet weak var bottomView: UIView!
    @IBOutlet weak var txtfldCheckIn: UITextField!
    @IBOutlet weak var txtfldCheckOut: UITextField!
    @IBOutlet weak var txtfldForGuests: UITextField!
    @IBOutlet weak var txtfldForChildrens: UITextField!
    @IBOutlet weak var txtfldForInfants: UITextField!
    @IBOutlet weak var lblForHouseRules: UILabel!
    @IBOutlet weak var lblForPaymentArrangements: UILabel!
    @IBOutlet weak var txtfldName: UITextField!
    @IBOutlet weak var txtfldPhoneNum: UITextField!
    @IBOutlet weak var tblViewConstraint: NSLayoutConstraint!
    fileprivate var adultPicker: UIPickerView!
    fileprivate var childsPicker: UIPickerView!
    fileprivate var infantsPicker: UIPickerView!
    fileprivate var datePicker: UIDatePicker!
    var noOfTextFields : Int = 0
    var noOfChilds : Int = 0
    var noOfInfants : Int = 0
    var arrNums : [String] = ["1","2","3","4","5","6","7"]
    var objCurrent = AllRoomsModel()
    var isHoursClicked: Bool = false
    var isAllFilled : Bool = false
    var isRoomAvailble : Bool = false
    var guestsObject = [AnyObject]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

          self.view.addGestureRecognizer(UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing)))
        
        self.setCheckinDatePicker()
        self.setCheckoutDatePicker()
        adultPicker = UIPickerView()
        adultPicker.delegate = self
        adultPicker.backgroundColor = UIColor.lightGray
        self.txtfldForGuests.inputView = adultPicker
        
        childsPicker = UIPickerView()
        childsPicker.delegate = self
        childsPicker.backgroundColor = UIColor.lightGray
        self.txtfldForChildrens.inputView = childsPicker
        
        infantsPicker = UIPickerView()
        infantsPicker.delegate = self
        infantsPicker.backgroundColor = UIColor.lightGray
        self.txtfldForInfants.inputView = infantsPicker
        self.tblViewConstraint.constant = 0
        self.tblView.register(UINib(nibName: "\(GuestsTableViewCell.self)", bundle: nil), forCellReuseIdentifier: kReuseGuestCellID)
        
        if isHoursClicked {
            self.lblForPrice.text = "$\(self.objCurrent.priceperhour)"
        }
        else
        {
            self.lblForPrice.text = "$\(self.objCurrent.pricepernight)"
        }
        
        self.btnForBook.isEnabled = false
        self.btnForBook.backgroundColor = UIColor.lightGray
        
         self.txtfldCheckIn.addTarget(self, action: #selector(BookingDetailsViewController.textFieldDidChange), for: UIControlEvents.editingChanged)
         self.txtfldCheckOut.addTarget(self, action: #selector(BookingDetailsViewController.textFieldDidChange), for: UIControlEvents.editingChanged)
        
       
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let dfmatter = DateFormatter()
        dfmatter.dateFormat = "dd-MM-YYYY"
        
        let checkIn:Int = Int(dfmatter.date(from: self.txtfldCheckIn.text!)!.timeIntervalSince1970)
        let checkOut:Int = Int(dfmatter.date(from: self.txtfldCheckOut.text!)!.timeIntervalSince1970)
         self.tblViewConstraint.constant =  self.tblView.contentSize.height
        self.getRoomAvailbleForDates(checkin: "\(checkIn)", checkout: "\(checkOut)")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.adultPicker.selectRow(0, inComponent: 0, animated: true)
        self.childsPicker.selectRow(0, inComponent: 0, animated: true)
        self.infantsPicker.selectRow(0, inComponent: 0, animated: true)
        self.pickerView(self.adultPicker, didSelectRow: 0, inComponent: 0)
        self.pickerView(self.childsPicker, didSelectRow: 0, inComponent: 0)
        self.pickerView(self.infantsPicker, didSelectRow: 0, inComponent: 0)
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.tblViewConstraint.constant =  self.tblView.contentSize.height + 20
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        self.tblViewConstraint.constant =  self.tblView.contentSize.height + 20
    }
    fileprivate func setCheckinDatePicker()
    {
        datePicker = UIDatePicker()
        datePicker.backgroundColor = UIColor.lightGray
        datePicker.minimumDate = Date()
        datePicker.datePickerMode = UIDatePickerMode.date
        datePicker.addTarget(self, action: #selector(BookingDetailsViewController.datePickerCheckInValueChanged), for: UIControlEvents.valueChanged)
        self.txtfldCheckIn.inputView = datePicker
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-YYYY"
        self.txtfldCheckIn.text = dateFormatter.string(from: Date())
        
    }
    
    fileprivate func setCheckoutDatePicker()
    {
        datePicker = UIDatePicker()
        datePicker.backgroundColor = UIColor.lightGray
        datePicker.minimumDate = Date()
        datePicker.datePickerMode = UIDatePickerMode.date
        datePicker.addTarget(self, action: #selector(BookingDetailsViewController.datePickerCheckOutValueChanged), for: UIControlEvents.valueChanged)
        self.txtfldCheckOut.inputView = datePicker
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-YYYY"
        self.txtfldCheckOut.text = dateFormatter.string(from: Date())
        
    }
    
    @objc func datePickerCheckInValueChanged(sender:UIDatePicker)
    {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-YYYY"
        self.txtfldCheckIn.text = dateFormatter.string(from: sender.date)
        
        let dfmatter = DateFormatter()
        dfmatter.dateFormat = "dd-MM-YYYY"
        
        let checkIn:Int = Int(dfmatter.date(from: self.txtfldCheckIn.text!)!.timeIntervalSince1970)
        let checkOut:Int = Int(dfmatter.date(from: self.txtfldCheckOut.text!)!.timeIntervalSince1970)
        
        self.getRoomAvailbleForDates(checkin: "\(checkIn)", checkout: "\(checkOut)")
    }
    
    @objc func datePickerCheckOutValueChanged(sender:UIDatePicker)
    {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-YYYY"
        self.txtfldCheckOut.text = dateFormatter.string(from: sender.date)
        
        let dfmatter = DateFormatter()
        dfmatter.dateFormat = "dd-MM-YYYY"
        
        let checkIn:Int = Int(dfmatter.date(from: self.txtfldCheckIn.text!)!.timeIntervalSince1970)
        let checkOut:Int = Int(dfmatter.date(from: self.txtfldCheckOut.text!)!.timeIntervalSince1970)
        
        self.getRoomAvailbleForDates(checkin: "\(checkIn)", checkout: "\(checkOut)")
    }
    

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
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        return true
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
    }
    
    @objc func textFieldDidChange(_ textField: UITextField)
    {
        let dfmatter = DateFormatter()
        dfmatter.dateFormat = "dd-MM-YYYY"
        
        let checkIn:Int = Int(dfmatter.date(from: self.txtfldCheckIn.text!)!.timeIntervalSince1970)
        let checkOut:Int = Int(dfmatter.date(from: self.txtfldCheckOut.text!)!.timeIntervalSince1970)
        
        self.getRoomAvailbleForDates(checkin: "\(checkIn)", checkout: "\(checkOut)")
        
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.layoutIfNeeded()
        
        self.checkValid()
    }
    
    func checkValid()  {
        
        if noOfTextFields > 0 {
            
            self.guestsObject.removeAll()
            for num in 0...noOfTextFields
            {
                let nextTextNameField = self.view.viewWithTag(150 + num) as? UITextField
                let nextTextPhoneNumField = self.view.viewWithTag(350 + num) as? UITextField
                
                if nextTextNameField?.text == "" || nextTextPhoneNumField?.text == ""
                {
                    self.isAllFilled = false
                }
                else
                {
                    if nextTextNameField != nil
                    {
                        if nextTextPhoneNumField != nil
                        {
                            self.isAllFilled = true
                            let objGuestDetail = ["guest_name": nextTextNameField?.text as AnyObject, "guest_phone": nextTextPhoneNumField?.text as AnyObject]
                            
                            self.guestsObject.append(objGuestDetail as AnyObject)
                        }
                        else{
                            self.isAllFilled = false
                        }
                    }
                    else
                    {
                        self.isAllFilled = false
                    }
                   
                }
            }
        }
        
        if self.txtfldName.text == "" || self.txtfldPhoneNum.text == "" {
            self.isAllFilled = false
        }
        else{
            self.isAllFilled = true
        }
        
        
        if self.isAllFilled
        {
            if self.isRoomAvailble
            {
                self.btnForBook.isEnabled = true
                self.btnForBook.backgroundColor = UIColor.sandyBrownColor()
            }
            else
            {
                self.btnForBook.isEnabled = false
                self.showAlert("Room not availble for these dates.")
                self.btnForBook.backgroundColor = UIColor.lightGray
            }
            
        }
        else
        {
            self.btnForBook.isEnabled = false
            self.btnForBook.backgroundColor = UIColor.lightGray
        }
    }
    
    func showAlert(_ str: String) {
        let alertController = UIAlertController(title:"", message: str, preferredStyle: .alert)
        
        let accept = UIAlertAction(title: "Ok", style: .default, handler: nil)
        
        alertController.addAction(accept)
        
        self.present(alertController, animated: true, completion:nil)
    }
    
    //MARK: - UIPickerViewDelegate
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int
    {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int
    {
        return self.arrNums.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?
    {
        if pickerView == adultPicker {
            return self.arrNums[row]
        }
        else if pickerView == childsPicker
        {
            return self.arrNums[row]
        }
        else
        {
            return self.arrNums[row]
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        if pickerView == adultPicker {
            noOfTextFields =  row + 1
            self.tblView.reloadData()
            self.txtfldForGuests.text = self.arrNums[row]
        }
        else if pickerView == childsPicker
        {
            self.txtfldForChildrens.text = self.arrNums[row]
            noOfChilds = Int(self.arrNums[row])!
        }
        else
        {
            self.txtfldForInfants.text = self.arrNums[row]
            noOfInfants = Int(self.arrNums[row])!
        }
    }
    
    
    // MARK: - TableView Protocol
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 50.0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.noOfTextFields
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        return 35.0
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let label : UILabel = UILabel()
        label.frame = CGRect(x: 0, y: 0, width: self.tblView.frame.size.width, height: 35.0)
        label.textAlignment = .left
        label.textColor = UIColor.black
        label.font = UIFont.dinProMedium(17.0)
        if self.noOfTextFields == 0 {
            label.text = ""
        }
        else
        {
             label.text = "  Contact Details of Guests :"
        }
        return label
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: kReuseGuestCellID, for: indexPath) as! GuestsTableViewCell
        cell.txtfldName.delegate = self
        cell.txtfldPhoneNum.delegate = self
        cell.txtfldName.tag = 150 + indexPath.row
        cell.txtfldPhoneNum.tag =  350 + indexPath.row
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    @IBAction func btnBackClicked(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    func getRoomAvailbleForDates(checkin : String,checkout: String)  {
        MBProgressHUD.showHUDAddedGlobal()
        CoasAPI.sharedInstance.getRoomAvailble((CurrentUser.sharedInstance.user?.id)!, room_Id: self.objCurrent.room_id, checkin: checkin, checkout: checkout, handler: { (strStatus, StrCode, error)  in
            
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
                if StrCode == "0"
                {
                    self.isRoomAvailble = false
                    self.btnForBook.setTitle(strStatus, for: .normal)
                }
                else
                {
                    let strTitle =  strStatus! + " Book"
                    self.btnForBook.setTitle(strTitle, for: .normal)
                     self.isRoomAvailble = true
                }
            }
        })
    }
    
    @IBAction func btnForBookClicked(_ sender: Any) {
        
        let dfmatter = DateFormatter()
        dfmatter.dateFormat = "dd-MM-YYYY"
        
        let checkIn:Int = Int(dfmatter.date(from: self.txtfldCheckIn.text!)!.timeIntervalSince1970)
        let checkOut:Int = Int(dfmatter.date(from: self.txtfldCheckOut.text!)!.timeIntervalSince1970)
        
        self.bookRoom(checkin: "\(checkIn)", checkout: "\(checkOut)")
    }
    
    func bookRoom(checkin : String,checkout: String)  {
        MBProgressHUD.showHUDAddedGlobal()
        CoasAPI.sharedInstance.BookRoom((CurrentUser.sharedInstance.user?.id)!, room_Id: self.objCurrent.room_id, checkin: checkin, checkout: checkout, amount: (self.isHoursClicked ? self.objCurrent.priceperhour : self.objCurrent.pricepernight) , em_phone: self.txtfldPhoneNum.text!, em_name: self.txtfldName.text!, book_type: (self.isHoursClicked ? "hour" : "night") , adults: self.txtfldForGuests.text!, children: self.txtfldForChildrens.text!, infants: self.txtfldForInfants.text!, guests:  self.guestsObject, handler: { (strStatus, StrCode, error)  in
            
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
                self.showAlert(strStatus!)
            }
        })
    }
   

}
