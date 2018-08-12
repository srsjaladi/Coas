//
//  AlertViewController.swift
//  Coas
//
//  Created by Sivaramsingh on 11/08/18.
//  Copyright © 2018 com. All rights reserved.
//

import UIKit
protocol AlertInfoVCDelegate
{
    func btnCancelClicked()
    func btnApplyClicked(strRange: String, strMin: String, strMax: String, strType: String)
}

class AlertViewController: UIViewController,UITextFieldDelegate,UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var slideForRange: UISlider!
    @IBOutlet weak var slideForMinPrice: UISlider!
    @IBOutlet weak var slideForMaxPrice: UISlider!
    @IBOutlet weak var lblForRange: UILabel!
    @IBOutlet weak var lblForMinPrice: UILabel!
    @IBOutlet weak var lblForMaxPrice: UILabel!
    @IBOutlet weak var txtfldForType: UITextField!
    @IBOutlet weak var btnClear: UIButton!
    @IBOutlet weak var btnApply: UIButton!
    var delegate: AlertInfoVCDelegate?
    var strType: String = ""
    var strMinValue : String = ""
    var strMaxValue : String = ""
    var strRange : String = "0.0"
    let pickerCustom = UIPickerView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
         self.view.addGestureRecognizer(UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing)))
        self.lblForRange.text = "0.0Km"
        self.lblForMinPrice.text = "$0.0"
        self.lblForMaxPrice.text = "$0.0"
        pickerCustom.delegate = self
        pickerCustom.dataSource =  self
        self.txtfldForType.inputView = pickerCustom
        self.txtfldForType.text = "Hourly"
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        pickerCustom.selectRow(0, inComponent: 0, animated: true)
        self.pickerView(self.pickerCustom, didSelectRow: 0, inComponent: 0)
    }
    
    @IBAction func slideForMaxClicked(_ sender: Any) {
        let value = self.slideForMaxPrice.value
        let currentValue = 100 * value
        print("Slider changing to \(currentValue) ?")
        self.strMaxValue = "\(currentValue)"
        self.lblForMaxPrice.text = "$\(currentValue)"
        
    }
    
    @IBAction func slideForMinClicked(_ sender: Any) {
        let value = self.slideForMinPrice.value
        let currentValue = 100 * value
        print("Slider changing to \(currentValue) ?")
        self.strMinValue = "\(currentValue)"
        self.lblForMinPrice.text = "$\(currentValue)"
    }
    
    @IBAction func slideForRangeClicked(_ sender: Any) {
        let value = self.slideForRange.value
        let currentValue = 10 * value
        self.strRange = "\(currentValue)"
        print("Slider changing to \(currentValue) ?")
        self.lblForRange.text = "\(currentValue)Km"
    }
    
    @IBAction func btnApplyClicked(_ sender: Any) {
        var strType : String = ""
        if self.txtfldForType.text == "Hourly" {
            strType = "hour"
        }
        else{
             strType = "night"
        }
        
        self.delegate?.btnApplyClicked(strRange: self.strRange, strMin: self.strMinValue, strMax: self.strMaxValue, strType: strType)
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func btnClearClicked(_ sender: Any) {
        self.delegate?.btnCancelClicked()
        self.dismiss(animated: true, completion: nil)
        
    }
    
    
    //MARK: - UIPickerViewDelegate
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int
    {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int
    {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?
    {
        if row == 0 {
            return "Hourly"
        }
        else
        {
            return "Nightly"
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        if row  == 0 {
            self.txtfldForType.text = "Hourly"
        }
        else
        {
            self.txtfldForType.text = "Nightly"
        }
    }
    
}
