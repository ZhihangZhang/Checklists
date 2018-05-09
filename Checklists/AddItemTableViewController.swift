//
//  AddItemTableViewController.swift
//  Checklists
//
//  Created by Zhihang Zhang on 2018-05-09.
//  Copyright © 2018 Zhihang Zhang. All rights reserved.
//

import UIKit

class AddItemTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.largeTitleDisplayMode = .never
    }
    
    //MARK: Actions
    @IBAction func cancel(){
        navigationController?.popViewController(animated: true)
    }

    @IBAction func done(){
        navigationController?.popViewController(animated: true)
    }

}
