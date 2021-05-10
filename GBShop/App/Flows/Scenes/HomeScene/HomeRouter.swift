//
//  HomeRouter.swift
//  GBShop
//
//  Created by Aksilont on 11.03.2021.
//  Copyright (c) 2021 Aksilont. All rights reserved.
//

import UIKit

@objc protocol HomeRoutingLogic {
    func routeToGoodsById()
}

protocol HomeDataPassing {
    var dataStore: HomeDataStore? { get }
}

class HomeRouter: NSObject, HomeRoutingLogic, HomeDataPassing {
    
    // MARK: - Public
    
    weak var viewController: HomeViewController?
    var dataStore: HomeDataStore?
    
    // MARK: - HomeRoutingLogic
    
    func routeToGoodsById() {
        guard
            let viewController = viewController,
            let homeDS = dataStore
        else { fatalError("Fail route to GetReviews") }
        
        let goodsByIdVC = GoodsByIdViewController(nibName: "GoodsByIdViewController",
                                                  bundle: nil,
                                                  with: viewController.requestFactory)
        guard var goodsByIdDS = goodsByIdVC.router?.dataStore
        else { fatalError("Fail to get data store GetReviews") }
        
        passDataToGoodsById(source: homeDS, destination: &goodsByIdDS)
        navigateToGoodsById(source: viewController, destination: goodsByIdVC)
    }
    
    // MARK: - Navigation
    
    private func navigateToGoodsById(source: HomeViewController, destination: GoodsByIdViewController) {
        source.navigationItem.backBarButtonItem = UIBarButtonItem()
        source.navigationController?.pushViewController(destination, animated: true)
    }
    
    // MARK: - Passing data
    
    private func passDataToGoodsById(source: HomeDataStore, destination: inout GoodsByIdDataStore) {
        guard let selectedRow = viewController?.tableView.indexPathForSelectedRow?.row,
              let product = source.products?[selectedRow]
        else { return }
        destination.productId = product.id
    }
}
