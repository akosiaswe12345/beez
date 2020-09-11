//
//  ForgetPass2ViewController.swift
//  MVP
//
//  Created by Taison Digital on 11/09/2020.
//  Copyright © 2020 Taison Digital. All rights reserved.
//

import UIKit

class ForgetPass2ViewController: UIViewController {

    @IBOutlet weak var btnValidate: UIButton!
    @IBOutlet weak var tfConfirmPass: UITextField!
    @IBOutlet weak var tfConfirmPass2: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initView()
       
    }
    func initView(){
          btnGradient()
     
     }
    
    @IBAction func btnBack(_ sender: Any) {
        self.performSegue(withIdentifier: "loginVC", sender: nil)
    }
    @IBAction func btnValidate(_ sender: Any) {
      
    }
    
    private func btnGradient(){
        let colors = [hexStringToUIColor(hex: "#FFED86"), hexStringToUIColor(hex: "#FFB439")]
        btnValidate.setGradientBackgroundColors(colors, direction: .toBottomLeft, for: .normal)
        btnValidate.layer.cornerRadius = 5
        btnValidate.clipsToBounds = true
    }


}
