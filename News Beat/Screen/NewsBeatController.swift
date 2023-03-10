//
//  ViewController.swift
//  News Beat
//
//  Created by Batuhan Yılmaz on 8.03.2023.
//

import UIKit

class NewsBeatController: UIViewController {
    
    let fetchData = ApıCall()
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData.fetchData()
    }
  
    
}


