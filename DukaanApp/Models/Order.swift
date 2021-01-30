//
//  Order.swift
//  DukaanApp
//
//  Created by Amandeep on 31/01/21.
//

import UIKit

struct Order {
    static let orders = [
        Order(orderNumber: "Order #281217", orderDate: "Today, 11:11 PM", orderImage: "", orderName: "1 item", orderPrice: "₹79", orderType: .COD),
        Order(orderNumber: "Order #281217", orderDate: "Today, 11:11 PM", orderImage: "", orderName: "1 item", orderPrice: "₹79", orderType: .PAID)
    ]
    
    let orderNumber: String
    let orderDate: String
    let orderImage: String
    let orderName: String
    let orderPrice: String
    let orderType: OrderType
    
    enum OrderType:String {
        case COD
        case PAID
        
        var textColor: UIColor {
            switch self {
            case .COD: return UIColor.cherryRed
            case .PAID: return UIColor.dustyOrange
            }
        }
        
        var backgroundColor: UIColor {
            switch self {
            case .COD: return UIColor.cherryRed.withAlphaComponent(0.15)
            case .PAID: return UIColor.dustyOrange.withAlphaComponent(0.15)
            }
        }

        
        
    }
}
