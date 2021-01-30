//
//  ShareTableViewCell.swift
//  DukaanApp
//
//  Created by Amandeep on 30/01/21.
//

import UIKit

class ShareTableViewCell: UITableViewCell {
    //MARK: - Properties
    static let reuseIdentifier: String = String(describing: "ShareTableViewCell")
    static var nib: UINib {
        return UINib(nibName: String(describing: "ShareTableViewCell"), bundle: nil)
    }
    
    
    @IBOutlet var blueView: UIView!
    @IBOutlet var linkLabel: UILabel!
    @IBOutlet var descLabel: UILabel!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var shareView: UIView!
    @IBOutlet var linkBorderView: UIView!
    
    //MARK: - Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
        
    }
    
    //MARK: - Setup
    private func setupUI() {
        linkBorderView.backgroundColor = .dustyOrange
        self.contentView.backgroundColor = .darkWhite
        self.blueView.backgroundColor = UIColor.niceBlueColor
        self.linkLabel.textColor = UIColor.dustyOrange
        self.descLabel.textColor = UIColor.warmGrey
        self.shareView.layer.cornerRadius = 6
        
        let shadowColor = UIColor(red: 26.0 / 255.0, green: 24.0 / 255.0, blue: 30.0 / 255.0, alpha: 0.04)
        self.shareView.layer.applySketchShadow(color: shadowColor, alpha: 0.04, x: 0, y: 1, blur: 6, spread: 0)
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(didTapLink))
        self.linkLabel.isUserInteractionEnabled = true
        self.linkLabel.addGestureRecognizer(tap)
    }
    
    @objc private func didTapLink() {
        if let url = URL(string: self.linkLabel.text ?? "") {
            UIApplication.shared.open(url)
        }
        
    }
    
    
}
