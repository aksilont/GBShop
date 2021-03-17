//
//  ChangeUserDataRouter.swift
//  GBShop
//
//  Created by Aksilont on 14.03.2021.
//  Copyright (c) 2021 Aksilont. All rights reserved.
//

import UIKit

@objc protocol ChangeUserDataRoutingLogic {
}

protocol ChangeUserDataDataPassing {
    var dataStore: ChangeUserDataDataStore? { get }
}

class ChangeUserDataRouter: NSObject, ChangeUserDataRoutingLogic, ChangeUserDataDataPassing {
    
    // MARK: - Public
    
    weak var viewController: ChangeUserDataViewController?
    var dataStore: ChangeUserDataDataStore?
    
}
