//
//  ForgotPasswordViewController.swift
//  MVP
//
//  Created by Taison Digital on 10/09/2020.
//  Copyright © 2020 Taison Digital. All rights reserved.
//

import UIKit

class ForgotPasswordViewController: UIViewController {
    
    @IBOutlet weak var btnLogin: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initView()
        // Do any additional setup after loading the view.
    }
    
    func initView(){
        btnGradient()
       
    }
    @IBAction func btnBack(_ sender: Any) {
        dismiss(animated: false, completion: nil)
    }
    
    private func btnGradient(){
        let colors = [hexStringToUIColor(hex: "#FFED86"), hexStringToUIColor(hex: "#FFB439")]
        btnLogin.setGradientBackgroundColors(colors, direction: .toBottomLeft, for: .normal)
        btnLogin.layer.cornerRadius = 5
        btnLogin.clipsToBounds = true
    }
       
}
