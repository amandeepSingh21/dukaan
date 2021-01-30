//
//  HomeView.swift
//  DukaanApp
//
//  Created by Amandeep on 30/01/21.
//

import UIKit

class HomeView: UIView {
    //MARK: - Properties
    lazy private var tableView: UITableView = {
        let tableView = UITableView()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.estimatedRowHeight = 100
        tableView.separatorStyle = .none
        tableView.backgroundColor = .darkWhite
        tableView.rowHeight = UITableView.automaticDimension
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    private let viewModel: HomeViewModel
    
    //MARK: - Init
    init(viewModel: HomeViewModel) {
        self.viewModel = viewModel
        super.init(frame: .zero)
        self.backgroundColor = .white
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Setup
    private func setupUI() {
        self.addSubview(tableView)
        tableView.fillSuperview()
        registerCells()
        registerHeaders()
        
    }
    
    private func registerCells() {
        self.tableView.register(ShareTableViewCell.nib, forCellReuseIdentifier: ShareTableViewCell.reuseIdentifier)
        self.tableView.register(OrderTableViewCell.nib, forCellReuseIdentifier: OrderTableViewCell.reuseIdentifier)
        self.tableView.register(DashboardTableViewCell.nib, forCellReuseIdentifier: DashboardTableViewCell.reuseIdentifier)
        
        
    }
    
    private func registerHeaders() {
        self.tableView.register(DashboardHeaderView.nib, forHeaderFooterViewReuseIdentifier: DashboardHeaderView.reuseIdentifier)
        self.tableView.register(OrdersHeaderView.nib, forHeaderFooterViewReuseIdentifier: OrdersHeaderView.reuseIdentifier)
    }
}


//MARK: - Datasource
extension HomeView: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.viewModel.sections.count
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let item = self.viewModel.sections[section]
        switch item.type {
        case .share,.dashboard(_): return 1
        case .orders(let rows): return rows.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = self.viewModel.sections[indexPath.section]
        switch item.type {
        case .share:
            let cell = tableView.dequeueReusableCell(withIdentifier: ShareTableViewCell.reuseIdentifier, for: indexPath)
            return cell
            
        case .dashboard(let rows):
            let cell = tableView.dequeueReusableCell(withIdentifier: DashboardTableViewCell.reuseIdentifier, for: indexPath) as! DashboardTableViewCell
            cell.dashboardData = rows
            return cell
            
        case .orders(let rows):
            let cell = tableView.dequeueReusableCell(withIdentifier: OrderTableViewCell.reuseIdentifier, for: indexPath) as! OrderTableViewCell
            cell.setup(rows[indexPath.row])
            return cell
            
        }
        
        
    }
    
}

//MARK: - HeaderView and sizing
extension HomeView: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let item = self.viewModel.sections[section]
        switch item.type {
        case .dashboard(_):
            let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: DashboardHeaderView.reuseIdentifier) as! DashboardHeaderView
            header.setup(title: item.title, buttonTitle: item.buttonTitle)
            return header
        case .orders(_):
            let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: OrdersHeaderView.reuseIdentifier) as! OrdersHeaderView
            header.setup(item.filters, title: item.title, buttonTitle: item.buttonTitle)
            return header
            
        default: return nil
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        let item = self.viewModel.sections[section]
        switch item.type {
        case .dashboard(_),.orders(_): return UITableView.automaticDimension
        default: return 0.0
        }
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForHeaderInSection section: Int) -> CGFloat {
        let item = self.viewModel.sections[section]
        switch item.type {
        case .dashboard(_),.orders(_): return 30
        default: return 0.0
        }
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        view.layer.zPosition = -1
    }
    
}
