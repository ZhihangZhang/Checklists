//
//  ViewController.swift
//  Checklists
//
//  Created by Zhihang Zhang on 2018-05-05.
//  Copyright © 2018 Zhihang Zhang. All rights reserved.
//

import UIKit

class ChecklistViewController: UITableViewController {
    // MARK: Properties
    var items: [ChecklistItem]

    // initializer for the view controller
    required init?(coder aDecoder: NSCoder) {
        items = [ChecklistItem]()
        
        let row0item = ChecklistItem()            // let
        row0item.text = "Walk the dog"
        row0item.checked = false
        items.append(row0item)                    // add this line
        
        let row1item = ChecklistItem()            // let
        row1item.text = "Brush my teeth"
        row1item.checked = true
        items.append(row1item)                    // add this line
        
        let row2item = ChecklistItem()            // let
        row2item.text = "Learn iOS development"
        row2item.checked = true
        items.append(row2item)                    // add this line
        
        let row3item = ChecklistItem()            // let
        row3item.text = "Soccer practice"
        row3item.checked = false
        items.append(row3item)                    // add this line
        
        let row4item = ChecklistItem()            // let
        row4item.text = "Eat ice cream"
        row4item.checked = true
        items.append(row4item)                    // add this line
        
        super.init(coder: aDecoder)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: Delegate functions
    // MARK: Data source functions
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    // gets called when table view wants to draw a row on the screen
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        // “IndexPath is simply an object that points to a specific row in the table. ”
        // .row and .section will return the row number and section number
        // this method either recycle an existing cell and create a new copy for the row requested
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChecklistItem", for: indexPath)

        // get the corresponding item from the array
        let item = items[indexPath.row]
        
        // set the cell label
       configureText(for: cell, with: item)
        
        // update the checkmark for the row
        configureCheckmark(for: cell, with: item)
        return cell
    }
    
    // get called when the red delete button is tapped
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        items.remove(at: indexPath.row)
        
        let indexPaths = [indexPath]
        tableView.deleteRows(at: indexPaths, with: .automatic)
    }
    
    // MARK: Delegate functions
    // gets called when the row is selected
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // toggle the checkmark in the cell
        if let cell = tableView.cellForRow(at: indexPath) {
            
            // update the data model
            let item = items[indexPath.row]
            item.toggleChecked()
            
            configureCheckmark(for: cell, with: item)
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    

    
    // MARK: helper functions
    // function configuring the accessory type of a cell
    func configureCheckmark(for cell: UITableViewCell, with item: ChecklistItem){
        if item.checked {
            cell.accessoryType = .checkmark
        }else{
            cell.accessoryType = .none
        }
    }
    
    // configure the label with tag 1000
    func configureText(for cell: UITableViewCell, with item: ChecklistItem){
        let label = cell.viewWithTag(1000) as! UILabel
        label.text = item.text
    }
    
    
    //MARK: Actions
    @IBAction func addItem(){
        let newRowIndex = items.count
        
        let newItem = ChecklistItem()
        newItem.text = "i am a new item!"
        newItem.checked = false
        
        // update data model
        items.append(newItem)
        // update view
        let indexPath = IndexPath(row: newRowIndex, section: 0)
        let indexPaths = [indexPath]
        tableView.insertRows(at: indexPaths, with: .automatic)
    }
    
    
    
}

