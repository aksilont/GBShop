//
//  TabBarController.swift
//  GBShop
//
//  Created by Aksilont on 14.03.2021.
//  Copyright © 2021 Aksilont. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewControllers = createViewControllers()
        tabBar.tintColor = .black
    }

    private func createViewControllers() -> [UIViewController] {
        var controllers = [UIViewController]()
        
        let homeViewController = HomeViewController(nibName: "HomeViewController", bundle: nil)
        homeViewController.title = NSLocalizedString("Home", comment: "")
        homeViewController.tabBarItem = UITabBarItem.init(title: homeViewController.title,
                                                          image: UIImage(systemName: "house.circle"),
                                                          selectedImage: UIImage(systemName: "house.circle.fill"))
        controllers.append(homeViewController)
        
        let authViewController = AuthViewController()
        authViewController.title = NSLocalizedString("Profile", comment: "")
        authViewController.tabBarItem = UITabBarItem.init(title: authViewController.title,
                                                          image: UIImage(systemName: "person.circle"),
                                                          selectedImage: UIImage(systemName: "person.circle.fill"))
        let naviAuthViewController = UINavigationController(rootViewController: authViewController)
        controllers.append(naviAuthViewController)
        
        return controllers
    }
    
}
