//
//  ViewController.swift
//  CountryPickerView
//
//  Created by SGI-Mac7 on 14/02/2018.
//  Copyright © 2018 Slash Global. All rights reserved.
//

import UIKit
import CountryPicker
class ViewController: UIViewController, CountryPickerDelegate, UITextFieldDelegate, UITextViewDelegate {
   
    @IBOutlet weak var CountryPicker: CountryPicker!
    
    @IBOutlet weak var LblEmail: UITextField!
    @IBOutlet weak var LblPhoneNo: UITextField!
    @IBOutlet weak var LblName: UITextField!
    @IBOutlet weak var Lblcode: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let locale = Locale.current
        let code = (locale as NSLocale).object(forKey: NSLocale.Key.countryCode) as! String?
        
        CountryPicker.countryPickerDelegate = self
        CountryPicker.showPhoneNumbers = true
        CountryPicker.setCountry(code!)
    }
    
    func countryPhoneCodePicker(_ picker: CountryPicker, didSelectCountryWithName name: String, countryCode: String, phoneCode: String, flag: UIImage) {
        Lblcode.text = phoneCode
    }


    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
            return true
    }
    
        
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if LblName.text == "Name"
        {
            LblName.text = ""
        }
        LblName.becomeFirstResponder()
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if LblName.text == ""
        {
            LblName.text = "Name"
        }
        LblName.resignFirstResponder()
    }
}

