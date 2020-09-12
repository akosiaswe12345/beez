//
//  CreateNewAccountViewController.swift
//  MVP
//
//  Created by Taison Digital on 11/09/2020.
//  Copyright © 2020 Taison Digital. All rights reserved.
//

import UIKit

class CreateNewAccountViewController: UIViewController {

    @IBOutlet weak var btnCreateAccount: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initView()
       
    }
    
    func initView(){
          btnGradient()
      
    }
    
    @IBAction func btnBack(_ sender: Any) {
        dismiss(animated: false, completion: nil)
    }
    
    @IBAction func unwindCreateAccount(_ segue: UIStoryboardSegue) {
           
       }
    
    private func btnGradient(){
           let colors = [hexStringToUIColor(hex: "#FFED86"), hexStringToUIColor(hex: "#FFB439")]
           btnCreateAccount.setGradientBackgroundColors(colors, direction: .toBottomLeft, for: .normal)
           btnCreateAccount.layer.cornerRadius = 5
           btnCreateAccount.clipsToBounds = true
       }
    
  

}
