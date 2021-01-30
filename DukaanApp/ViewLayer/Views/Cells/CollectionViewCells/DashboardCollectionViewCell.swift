//
//  DashboardCollectionViewCell.swift
//  DukaanApp
//
//  Created by Amandeep on 30/01/21.
//

import UIKit

class DashboardCollectionViewCell: UICollectionViewCell {
    
    static let reuseIdentifer = String(describing: self)
    static var nib: UINib {
        return UINib(nibName: String(describing: self), bundle: nil)
    }
    
    @IBOutlet var containerView: UIView!
    @IBOutlet var valueLabel: UILabel!
    @IBOutlet var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
    
    private func setupUI() {
        containerView.layer.cornerRadius = 6
     
        self.titleLabel.textColor = .warmGrey
        let shadowColor = UIColor(red: 26.0 / 255.0, green: 24.0 / 255.0, blue: 30.0 / 255.0, alpha: 0.04)
        containerView.layer.applySketchShadow(color: shadowColor, alpha: 0.04, x: 0, y: 1, blur: 6, spread: 0)
    }
    
    func setup(_ data: Dashboard) {
        self.titleLabel.text = data.title
        self.valueLabel.text = data.value
    }
    
}
