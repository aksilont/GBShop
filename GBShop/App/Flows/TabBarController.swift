//
//  TabBarController.swift
//  GBShop
//
//  Created by Aksilont on 14.03.2021.
//  Copyright © 2021 Aksilont. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {

    let requestFactory: RequestFactory
    
    init(with requestFactory: RequestFactory) {
        self.requestFactory = requestFactory
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewControllers = createViewControllers()
        tabBar.tintColor = .black
    }

    private func createViewControllers() -> [UIViewController] {
        var controllers = [UIViewController]()
        
        let homeViewController = HomeViewController(nibName: "HomeViewController",
                                                    bundle: nil,
                                                    with: requestFactory)
        homeViewController.title = NSLocalizedString("Home", comment: "")
        homeViewController.tabBarItem = UITabBarItem.init(title: homeViewController.title,
                                                          image: UIImage(systemName: "house.circle"),
                                                          selectedImage: UIImage(systemName: "house.circle.fill"))
        let naviHomeViewController = UINavigationController(rootViewController: homeViewController)
        controllers.append(naviHomeViewController)
        
//        let getReviewsController = GetReviewsViewController(with: requestFactory)
//        getReviewsController.title = NSLocalizedString("Reviews", comment: "")
//        getReviewsController.tabBarItem = UITabBarItem.init(title: getReviewsController.title,
//                                                            image: UIImage(systemName: "book.circle"),
//                                                            selectedImage: UIImage(systemName: "book.circle.fill"))
//        controllers.append(getReviewsController)
        
        let authViewController = AuthViewController(with: requestFactory)
        authViewController.title = NSLocalizedString("Profile", comment: "")
        authViewController.tabBarItem = UITabBarItem.init(title: authViewController.title,
                                                          image: UIImage(systemName: "person.circle"),
                                                          selectedImage: UIImage(systemName: "person.circle.fill"))
        let naviAuthViewController = UINavigationController(rootViewController: authViewController)
        controllers.append(naviAuthViewController)
        
        return controllers
    }
    
}
