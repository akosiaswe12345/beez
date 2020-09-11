//
//  ViewController.swift
//  beezv1
//
//  Created by Taison Digital on 12/09/2020.
//  Copyright © 2020 Taison Digital. All rights reserved.
//

import UIKit
import DTGradientButton

class ViewController: UIViewController {

    @IBOutlet weak var btnLogin: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        initView()
       
    }
    func initView(){
        btnGradient()
    }
    
    private func btnGradient(){
        let colors = [hexStringToUIColor(hex: "#FFED86"), hexStringToUIColor(hex: "#FFB439")]
        btnLogin.setGradientBackgroundColors(colors, direction: .toBottomLeft, for: .normal)
        btnLogin.layer.cornerRadius = 5
        btnLogin.clipsToBounds = true
    }


}

