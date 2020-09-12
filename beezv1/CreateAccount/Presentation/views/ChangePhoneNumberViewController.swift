//
//  ChangePhoneNumberViewController.swift
//  beezv1
//
//  Created by Taison Digital on 12/09/2020.
//  Copyright © 2020 Taison Digital. All rights reserved.
//

import UIKit

class ChangePhoneNumberViewController: UIViewController{
    @IBOutlet weak var btnContinue: UIButton!
    
    @IBOutlet weak var tfCode1: SDCTextField!
    @IBOutlet weak var tfCode2: SDCTextField!
    @IBOutlet weak var tfCode3: SDCTextField!
    @IBOutlet weak var tfCode4: SDCTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
         initView()
        
    }
    
    func initView(){
          btnGradient()
          textFieldDelegate()
          textFieldSelector()
    }
    
    func textFieldSelector(){
        tfCode1?.addTarget(self, action: #selector(ForgotPasswordCodeViewController.textFieldDidChange(_:)), for: UIControl.Event.editingChanged)
        tfCode2?.addTarget(self, action: #selector(ForgotPasswordCodeViewController.textFieldDidChange(_:)), for: UIControl.Event.editingChanged)
        tfCode3?.addTarget(self, action: #selector(ForgotPasswordCodeViewController.textFieldDidChange(_:)), for: UIControl.Event.editingChanged)
        tfCode4?.addTarget(self, action: #selector(ForgotPasswordCodeViewController.textFieldDidChange(_:)), for: UIControl.Event.editingChanged)
        
    }
    
    func textFieldDelegate(){
        tfCode1.delegate = self
        tfCode2.delegate = self
        tfCode3.delegate = self
        tfCode4.delegate = self
                
        tfCode1.keyboardType = .numberPad
        tfCode2.keyboardType = .numberPad
        tfCode3.keyboardType = .numberPad
        tfCode4.keyboardType = .numberPad
               
        tfCode1.maxLength = 1
        tfCode2.maxLength = 1
        tfCode3.maxLength = 1
        tfCode4.maxLength = 1
       
    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {
           switch textField {
           case tfCode1:
               if (textField.text?.count)! >= 1{
                   tfCode2?.becomeFirstResponder()
               }
           case tfCode2:
               if (textField.text?.count)! >= 1{
                   tfCode3?.becomeFirstResponder()
               }
           case tfCode3:
               if (textField.text?.count)! >= 1{
                   tfCode4?.becomeFirstResponder()
               }
           case tfCode4:
               if (textField.text?.count)! >= 1{
                   textField.resignFirstResponder()
               }
           default:
               break
           }
       }
    
    
    @IBAction func btnBack(_ sender: Any) {
        dismiss(animated: false, completion: nil)
    }
    
    private func btnGradient(){
        let colors = [hexStringToUIColor(hex: "#FFED86"), hexStringToUIColor(hex: "#FFB439")]
        btnContinue.setGradientBackgroundColors(colors, direction: .toBottomLeft, for: .normal)
        btnContinue.layer.cornerRadius = 5
        btnContinue.clipsToBounds = true
    }
}

extension ChangePhoneNumberViewController: UITextFieldDelegate {
    
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
