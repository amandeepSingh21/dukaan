//
//  Filter.swift
//  DukaanApp
//
//  Created by Amandeep on 31/01/21.
//

import Foundation

struct Filter {
   static let filters = [
        Filter(name: "Pending (129)",isSelected: false),
        Filter(name: "Accepted (13)",isSelected: true),
        Filter(name: "Shipped (2)",isSelected: false)
    ]
    
    var name: String
    var isSelected = false
}
