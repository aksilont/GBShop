//
//  PayBasketRouter.swift
//  GBShop
//
//  Created by Aksilont on 28.03.2021.
//  Copyright (c) 2021 Aksilont. All rights reserved.
//

import UIKit

@objc protocol PayBasketRoutingLogic {
    func routeToBasket()
}

protocol PayBasketDataPassing {
    var dataStore: PayBasketDataStore? { get }
}

class PayBasketRouter: NSObject, PayBasketRoutingLogic, PayBasketDataPassing {
    
    // MARK: - Public
    
    weak var viewController: PayBasketViewController?
    var dataStore: PayBasketDataStore?
    
    // MARK: - Routing
    
    func routeToBasket() {
        guard let viewController = viewController else { fatalError("Fail route to Auth") }
        navigateToBasket(source: viewController)
    }
    
    // MARK: - Navigation
    
    private func navigateToBasket(source: PayBasketViewController) {
        DispatchQueue.main.async {
            source.navigationController?.popViewController(animated: true)
            if let basketVC = source.navigationController?.viewControllers.last as? BasketViewController,
               var basketDS = basketVC.router?.dataStore {
                basketDS.isPayedBasket = true
                basketVC.getBasket()
            }
        }
    }
}
