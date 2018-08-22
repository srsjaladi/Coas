//
//  AlertTypeBedViewController.swift
//  Coas
//
//  Created by Sivaramsingh on 21/08/18.
//  Copyright © 2018 com. All rights reserved.
//

import UIKit
protocol AlertBedInfoVCDelegate
{
    func btnOkClicked(strSingle: Int, strDouble: Int, strKing: Int, strQueen: Int, currentTag: Int)
}

class AlertTypeBedViewController: UIViewController,UIPickerViewDataSource,
UIPickerViewDelegate,UITextFieldDelegate {

    @IBOutlet weak var btnOk: UIButton!
    @IBOutlet weak var txtfldForSingle: UITextField!
    @IBOutlet weak var txtfldDouble: UITextField!
    @IBOutlet weak var txtfldKing: UITextField!
    @IBOutlet weak var txtfldQueen: UITextField!
    var delegate: AlertBedInfoVCDelegate?
    var valueSingle: Int = 0
    var valueDouble : Int = 0
    var valueKing : Int = 0
    var valueQueen : Int = 0
    let SinglepickerCustom = UIPickerView()
    let DoublepickerCustom = UIPickerView()
    let KingpickerCustom = UIPickerView()
    let QueenpickerCustom = UIPickerView()
    var arrNums : [String] = ["1","2","3","4","5","6","7","8","9","10"]
    var currentag: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        SinglepickerCustom.delegate = self
        SinglepickerCustom.dataSource =  self
        DoublepickerCustom.delegate = self
        DoublepickerCustom.dataSource =  self
        KingpickerCustom.delegate = self
        KingpickerCustom.dataSource =  self
        QueenpickerCustom.delegate = self
        QueenpickerCustom.dataSource =  self
         self.txtfldForSingle.inputView = SinglepickerCustom
         self.txtfldDouble.inputView = DoublepickerCustom
         self.txtfldKing.inputView = KingpickerCustom
         self.txtfldQueen.inputView = QueenpickerCustom
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func btnOkClicked(_ sender: Any) {
        self.delegate?.btnOkClicked(strSingle: Int(self.txtfldForSingle.text!) ?? 0, strDouble: Int(self.txtfldDouble.text!) ?? 0, strKing: Int(self.txtfldKing.text!) ?? 0, strQueen: Int(self.txtfldQueen.text!) ?? 0, currentTag: self.currentag)
        self.dismiss(animated: true, completion: nil)
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
        return self.arrNums[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        if pickerView == SinglepickerCustom {
            
            self.txtfldForSingle.text = self.arrNums[row]
        }
        else if pickerView == DoublepickerCustom
        {
            self.txtfldDouble.text = self.arrNums[row]
        }
        else if pickerView == KingpickerCustom
        {
            self.txtfldKing.text = self.arrNums[row]
        }
        else if pickerView == QueenpickerCustom
        {
            self.txtfldQueen.text = self.arrNums[row]
        }
        
    }

}
