//
//  AddItemTableViewController.swift
//  Checklists
//
//  Created by Zhihang Zhang on 2018-05-09.
//  Copyright © 2018 Zhihang Zhang. All rights reserved.
//

import UIKit

class AddItemTableViewController: UITableViewController, UITextFieldDelegate{
    //MARK: Properties
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var doneBarButton: UIBarButtonItem!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        navigationItem.largeTitleDisplayMode = .never
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        textField.becomeFirstResponder()
    }
    
    //MARK: Table Delegates
    override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        return nil
    }
    
    //MARK: textField Delegates (it is a PROTOCOL! so there is not method we can override)
    // gets called each time user change the text
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let oldText = textField.text!
        let stringRange = Range(range, in:oldText)!                 // convert NSRange value to Range value
        let newText = oldText.replacingCharacters(in: stringRange,
                                                  with: string)     // replace the oldText with the new one
        doneBarButton.isEnabled = !newText.isEmpty                  // disable the Done button if the new text is empty
        return true
    }
    
    
    
    //MARK: Actions
    @IBAction func cancel(){
        navigationController?.popViewController(animated: true)
    }

    @IBAction func done(){
        print("Contents of the text field: \(textField.text!)")
        navigationController?.popViewController(animated: true)
    }

}
