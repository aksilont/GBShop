//
//  AddToBasketRouter.swift
//  GBShop
//
//  Created by Aksilont on 29.03.2021.
//  Copyright (c) 2021 Aksilont. All rights reserved.
//

import UIKit

@objc protocol AddToBasketRoutingLogic {
}

protocol AddToBasketDataPassing {
    var dataStore: AddToBasketDataStore? { get }
}

class AddToBasketRouter: NSObject, AddToBasketRoutingLogic, AddToBasketDataPassing {
    
    // MARK: - Public
    
    weak var viewController: AddToBasketViewController?
    var dataStore: AddToBasketDataStore?
}
