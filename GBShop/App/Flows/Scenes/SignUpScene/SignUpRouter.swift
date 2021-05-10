//
//  SignUpRouter.swift
//  GBShop
//
//  Created by Aksilont on 10.03.2021.
//  Copyright (c) 2021 Aksilont. All rights reserved.
//

import UIKit

protocol SignUpRoutingLogic {
    func routeToAuth()
}

class SignUpRouter: NSObject, SignUpRoutingLogic {
    
    // MARK: - Public
    
    weak var viewController: SignUpViewController?
    
    // MARK: - SignUpRoutingLogic
    
    func routeToAuth() {
        guard let viewController = viewController else { fatalError("Fail route to Auth") }
        navigateToBack(source: viewController)
    }
    
    // MARK: - Navigation
    
    private func navigateToBack(source: SignUpViewController) {
        DispatchQueue.main.async {
            source.navigationController?.popViewController(animated: true)
        }
    }
}
