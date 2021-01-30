//
//  HomeViewModel.swift
//  DukaanApp
//
//  Created by Amandeep on 30/01/21.
//

import Foundation

class HomeViewModel {
    var sections: [HomeSection] = []
    
    init() {
        sections   = [
            HomeSection(title: "Share", buttonTitle: "Share", type: .share),
            HomeSection(title: "Overview", buttonTitle: "Last Week", type: .dashboard(rows: Dashboard.info)),
            HomeSection(title: "Active Orders", buttonTitle: "View All",filters: Filter.filters, type: .orders(rows: Order.orders))
        ]
    }
    
}

struct HomeSection {
    var title: String
    var buttonTitle: String
    var filters: [Filter] = []
    var type: SectionType
    
}

enum SectionType {
    case share
    case dashboard(rows: [Dashboard])
    case orders(rows: [Order])
    
    
}




