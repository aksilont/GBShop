//
//  GoodsByIdRouter.swift
//  GBShop
//
//  Created by Aksilont on 23.03.2021.
//  Copyright (c) 2021 Aksilont. All rights reserved.
//

import UIKit

@objc protocol GoodsByIdRoutingLogic {
    func routeToGetReviews()
}

protocol GoodsByIdDataPassing {
    var dataStore: GoodsByIdDataStore? { get }
}

class GoodsByIdRouter: NSObject, GoodsByIdRoutingLogic, GoodsByIdDataPassing {
    
    // MARK: - Public
    
    weak var viewController: GoodsByIdViewController?
    var dataStore: GoodsByIdDataStore?
    
    // MARK: - GoodsByIdRoutingLogic
    
    func routeToGetReviews() {
        guard
            let viewController = viewController,
            let goodsByIdDS = dataStore
        else { fatalError("Fail route to GetReviews") }
        
        let getReviewsVC = GetReviewsViewController(with: viewController.requestFactory)
        guard var getReviewsDS = getReviewsVC.router?.dataStore
        else { fatalError("Fail to get data store GetReviews") }
        
        passDataToGetReviews(source: goodsByIdDS, destination: &getReviewsDS)
        navigateToGetReviews(source: viewController, destination: getReviewsVC)
    }
    
    // MARK: - Navigation
    
    private func navigateToGetReviews(source: GoodsByIdViewController, destination: GetReviewsViewController) {
        source.navigationItem.backBarButtonItem = UIBarButtonItem()
        source.navigationController?.pushViewController(destination, animated: true)
    }
    
    // MARK: - Passing data
    
    private func passDataToGetReviews(source: GoodsByIdDataStore, destination: inout GetReviewsDataStore) {
        destination.productId = source.productId
        destination.productName = source.productName
    }
}
