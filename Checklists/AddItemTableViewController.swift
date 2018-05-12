//
//  AddItemTableViewController.swift
//  Checklists
//
//  Created by Zhihang Zhang on 2018-05-09.
//  Copyright © 2018 Zhihang Zhang. All rights reserved.
//

import UIKit

// by specifying class at the end of the protocol signature, only class can adopt this protocol
protocol AddItemTableViewControllerDelegate: class {
    func addItemTableViewControllerDidCancel(_ controller: AddItemTableViewController)
    func addItemTableViewController(_ controller: AddItemTableViewController, didFinishAdding item: ChecklistItem)
}


class AddItemTableViewController: UITableViewController, UITextFieldDelegate{
    //MARK: Properties
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var doneBarButton: UIBarButtonItem!
    weak var delegate: AddItemTableViewControllerDelegate?
    
    
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
    
    //MARK: textField Delegates
    // (it is a PROTOCOL!)
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
    // sending messages to its delegate (by executing its methods)
    @IBAction func cancel(){
        delegate?.addItemTableViewControllerDidCancel(self)
    }

    @IBAction func done(){
        let item = ChecklistItem()
        item.text = textField.text!
        item.checked = false
        
        delegate?.addItemTableViewController(self, didFinishAdding: item)
    }

}
