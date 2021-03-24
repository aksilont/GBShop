//
//  HomeRouter.swift
//  GBShop
//
//  Created by Aksilont on 11.03.2021.
//  Copyright (c) 2021 Aksilont. All rights reserved.
//

import UIKit

@objc protocol HomeRoutingLogic {
    func routeToGoodsById(productId: Int)
}

protocol HomeDataPassing {
    var dataStore: HomeDataStore? { get }
}

class HomeRouter: NSObject, HomeRoutingLogic, HomeDataPassing {
    
    // MARK: - Public
    
    weak var viewController: HomeViewController?
    var dataStore: HomeDataStore?
    
    // MARK: - HomeRoutingLogic
    
    func routeToGoodsById(productId: Int) {
        guard let viewController = viewController else { fatalError("Fail route to GetReviews") }
        
        let goodsByIdVC = GoodsByIdViewController(nibName: "GoodsByIdViewController",
                                                    bundle: nil,
                                                    with: viewController.requestFactory)
        guard var goodsByIdDS = goodsByIdVC.router?.dataStore
        else { fatalError("Fail to get data store GetReviews") }
        
        goodsByIdDS.productId = productId
        
        navigateToNext(source: viewController, destination: goodsByIdVC)
    }
    
    // MARK: - Navigation
    
    private func navigateToNext(source: HomeViewController, destination: UIViewController) {
        source.navigationController?.pushViewController(destination, animated: true)
    }
}
