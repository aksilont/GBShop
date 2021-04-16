//
//  SceneDelegate.swift
//  GBShop
//
//  Created by Aksilont on 13.02.2021.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene,
               willConnectTo session: UISceneSession,
               options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        let window = UIWindow(windowScene: windowScene)
        let requestFactory = RequestFactory(baseUrl: URL(string: "https://dry-earth-72663.herokuapp.com/")!)
        window.rootViewController = TabBarController(with: requestFactory)
        self.window = window
        window.makeKeyAndVisible()
    }
}
