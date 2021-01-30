//
//  DashboardHeaderView.swift
//  DukaanApp
//
//  Created by Amandeep on 30/01/21.
//

import UIKit

final class DashboardHeaderView: UITableViewHeaderFooterView {
    
    //MARK: - Props
    @IBOutlet var filterButton: UIButton!
    @IBOutlet var titleLabel: UILabel!

    static let reuseIdentifier: String = "DashboardHeaderView"
    
    static var nib: UINib {
        return UINib(nibName: "DashboardHeaderView", bundle: nil)
    }
    
    
    //MARK: - Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
    
    //MARK: - Setup
    private func setupUI() {
        self.tintColor = .clear
        self.filterButton.setTitleColor(.warmGrey, for: .normal)
        self.filterButton.titleLabel?.font = UIFont.textStyleMedium
        
    }
    //MARK: - Render
    func setup(title: String, buttonTitle: String)  {
        self.titleLabel.text = title
        self.filterButton.setTitle(buttonTitle, for: .normal)
    }
    
    
    
    
}
