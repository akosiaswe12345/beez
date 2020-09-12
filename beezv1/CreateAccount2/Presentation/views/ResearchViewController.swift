//
//  ResearchViewController.swift
//  beez
//
//  Created by Taison Digital on 13/09/2020.
//  Copyright © 2020 Taison Digital. All rights reserved.
//

import UIKit

class ResearchViewController: UIViewController {
    
    @IBOutlet weak var btnContinue: UIButton!
    @IBOutlet weak var viewLayer: UIView!
    
    @IBOutlet weak var imgMale: UIImageView!
    @IBOutlet weak var imgFemale: UIImageView!
    @IBOutlet weak var imgBoth: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initView()
      
    }
    
    func initView(){
        btnGradient()
        progressView()
        getGenderDefault()
            
    }
    @IBAction func btnBack(_ sender: Any) {
        dismiss(animated: false, completion: nil)
    }
    
    @IBAction func btnGender(_ sender: UIButton) {
        getGender(sender: sender.tag)
    }
    
    func getGender(sender: Int){
        switch sender {
        case 1:
            imageGender(image: "checkCircle.png", image2: "circle.png", int: 1)
        case 2:
            imageGender(image: "checkCircle.png", image2: "circle.png", int: 2)
        case 3:
            imageGender(image: "checkCircle.png", image2: "circle.png", int: 3)
        default:
            break
        }
    }
    
    private func imageGender(image: String, image2: String, int : Int){
        switch int {
        case 1:
            imgMale.image = UIImage(named: image)
            imgFemale.image = UIImage(named: image2)
            imgBoth.image = UIImage(named: image2)
        case 2:
            imgMale.image = UIImage(named: image2)
            imgFemale.image = UIImage(named: image)
            imgBoth.image = UIImage(named: image2)
        case 3:
            imgMale.image = UIImage(named: image2)
            imgFemale.image = UIImage(named: image2)
            imgBoth.image = UIImage(named: image)
        default:
            break
        }
    }
    
    func getGenderDefault(){
        imgMale.image = UIImage(named:  "circle.png")
        imgFemale.image = UIImage(named:  "circle.png")
        imgBoth.image = UIImage(named:  "circle.png")
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
