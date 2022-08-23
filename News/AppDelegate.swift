//
//  AppDelegate.swift
//  News
//
//  Created by Abdullah on 23/08/2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        let navVC = UINavigationController(rootViewController: ViewDIContainer.shared.makeNewsController())
        window?.rootViewController = navVC
        window?.makeKeyAndVisible()
        return true
    }

}

