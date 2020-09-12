//
//  WelcomeToBeeViewController.swift
//  beezv1
//
//  Created by Taison Digital on 12/09/2020.
//  Copyright © 2020 Taison Digital. All rights reserved.
//

import UIKit

class WelcomeToBeeViewController: UIViewController {

    @IBOutlet weak var btnAgree: UIButton!
    @IBOutlet weak var btnCheckBox: UIButton!
    var stateBool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initView()
        
    }
    
    func initView(){
        btnGradient()
        getImage(image: "square.png", state: true, color: "#E2E6E8", mode: 0)
    }
    
    @IBAction func btnCheckBox(_ sender: Any) {
        if stateBool == true {
            getImage(image: "checkbox.png", state: false, color: Constant.Color.PRIMARY_COLOR, mode: 1)
        }else{
            getImage(image: "square.png", state: true, color: "#E2E6E8", mode: 0)
        }
    }
       
    private func getImage(image: String, state: Bool, color: String, mode: Int){
        let image = UIImage(named: image)
        let tintedImage = image?.withRenderingMode(.alwaysTemplate)
        btnCheckBox.setImage(tintedImage , for: .normal)
        
        btnCheckBox.tintColor = hexStringToUIColor(hex: color)
        stateBool = state
        switch mode {
        case 0:
            btnAgree.isEnabled = false
        case 1:
            btnAgree.isEnabled = true
        default: break
        }
    }
    
    private func btnGradient(){
        let colors = [hexStringToUIColor(hex: "#FFED86"), hexStringToUIColor(hex: "#FFB439")]
        btnAgree.setGradientBackgroundColors(colors, direction: .toBottomLeft, for: .normal)
        btnAgree.layer.cornerRadius = 5
        btnAgree.clipsToBounds = true
    }
}
