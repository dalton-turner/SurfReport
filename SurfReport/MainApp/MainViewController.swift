//
//  MainViewController.swift
//  SurfReport
//
//  Created by Dalton Turner on 7/7/22.
//

import Foundation
import UIKit

class MainViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupTabs()
    }
}

extension MainViewController {
    func setupViews() {
        let spotViewController = SpotViewController()
        let mapViewController = MapViewController()
        let accountViewController = AccountViewController()
        
        spotViewController.setTabBarImage(imageName: "mappin.and.ellipse", title: "Spots")
        mapViewController.setTabBarImage(imageName: "map.fill", title: "Map")
        accountViewController.setTabBarImage(imageName: "figure.wave", title: "Account")
        
        let spotNC = UINavigationController(rootViewController: spotViewController)
        let mapNC = UINavigationController(rootViewController: mapViewController)
        let accountNC = UINavigationController(rootViewController: accountViewController)

        hideNavigationBarLine(spotNC.navigationBar)
        
        let tabBarList = [spotNC, mapNC, accountNC]
        
        viewControllers = tabBarList
    }
    
    private func hideNavigationBarLine(_ navigationBar: UINavigationBar) {
        let img = UIImage()
        navigationBar.shadowImage = img
        navigationBar.setBackgroundImage(img, for: .default)
        navigationBar.isTranslucent = false
    }
    
    private func setupTabs() {
        tabBar.tintColor = .systemCyan
        tabBar.isTranslucent = false
    }
}
