//
//  BasketRouter.swift
//  GBShop
//
//  Created by Aksilont on 26.03.2021.
//  Copyright (c) 2021 Aksilont. All rights reserved.
//

import UIKit

@objc protocol BasketRoutingLogic {
    func routeToPayBasket()
}

protocol BasketDataPassing {
    var dataStore: BasketDataStore? { get }
}

class BasketRouter: NSObject, BasketRoutingLogic, BasketDataPassing {
    
    // MARK: - Public
    
    weak var viewController: BasketViewController?
    var dataStore: BasketDataStore?
    
    // MARK: - BasketRoutingLogic
    
    func routeToPayBasket() {
        guard let viewController = viewController else { fatalError("Fail route to Sign Up") }
        let payBasketVC = PayBasketViewController(nibName: nil, bundle: nil, with: viewController.requestFactory)
        navigateToPayBasket(source: viewController, destination: payBasketVC)
    }
    
    // MARK: - Navigation
    
    private func navigateToPayBasket(source: BasketViewController, destination: PayBasketViewController) {
        source.navigationController?.pushViewController(destination, animated: true)
    }
}
