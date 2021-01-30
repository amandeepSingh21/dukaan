//
//  OrdersHeaderView.swift
//  DukaanApp
//
//  Created by Amandeep on 31/01/21.
//

import UIKit

class OrdersHeaderView: UITableViewHeaderFooterView {
    //MARK: - Props
    @IBOutlet var viewAllButton: UIButton!
    @IBOutlet var collectionView: UICollectionView!
    @IBOutlet var titleLabel: UILabel!
    
    static let reuseIdentifier: String = "OrdersHeaderView"
    
    static var nib: UINib {
        return UINib(nibName: "OrdersHeaderView", bundle: nil)
    }
    
    var filters: [Filter] = []
    
    //MARK: - Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
    
    //MARK: - Setup
    private func setupUI() {
        collectionView.backgroundColor = .darkWhite
        self.tintColor = .clear
        self.collectionView.register(FilterCollectionViewCell.nib, forCellWithReuseIdentifier: FilterCollectionViewCell.reuseIdentifer)
        self.viewAllButton.setTitleColor(.warmGrey, for: .normal)
        self.viewAllButton.titleLabel?.font = UIFont.textStyleRegular
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        
    }
    
    //MARK: - Render
    func setup(_ filters: [Filter],title: String, buttonTitle: String)  {
        self.filters = filters
        self.titleLabel.text = title
        self.viewAllButton.setTitle(buttonTitle, for: .normal)
    }
    
    
    
    
}

//MARK: - Filter datasource
extension  OrdersHeaderView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return filters.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FilterCollectionViewCell.reuseIdentifer, for: indexPath) as! FilterCollectionViewCell
        let filter = self.filters[indexPath.row]
        cell.setup(filter)
        return cell
    }
    
    
}

//MARK: - Click event
extension  OrdersHeaderView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedItem  = self.filters[indexPath.row]
        
        self.filters = self.filters.map({ (item) in
            var item = item
            if item.name == selectedItem.name {
                item.isSelected = true
            } else {
                item.isSelected = false
            }
            return item
        })
        self.collectionView.reloadData()
    }
    
    
}

//MARK: - Layout
extension  OrdersHeaderView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 123, height: 32)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 12
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 0, left: 16, bottom: 0, right: 16)
    }
    
}


