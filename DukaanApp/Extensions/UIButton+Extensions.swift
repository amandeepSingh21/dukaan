//
//  UIButton+Extensions.swift
//  DukaanApp
//
//  Created by Amandeep on 31/01/21.
//

import UIKit

extension UIButton {
    func cancelButton() {
        self.titleLabel?.font = UIFont.textStyleRegular
        self.backgroundColor = .white
        self.setTitleColor(.cherryRed, for: .normal)
        self.setTitle("Cancel order", for: .normal)
        self.layer.cornerRadius = 6
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.cherryRed.cgColor
    }
    
    func shipButton() {
        self.titleLabel?.font = UIFont.textStyleMedium
        self.backgroundColor = .dustyOrange
        self.setTitleColor(.white, for: .normal)
        self.setTitle("Ship order", for: .normal)
        self.layer.cornerRadius = 6
    }
}
