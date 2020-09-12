//
//  PhoneNumberVerificationViewController.swift
//  MVP
//
//  Created by Taison Digital on 12/09/2020.
//  Copyright © 2020 Taison Digital. All rights reserved.
//

import UIKit


class PhoneNumberVerificationViewController: UIViewController {
  
    @IBOutlet weak var btnContinue: UIButton!
    @IBOutlet weak var tfPhoneNumber: SDCTextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initView()
    }
    
    func initView(){
        btnGradient()
        getTextField()
    }
    
    func getTextField(){
        tfPhoneNumber.text = "+33"
        tfPhoneNumber.keyboardType = .numberPad
        tfPhoneNumber.maxLength = 13
        tfPhoneNumber.delegate = self
    }
    
    @IBAction func btnSelectPhone(_ sender: Any) {
        let picker = ADCountryPicker(style: .grouped)
        // delegate
        picker.delegate = self

        // Display calling codes
        picker.showCallingCodes = true

        // or closure
        picker.didSelectCountryClosure = { name, code in
        _ = picker.navigationController?.popToRootViewController(animated: true)
            print(code)
        }
                
                
        //        Use this below code to present the picker
                
        let pickerNavigationController = UINavigationController(rootViewController: picker)
        self.present(pickerNavigationController, animated: true, completion: nil)

    }
    @IBAction func btnClose(_ sender: Any) {
        self.performSegue(withIdentifier: "createAccountVC", sender: nil)
    }
    
    private func btnGradient(){
        let colors = [hexStringToUIColor(hex: "#FFED86"), hexStringToUIColor(hex: "#FFB439")]
        btnContinue.setGradientBackgroundColors(colors, direction: .toBottomLeft, for: .normal)
        btnContinue.layer.cornerRadius = 5
        btnContinue.clipsToBounds = true
    }
}

extension PhoneNumberVerificationViewController: ADCountryPickerDelegate {
    
    func countryPicker(_ picker: ADCountryPicker, didSelectCountryWithName name: String, code: String, dialCode: String) {
        _ = picker.navigationController?.popToRootViewController(animated: true)
        self.dismiss(animated: true, completion: nil)
//        countryNameLabel.text = name
//        countryCodeLabel.text = code
        tfPhoneNumber.text = dialCode
        
//       let x =  picker.getFlag(countryCode: code)
//        let xx =  picker.getCountryName(countryCode: code)
//        let xxx =  picker.getDialCode(countryCode: code)
    }
}

extension PhoneNumberVerificationViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {

        // Verify all the conditions
        if let sdcTextField = textField as? SDCTextField {
            return sdcTextField.verifyFields(shouldChangeCharactersIn: range, replacementString: string)
        }
       return true
    }
    
}
