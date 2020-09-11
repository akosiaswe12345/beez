//
//  DialogPasswordViewController.swift
//  MVP
//
//  Created by Taison Digital on 11/09/2020.
//  Copyright © 2020 Taison Digital. All rights reserved.
//

import UIKit

class DialogPasswordViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func btnBackToLogin(_ sender: Any) {
        self.performSegue(withIdentifier: "loginVC", sender: nil)
    }

}
