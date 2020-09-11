//
//  PhoneNumberVerificationViewController.swift
//  MVP
//
//  Created by Taison Digital on 12/09/2020.
//  Copyright © 2020 Taison Digital. All rights reserved.
//

import UIKit
import SHSPhoneComponentSwift

class PhoneNumberVerificationViewController: UIViewController {
    
    
    @IBOutlet weak var btnContinue: UIButton!
    @IBOutlet weak var tfPhoneNumber: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initView()
      
    }
    
    func initView(){
        btnGradient()
        
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
