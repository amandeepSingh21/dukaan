//
//  Dashboard.swift
//  DukaanApp
//
//  Created by Amandeep on 31/01/21.
//

import Foundation

struct Dashboard {
    static let info = [
        Dashboard(title: "ORDER", value: "33"),
        Dashboard(title: "REVENUE", value: "₹2,918"),
        Dashboard(title: "STORE VIEWS", value: "301"),
        Dashboard(title: "PRODUCT VIEWS", value: "19,121")
    ]
    
    let title: String
    let value: String
}
