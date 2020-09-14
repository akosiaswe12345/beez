//
//  LoginViewController.swift
//  MVP
//
//  Created by Taison Digital on 10/09/2020.
//  Copyright © 2020 Taison Digital. All rights reserved.
//

import UIKit
import FBSDKLoginKit

class LoginViewController: UIViewController{

    @IBOutlet weak var tfUsername: UITextField!
    @IBOutlet weak var tfPassword: UIShowHideTextField!
    
    @IBOutlet weak var btnLogin: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //tfUsername.becomeFirstResponder()
        initView()
        
        let loginButton = FBLoginButton()
        loginButton.center = view.center
        view.addSubview(loginButton)
        
        NotificationCenter.default.addObserver(forName: .AccessTokenDidChange, object: nil, queue: OperationQueue.main) { (notification) in
            
            // Print out access token
            print("FB Access Token: \(String(describing: AccessToken.current?.tokenString))")
        }
               
    }
    
    func initView(){
        btnGradient()
    
    }
    
    @IBAction func btnBack(_ sender: Any) {
        dismiss(animated: false, completion: nil)
    }
    
    @IBAction func unwindForgotPass(_ segue: UIStoryboardSegue) {
        
    }
    
    private func btnGradient(){
        let colors = [hexStringToUIColor(hex: "#FFED86"), hexStringToUIColor(hex: "#FFB439")]
        btnLogin.setGradientBackgroundColors(colors, direction: .toBottomLeft, for: .normal)
        btnLogin.layer.cornerRadius = 5
        btnLogin.clipsToBounds = true
    }
    
    
    @IBAction func tfUser(_ sender: UITextField) {
        sender.resignFirstResponder()
    }
    
    @IBAction func tf(_ sender: UITextField) {
         sender.resignFirstResponder()
    }
    

}
