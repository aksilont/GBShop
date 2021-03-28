//
//  PayBasketConfigurator.swift
//  GBShop
//
//  Created by Aksilont on 28.03.2021.
//  Copyright (c) 2021 Aksilont. All rights reserved.
//

import Foundation

class PayBasketConfigurator {
    static func setup(viewController: PayBasketViewController) {
        let interactor              = PayBasketInteractor()
        let presenter               = PayBasketPresenter()
        let router                  = PayBasketRouter()
        viewController.interactor   = interactor
        viewController.router       = router
        interactor.presenter        = presenter
        presenter.viewController    = viewController
        router.viewController       = viewController
        router.dataStore            = interactor
    }
}
