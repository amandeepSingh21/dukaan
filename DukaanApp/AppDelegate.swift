//
//  AppDelegate.swift
//  DukaanApp
//
//  Created by Amandeep on 30/01/21.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let controller = HomeController(viewModel: HomeViewModel())
        UINavigationBar.appearance().isTranslucent = false
        UINavigationBar.appearance().barTintColor = .niceBlueColor
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = UINavigationController(rootViewController: controller)
        window?.makeKeyAndVisible()
        return true
    }
    
    
    
}

