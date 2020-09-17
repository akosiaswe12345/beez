//
//  LikesViewController.swift
//  beez
//
//  Created by Taison Digital on 17/09/2020.
//  Copyright © 2020 Taison Digital. All rights reserved.
//

import UIKit

class likeTableViewCell: UITableViewCell{
    
    @IBOutlet weak var viewLayer: UIView!
    @IBOutlet weak var lblName: UILabel!
    
    override class func awakeFromNib() {
       
    }
    
}

class LikesViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var x = ["test", "test2"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    


}

extension LikesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return x.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
         let cell = tableView.dequeueReusableCell(withIdentifier: "likeTableViewCell", for: indexPath) as! likeTableViewCell
            
        setUpCell(cell: cell, indexPath: indexPath)
        return cell
        
    }
    
    func setUpCell(cell: likeTableViewCell, indexPath: IndexPath){
        cell.lblName.text = x[indexPath.row]
        cell.viewLayer.layer.cornerRadius = 5
        cell.viewLayer.clipsToBounds = true
    }
    
    
}
