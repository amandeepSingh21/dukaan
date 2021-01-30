//
//  FilterCollectionViewCell.swift
//  DukaanApp
//
//  Created by Amandeep on 31/01/21.
//

import UIKit

class FilterCollectionViewCell: UICollectionViewCell {
    //MARK: - Props
    static let reuseIdentifer = String(describing: self)
    static var nib: UINib {
        return UINib(nibName: String(describing: self), bundle: nil)
    }
    
    @IBOutlet var filterLabel: UILabel!
    
    var isFilterSelected: Bool = false{
        didSet {
            self.filterLabel.backgroundColor = isFilterSelected ? .niceBlueColor : .unselectedButton
            self.filterLabel.textColor = (isFilterSelected ? .white : .warmGrey)
        }
    }
    
    
    //MARK: - Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
        self.setup()
    }
    
    //MARK: - Setup
    func setup() {
        self.filterLabel.clipsToBounds = true
        self.filterLabel.layer.cornerRadius = filterLabel.frame.height/2
    }
    
    //MARK: - Render
    func setup(_ filter: Filter) {
        self.filterLabel.text = filter.name
        isFilterSelected = filter.isSelected
        
    }
    
}
