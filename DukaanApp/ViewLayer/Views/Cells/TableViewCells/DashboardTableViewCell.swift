//
//  DashboardTableViewCell.swift
//  DukaanApp
//
//  Created by Amandeep on 30/01/21.
//

import UIKit

class DashboardTableViewCell: UITableViewCell {
    //MARK: - Properties
    var dashboardData: [Dashboard] = []
    static let reuseIdentifier = String(describing: self)
    static var nib: UINib {
        return UINib(nibName: String(describing: self), bundle: nil)
    }
    
    @IBOutlet var collectionView: UICollectionView!
    
    //MARK: - Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
      
    }
    
    private func setupUI() {
        self.collectionView.backgroundColor = .darkWhite
        self.collectionView.register(DashboardCollectionViewCell.nib, forCellWithReuseIdentifier: DashboardCollectionViewCell.reuseIdentifer)
        collectionView.dataSource = self
        collectionView.delegate = self
    }
}

//MARK: - Datasource
extension DashboardTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.dashboardData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DashboardCollectionViewCell.reuseIdentifer, for: indexPath) as! DashboardCollectionViewCell
        let item = dashboardData[indexPath.row]
        cell.setup(item)
        return cell
    }
    
    
}

//MARK: - Layout
extension DashboardTableViewCell: UICollectionViewDelegateFlowLayout {
   
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.frame.width - 48)/2
        return CGSize(width: width, height: 86)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 16
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 16
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 12, left: 16, bottom: 32, right: 16)
    }
    
    
}


