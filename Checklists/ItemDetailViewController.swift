//
//  itemDetailViewController.swift
//  Checklists
//
//  Created by Zhihang Zhang on 2018-05-09.
//  Copyright © 2018 Zhihang Zhang. All rights reserved.
//

import UIKit

// by specifying class at the end of the protocol signature, only class can adopt this protocol
protocol ItemDetailViewControllerDelegate: class {
    func itemDetailViewControllerDidCancel(_ controller: ItemDetailViewController)
    func itemDetailViewController(_ controller: ItemDetailViewController, didFinishAdding item: ChecklistItem)
    func itemDetailViewController(_ controller: ItemDetailViewController, didFinishEditing item: ChecklistItem)
    
}


class ItemDetailViewController: UITableViewController, UITextFieldDelegate{
    //MARK: Properties
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var doneBarButton: UIBarButtonItem!
    weak var delegate: ItemDetailViewControllerDelegate?
    var itemToEdit: ChecklistItem?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        if let item = itemToEdit {
            title = "Edit Item"
            textField.text = item.text
            doneBarButton.isEnabled = true
        }
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
        delegate?.itemDetailViewControllerDidCancel(self)
    }

    @IBAction func done(){
        if let itemToEdit = itemToEdit {
            // editing mode
            itemToEdit.text = textField.text!
            delegate?.itemDetailViewController(self, didFinishEditing: itemToEdit)
            
        } else {
            // adding mode
            let item = ChecklistItem()
            item.text = textField.text!
            item.checked = false
            
            delegate?.itemDetailViewController(self, didFinishAdding: item)
        }

    }

}
