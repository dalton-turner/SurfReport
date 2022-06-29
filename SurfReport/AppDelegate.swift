//
//  AppDelegate.swift
//  SurfReport
//
//  Created by Dalton Turner on 5/19/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    let loginViewController = LoginViewController()
    let spotViewController = SpotViewController()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.backgroundColor = .systemBackground
        
        loginViewController.delegate = self
        window?.rootViewController = loginViewController
        return true
    }
}

extension AppDelegate: LoginViewControllerDelegate {
    func didLogIn() {
        print("logged in")
        setRootViewController(spotViewController)
    }
}

extension AppDelegate {
    func setRootViewController(_ vc: UIViewController, animated: Bool = true) {
        guard animated, let window = self.window else {
            self.window?.rootViewController = vc
            self.window?.makeKeyAndVisible()
            return
        }
        
        window.rootViewController = vc
        window.makeKeyAndVisible()
        UIView.transition(
            with: window,
            duration: 1,
            options: .transitionCurlUp,
            animations: nil,
            completion: nil)
    }
}
