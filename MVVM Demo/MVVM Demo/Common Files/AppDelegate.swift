//
//  AppDelegate.swift
//  MVVM Demo
//
//  Created by Gauarang Raval on 13/03/25.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window = UIWindow(frame: UIScreen.main.bounds)
        setRootViewController()
        return true
        
    }

    
    // MARK: - RootView Controller
    func setRootViewController() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let navigationController: UINavigationController
        
        if UserDefaultsManager.shared.getLoginStatus() {
            let commentVC = storyboard.instantiateViewController(identifier: "CommentVC") as! CommentVC
            navigationController = UINavigationController(rootViewController: commentVC)
        } else {
            let loginVC = storyboard.instantiateViewController(identifier: "LoginVC") as! LoginVC
            navigationController = UINavigationController(rootViewController: loginVC)
        }
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
    
}

