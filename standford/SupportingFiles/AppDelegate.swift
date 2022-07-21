//
//  AppDelegate.swift
//  standford
//
//  Created by Bekzod Qahhorov on 20/07/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window =  UIWindow()
        window?.makeKeyAndVisible()
        window?.rootViewController = ViewController()
        return true
    }
}

