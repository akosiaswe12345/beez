//
//  ProfilePictureViewController.swift
//  beez
//
//  Created by Taison Digital on 16/09/2020.
//  Copyright © 2020 Taison Digital. All rights reserved.
//

import UIKit

class ProfilePictureViewController: UIViewController {

    @IBOutlet weak var circleView: UIView!
    @IBOutlet weak var btnContinue: UIButton!
    @IBOutlet weak var viewLayer: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
         initView()
    }
    
    func initView(){
        btnGradient()
        progressView()
        getCircleView()
    }
    
    func progressView(){
         let colors = [hexStringToUIColor(hex: "#FFB439").cgColor, hexStringToUIColor(hex: "#FFED86").cgColor]
              
         viewLayer.layer.masksToBounds = true
         viewLayer.layerGradient(startPoint: .centerRight, endPoint: .centerLeft, colorArray: colors, type: .axial)
     }
    
    func getCircleView(){
        circleView.layer.cornerRadius = circleView.frame.size.width/2
        circleView.clipsToBounds = true

        circleView.layer.borderColor = hexStringToUIColor(hex: "#E7E9EB").cgColor
        circleView.layer.borderWidth = 5.0
    }
    
    private func btnGradient(){
        let colors = [hexStringToUIColor(hex: "#FFED86"), hexStringToUIColor(hex: "#FFB439")]
        btnContinue.setGradientBackgroundColors(colors, direction: .toBottomLeft, for: .normal)
        btnContinue.layer.cornerRadius = 5
        btnContinue.clipsToBounds = true
    }
    
    @IBAction func btnBack(_ sender: Any) {
        dismiss(animated: false, completion: nil)
    }
    

}
