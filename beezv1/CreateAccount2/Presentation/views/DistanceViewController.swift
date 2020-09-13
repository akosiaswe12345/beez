//
//  DistanceViewController.swift
//  beez
//
//  Created by Taison Digital on 13/09/2020.
//  Copyright © 2020 Taison Digital. All rights reserved.
//

import UIKit

class DistanceViewController: UIViewController {
    
    @IBOutlet weak var viewLayer: UIView!
    @IBOutlet weak var btnContinue: UIButton!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var lblKM: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
         initView()
    }
    
    func initView(){
        btnGradient()
        progressView()
    }
    
    @IBAction func btnBack(_ sender: Any) {
        dismiss(animated: false, completion: nil)
    }
    
    @IBAction func sliderAge(_ sender: UISlider) {
        let value = slider.value
        let formatted = String(format: "%.3f", value)
        let result = String(formatted.dropFirst(2))
        
     //   lblAgeLimit.text = result
        print("GETVALUE", formatted)
    }
    
    func progressView(){
        let colors = [hexStringToUIColor(hex: "#FFB439").cgColor, hexStringToUIColor(hex: "#FFED86").cgColor]
             
        viewLayer.layer.masksToBounds = true
        viewLayer.layerGradient(startPoint: .centerRight, endPoint: .centerLeft, colorArray: colors, type: .axial)
    }
    
    private func btnGradient(){
           let colors = [hexStringToUIColor(hex: "#FFED86"), hexStringToUIColor(hex: "#FFB439")]
           btnContinue.setGradientBackgroundColors(colors, direction: .toBottomLeft, for: .normal)
           btnContinue.layer.cornerRadius = 5
           btnContinue.clipsToBounds = true
       }
}
