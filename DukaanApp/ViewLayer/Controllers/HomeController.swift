//
//  ViewController.swift
//  DukaanApp
//
//  Created by Amandeep on 30/01/21.
//

import UIKit

class HomeController: UIViewController {

    //MARK: - Properties
    var rootView: HomeView
    
    
    //MARK: - Init
    init(viewModel: HomeViewModel) {
        rootView = HomeView(viewModel: viewModel)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Lifecycle
    override func loadView() {
        self.view = rootView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.styleNavBar()
        
    }
    
    private func styleNavBar() {
        let navigationBar = navigationController!.navigationBar
        navigationBar.shadowImage = UIImage()
        self.setTitle("Mano Super Market", andImage: UIImage(named: "tick_icon")!)
    }
    
    
}

