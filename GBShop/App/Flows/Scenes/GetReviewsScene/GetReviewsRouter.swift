//
//  GetReviewsRouter.swift
//  GBShop
//
//  Created by Aksilont on 22.03.2021.
//  Copyright (c) 2021 Aksilont. All rights reserved.
//

import UIKit

@objc protocol GetReviewsRoutingLogic {
}

protocol GetReviewsDataPassing {
    var dataStore: GetReviewsDataStore? { get }
}

class GetReviewsRouter: NSObject, GetReviewsRoutingLogic, GetReviewsDataPassing {
    
    // MARK: - Public
    
    weak var viewController: GetReviewsViewController?
    var dataStore: GetReviewsDataStore?
    
}
