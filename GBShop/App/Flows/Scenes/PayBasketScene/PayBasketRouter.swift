//
//  PayBasketRouter.swift
//  GBShop
//
//  Created by Aksilont on 28.03.2021.
//  Copyright (c) 2021 Aksilont. All rights reserved.
//

import UIKit

@objc protocol PayBasketRoutingLogic {
//    func routeToSomewhere(segue: UIStoryboardSegue?)
}

protocol PayBasketDataPassing {
    var dataStore: PayBasketDataStore? { get }
}

class PayBasketRouter: NSObject, PayBasketRoutingLogic, PayBasketDataPassing {
    
    // MARK: - Private
    
    // MARK: - Public
    
    weak var viewController: PayBasketViewController?
    var dataStore: PayBasketDataStore?
    
    // MARK: - Routing
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
    /*
    private func navigateToSomewhere(source: PayBasketViewController, destination: SomewhereViewController) {
      source.show(destination, sender: nil)
    }
    */
    
    // MARK: - Passing data
    /*
    private func passDataToSomewhere(source: PayBasketDataStore, destination: inout SomewhereDataStore) {
      destination.name = source.name
    }
    */
}
