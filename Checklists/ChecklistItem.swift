//
//  ChecklistItem.swift
//  Checklists
//
//  Created by Zhihang Zhang on 2018-05-08.
//  Copyright © 2018 Zhihang Zhang. All rights reserved.
//

import Foundation


class ChecklistItem: NSObject {
    var text = ""
    var checked = false
    
    func toggleChecked() {
        checked = !checked
    }
}
