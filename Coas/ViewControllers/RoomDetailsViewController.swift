//
//  RoomDetailsViewController.swift
//  Coas
//
//  Created by Sivaramsingh on 01/08/18.
//  Copyright © 2018 com. All rights reserved.
//

import UIKit

class RoomDetailsViewController: UIViewController,UITextFieldDelegate,UIPickerViewDataSource,
UIPickerViewDelegate {

    @IBOutlet weak var btnBook: UIButton!
    @IBOutlet weak var txtfldAdults: UITextField!
    @IBOutlet weak var txtfldChilds: UITextField!
    @IBOutlet weak var txtfldInfants: UITextField!
    @IBOutlet weak var txtfldDate: UITextField!
    @IBOutlet weak var txtfldCheckinTime: UITextField!
    @IBOutlet weak var txtfldUsername: UITextField!
    @IBOutlet weak var txtfldCheckOutTime: UITextField!
    @IBOutlet weak var txtfldPhoneNum: UITextField!
    
    fileprivate var adultPicker: UIPickerView!
    fileprivate var childsPicker: UIPickerView!
    fileprivate var infantsPicker: UIPickerView!
    fileprivate var datePicker: UIDatePicker!
    fileprivate var timePicker: UIDatePicker!
    
    var arrNums : [String] = ["1","2","3","4","5","6","7"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
         self.view.addGestureRecognizer(UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing)))
        self.setDatePicker()
        self.setTimePicker()
        adultPicker = UIPickerView()
        adultPicker.delegate = self
        adultPicker.backgroundColor = UIColor.lightGray
        self.txtfldAdults.inputView = adultPicker
        
        childsPicker = UIPickerView()
        childsPicker.delegate = self
        childsPicker.backgroundColor = UIColor.lightGray
        self.txtfldChilds.inputView = childsPicker
        
        infantsPicker = UIPickerView()
        infantsPicker.delegate = self
        infantsPicker.backgroundColor = UIColor.lightGray
        self.txtfldInfants.inputView = infantsPicker
        
    }
    
    fileprivate func setDatePicker()
    {
        datePicker = UIDatePicker()
        datePicker.backgroundColor = UIColor.lightGray
        datePicker.minimumDate = Date()
        datePicker.datePickerMode = UIDatePickerMode.date
        datePicker.addTarget(self, action: #selector(RoomDetailsViewController.datePickerValueChanged), for: UIControlEvents.valueChanged)
        txtfldDate.inputView = datePicker
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-YYYY"
        self.txtfldDate.text = dateFormatter.string(from: Date())
        
    }
    
    fileprivate func setTimePicker()
    {
        timePicker = UIDatePicker()
        timePicker.backgroundColor = UIColor.lightGray
        timePicker.minimumDate = Date()
        timePicker.datePickerMode = UIDatePickerMode.time
        timePicker.addTarget(self, action: #selector(RoomDetailsViewController.timePickerValueChanged), for: UIControlEvents.valueChanged)
        txtfldCheckinTime.inputView = timePicker
        txtfldCheckOutTime.inputView = timePicker
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-YYYY"
        self.txtfldDate.text = dateFormatter.string(from: Date())
    }
    
    @objc func datePickerValueChanged(sender:UIDatePicker)
    {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-YYYY"
        self.txtfldDate.text = dateFormatter.string(from: sender.date)
    }
    
    @objc func timePickerValueChanged(sender:UIDatePicker)
    {
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        self.txtfldCheckinTime.text = formatter.string(from: sender.date)
        self.txtfldCheckOutTime.text = formatter.string(from: sender.date)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func btnBookClicked(_ sender: Any) {
        self.showAlert("Alert", message: "Success !! Booked")
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
    
    
    
   
    //MARK: - UIPickerViewDelegate
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int
    {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int
    {
        if pickerView == adultPicker {
            return self.arrNums.count
        }
        else if pickerView == childsPicker
        {
            return 4
        }
        else
        {
            return 3
        }
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
            self.txtfldAdults.text = self.arrNums[row]
        }
        else if pickerView == childsPicker
        {
            self.txtfldChilds.text = self.arrNums[row]
        }
        else
        {
            self.txtfldInfants.text = self.arrNums[row]
        }
    }
    
    
    @IBAction func btnBackClicked(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)
    }
    
    
    func showAlert(_ title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        let action = UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil)
        alertController.addAction(action)
        self.present(alertController, animated: true, completion: nil)
    }
    
    

}
