//
//  GoodsByIdRouter.swift
//  GBShop
//
//  Created by Aksilont on 23.03.2021.
//  Copyright (c) 2021 Aksilont. All rights reserved.
//

import UIKit

@objc protocol GoodsByIdRoutingLogic {
}

protocol GoodsByIdDataPassing {
    var dataStore: GoodsByIdDataStore? { get }
}

class GoodsByIdRouter: NSObject, GoodsByIdRoutingLogic, GoodsByIdDataPassing {
    
    // MARK: - Public
    
    weak var viewController: GoodsByIdViewController?
    var dataStore: GoodsByIdDataStore?
    
}
