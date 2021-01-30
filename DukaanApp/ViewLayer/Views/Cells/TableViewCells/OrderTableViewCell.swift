//
//  OrderTableViewCell.swift
//  DukaanApp
//
//  Created by Amandeep on 31/01/21.
//

import UIKit

class OrderTableViewCell: UITableViewCell {
    //MARK: - Properties
    static let reuseIdentifier: String = String(describing: "OrderTableViewCell")
    static var nib: UINib {
        return UINib(nibName: String(describing: "OrderTableViewCell"), bundle: nil)
    }
    
    @IBOutlet var paymentStatusLabel: UILabel!
    @IBOutlet var shipButton: UIButton!
    @IBOutlet var cancelButton: UIButton!
    @IBOutlet var itemPriceLabel: UILabel!
    @IBOutlet var itemNameLabel: UILabel!
    @IBOutlet var itemImageView: UIImageView!
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var orderNumberLabel: UILabel!
    @IBOutlet var containerView: UIView!
    
    //MARK: - Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }

    //MARK: - Setup
    private func setupUI() {
        self.contentView.backgroundColor = .darkWhite
        containerView.layer.cornerRadius = 6
     
        let shadowColor = UIColor(red: 26.0 / 255.0, green: 24.0 / 255.0, blue: 30.0 / 255.0, alpha: 0.04)
        containerView.layer.applySketchShadow(color: shadowColor, alpha: 0.04, x: 0, y: 1, blur: 6, spread: 0)
        self.shipButton.shipButton()
        self.cancelButton.cancelButton()
        self.dateLabel.textColor = .warmGrey
        self.itemNameLabel.textColor = .warmGrey
        self.itemPriceLabel.textColor = .niceBlueColor
        self.paymentStatusLabel.textColor = UIColor.dustyOrange
        self.paymentStatusLabel.backgroundColor = UIColor.dustyOrange.withAlphaComponent(0.15)
        self.paymentStatusLabel.layer.cornerRadius = 3
        self.paymentStatusLabel.clipsToBounds = true
        
    }
    
    //MARK: - Render
    func setup(_ order: Order) {
        self.orderNumberLabel.text = order.orderNumber
        self.dateLabel.text = order.orderDate
        self.itemNameLabel.text = order.orderName
        self.itemPriceLabel.text = order.orderPrice
        self.paymentStatusLabel.text = order.orderType.rawValue
        self.paymentStatusLabel.textColor = order.orderType.textColor
        self.paymentStatusLabel.backgroundColor = order.orderType.backgroundColor
        
    }
    
}
