//
//  AuthRouter.swift
//  GBShop
//
//  Created by Aksilont on 10.03.2021.
//

import UIKit

protocol AuthRoutingLogic {
    func routeToSignUp()
    func routeToChangeUserData()
}

protocol AuthDataPassing {
    var dataStore: AuthDataStore? { get }
}

class AuthRouter: AuthRoutingLogic, AuthDataPassing {
    
    // MARK: - Public
    
    weak var viewController: AuthViewController?
    var dataStore: AuthDataStore?
    
    // MARK: - AuthRoutingLogic
    
    func routeToSignUp() {
        guard let viewController = viewController else { fatalError("Fail route to Sign Up") }
        let signUpVC = SignUpViewController(with: viewController.requestFactory)
        navigateToNext(source: viewController, destination: signUpVC)
    }
    
    func routeToChangeUserData() {
        guard let viewController = viewController else { fatalError("Fail route to Change User Data") }
        let changeUserDataVC = ChangeUserDataViewController(with: viewController.requestFactory)
        navigateToNext(source: viewController, destination: changeUserDataVC)
    }
    
    // MARK: - Navigation
    
    private func navigateToNext(source: AuthViewController, destination: UIViewController) {
        source.navigationController?.pushViewController(destination, animated: true)
    }
}
