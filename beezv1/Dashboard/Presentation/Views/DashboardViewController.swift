//
//  DashboardViewController.swift
//  beez
//
//  Created by Taison Digital on 17/09/2020.
//  Copyright © 2020 Taison Digital. All rights reserved.
//

import UIKit

class DashboardViewController: UIViewController {

    @IBOutlet weak var viewLayer: UIView!
    @IBOutlet weak var circleView: UIView!
    @IBOutlet weak var circleView1: UIView!
    @IBOutlet weak var circleView2: UIView!
    @IBOutlet weak var circleView3: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initView()
    }
    
    func initView(){
         setGradientBackground()
         getCircleView()
    }
    

    func setGradientBackground() {
        let colorTop = hexStringToUIColor(hex: "#FFED86").cgColor
        let colorBottom = hexStringToUIColor(hex: "#FFB439").cgColor
                  
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [colorTop, colorBottom]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.frame = self.viewLayer.bounds
              
        self.viewLayer.layer.insertSublayer(gradientLayer, at:0)
    }
    
    func getCircleView(){
        circleView.layer.cornerRadius = circleView.frame.size.width/2
        circleView.clipsToBounds = true
        circleView.layer.borderWidth = 5.0
        circleView.layer.borderColor = UIColor.white.cgColor
        
        circleView1.layer.cornerRadius = circleView1.frame.size.width/2
        circleView1.clipsToBounds = true
        circleView1.layer.borderWidth = 5.0
        circleView1.layer.borderColor = UIColor.white.cgColor
        
        circleView2.layer.cornerRadius = circleView2.frame.size.width/2
        circleView2.clipsToBounds = true
        circleView2.layer.borderWidth = 5.0
        circleView2.layer.borderColor = UIColor.white.cgColor
        
        circleView3.layer.cornerRadius = circleView3.frame.size.width/2
        circleView3.clipsToBounds = true
        circleView3.layer.borderWidth = 5.0
        circleView3.layer.borderColor = UIColor.white.cgColor
    }
}
