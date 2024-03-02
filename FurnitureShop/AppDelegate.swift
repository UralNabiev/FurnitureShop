//
//  AppDelegate.swift
//  FurnitureShop
//
//  Created by O'ral Nabiyev on 02/03/24.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        let vc = FurnitureVC(nibName: "FurnitureVC", bundle: nil)
        window?.rootViewController = vc
        window?.makeKeyAndVisible()
        
        return true
    }


}

