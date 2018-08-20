//
//  AddRoomAddressViewController.swift
//  Coas
//
//  Created by Sivaramsingh on 18/08/18.
//  Copyright © 2018 com. All rights reserved.
//

import UIKit

class AddRoomAddressViewController: UIViewController,UIPickerViewDataSource,
UIPickerViewDelegate,UITextFieldDelegate {

    
    @IBOutlet weak var btnNext: UIButton!
    
    @IBOutlet weak var btnBack: UIBarButtonItem!
    @IBOutlet weak var txtfldSelectRoomType: UITextField!
    @IBOutlet weak var txtfldSelectWhatWillGuestsHave: UITextField!
    @IBOutlet weak var txtfldNoOfGuests: UITextField!
    @IBOutlet weak var txtfldBedRooms: UITextField!
    @IBOutlet weak var txtfldBathRoomType: UITextField!
    @IBOutlet weak var txtfldBathroomsForGuests: UITextField!
    @IBOutlet weak var txtfldAddress: UITextField!
    @IBOutlet weak var txtfldZipCode: UITextField!
    @IBOutlet weak var txtfldCity: UITextField!
    @IBOutlet weak var txtfldState: UITextField!
    @IBOutlet weak var txtfldCountry: UITextField!
    
    fileprivate var roomTypePicker: UIPickerView!
    fileprivate var guestHavingPicker: UIPickerView!
    fileprivate var guestsPicker: UIPickerView!
    fileprivate var bedroomsPicker: UIPickerView!
    fileprivate var bathroomPicker: UIPickerView!
    fileprivate var bathroomForGuestsPicker: UIPickerView!
    var noOfGuests : Int = 0
    var noOfBedRooms : Int = 0
    var noOfBathRooms : Int = 0
    
    var arrRoomTypes : [String] = ["Room","House"]
    var arrGuestHavings : [String] = ["Entire House/Room","Shared Room","Private Room"]
    var arrBathRoomType : [String] = ["Private","Shared"]
    var arrNums : [String] = ["1","2","3","4","5","6","7","8","9","10"]
    
        
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        roomTypePicker = UIPickerView()
        roomTypePicker.delegate = self
        roomTypePicker.backgroundColor = UIColor.lightGray
        self.txtfldSelectRoomType.inputView = roomTypePicker
        
        guestHavingPicker = UIPickerView()
        guestHavingPicker.delegate = self
        guestHavingPicker.backgroundColor = UIColor.lightGray
        self.txtfldSelectWhatWillGuestsHave.inputView = guestHavingPicker
        
        guestsPicker = UIPickerView()
        guestsPicker.delegate = self
        guestsPicker.backgroundColor = UIColor.lightGray
        self.txtfldNoOfGuests.inputView = guestsPicker
        
        bedroomsPicker = UIPickerView()
        bedroomsPicker.delegate = self
        bedroomsPicker.backgroundColor = UIColor.lightGray
        self.txtfldBedRooms.inputView = bedroomsPicker
        
        bathroomPicker = UIPickerView()
        bathroomPicker.delegate = self
        bathroomPicker.backgroundColor = UIColor.lightGray
        self.txtfldBathRoomType.inputView = bathroomPicker
        
        bathroomForGuestsPicker = UIPickerView()
        bathroomForGuestsPicker.delegate = self
        bathroomForGuestsPicker.backgroundColor = UIColor.lightGray
        self.txtfldBathroomsForGuests.inputView = bathroomForGuestsPicker
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btnBackClicked(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
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
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.layoutIfNeeded()
        
    }
    
    @IBAction func btnNextClicked(_ sender: Any) {
        let homeStoryboard = UIStoryboard(name: "Room", bundle: nil)
        let addRoomAddressVC = homeStoryboard.instantiateViewController(withIdentifier: "AddBedRommArrangementsVC") as! AddBedRommArrangementsVC
        addRoomAddressVC.noOfBedRooms = self.noOfBedRooms
        self.navigationController?.pushViewController(addRoomAddressVC, animated: true)
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
        if pickerView == self.roomTypePicker
        {
            return self.arrRoomTypes.count
        }
        else if pickerView == self.guestHavingPicker
        {
            return self.arrGuestHavings.count
        }
        else if pickerView == self.bathroomPicker
        {
            return self.arrBathRoomType.count
        }
        else
        {
            return self.arrNums.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?
    {
        if pickerView == self.roomTypePicker {
            return self.arrRoomTypes[row]
        }
        else if pickerView == self.guestHavingPicker
        {
            return self.arrGuestHavings[row]
        }
        else if pickerView == self.bathroomPicker
        {
            return self.arrBathRoomType[row]
        }
        else
        {
            return self.arrNums[row]
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        if pickerView == roomTypePicker {
            
            self.txtfldSelectRoomType.text = self.arrRoomTypes[row]
        }
        else if pickerView == guestHavingPicker
        {
            self.txtfldSelectWhatWillGuestsHave.text = self.arrGuestHavings[row]
        }
        else if pickerView == bathroomPicker
        {
            self.txtfldBathRoomType.text = self.arrBathRoomType[row]
        }
        else if pickerView == guestsPicker
        {
            self.txtfldNoOfGuests.text = self.arrNums[row]
            self.noOfGuests =  Int(self.arrNums[row])!
        }
        else if pickerView == bedroomsPicker
        {
            self.txtfldBedRooms.text = self.arrNums[row]
            self.noOfBedRooms =  Int(self.arrNums[row])!
        }
        else if pickerView == bathroomForGuestsPicker
        {
            self.txtfldBathroomsForGuests.text = self.arrNums[row]
            self.noOfBathRooms = Int(self.arrNums[row])!
        }
    }
    
}
