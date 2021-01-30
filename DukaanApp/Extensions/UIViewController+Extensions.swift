//
//  UIViewController+Extensions.swift
//  DukaanApp
//
//  Created by Amandeep on 30/01/21.
//

import UIKit

extension UIViewController {
    func setTitle(_ title: String, andImage image: UIImage) {
        let titleLbl = UILabel()
        titleLbl.text = title
        titleLbl.textAlignment = .left
        titleLbl.textColor = UIColor.white
        titleLbl.font = UIFont.textStyleLarge
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.widthAnchor.constraint(equalToConstant: 18).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 18).isActive = true
        let titleView = UIStackView(arrangedSubviews: [titleLbl,imageView])
        titleView.axis = .horizontal
        titleView.spacing = 6
        self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(customView: titleView)
    }
}
