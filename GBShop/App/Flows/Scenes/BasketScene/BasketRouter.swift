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
        let payBasketVC = PayBasketViewController()
        navigateToPayBasket(source: viewController, destination: payBasketVC)
    }
    
    /*
    func routeToSomewhere(segue: UIStoryboardSegue?) {
      if let segue = segue {
        let destinationVC = segue.destination as! SomewhereViewController
        var destinationDS = destinationVC.router!.dataStore!
        passDataToSomewhere(source: dataStore!, destination: &destinationDS)
      } else {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let destinationVC = storyboard.instantiateViewController(withIdentifier: "SomewhereViewController")
            as! SomewhereViewController
        var destinationDS = destinationVC.router!.dataStore!
        passDataToSomewhere(source: dataStore!, destination: &destinationDS)
        navigateToSomewhere(source: viewController!, destination: destinationVC)
      }
    }
    */
    
    // MARK: - Navigation
    
    private func navigateToPayBasket(source: BasketViewController, destination: PayBasketViewController) {
        source.navigationController?.pushViewController(destination, animated: true)
    }
    
    // MARK: - Passing data
    /*
    private func passDataToSomewhere(source: BasketDataStore, destination: inout SomewhereDataStore) {
      destination.name = source.name
    }
    */
}
