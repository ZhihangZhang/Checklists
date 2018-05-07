//
//  ViewController.swift
//  Checklists
//
//  Created by Zhihang Zhang on 2018-05-05.
//  Copyright © 2018 Zhihang Zhang. All rights reserved.
//

import UIKit

class ChecklistViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: Delegate functions
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // the index path specifies the location of the cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChecklistItem", for: indexPath)
        
        // set different labels for different rows
        let label = cell.viewWithTag(1000) as! UILabel
        
        let remainder = indexPath.row % 5
        if remainder == 0 {
            label.text = "Walk the dog"
        } else if remainder == 1 {
            label.text = "Brush my teeth"
        } else if remainder == 2 {
            label.text = "Learn iOS development"
        } else if remainder == 3 {
            label.text = "Read pragmatic programmer"
        } else if remainder == 4 {
            label.text = "Do the laundry"
        }
        
        
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // toggle the checkmark in the cell
        if let cell = tableView.cellForRow(at: indexPath) { // the cell could be invisible
            if cell.accessoryType == .none {
                cell.accessoryType = .checkmark
            } else {
                cell.accessoryType = .none
            }
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

