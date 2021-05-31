//
//  BasketConfigurator.swift
//  GBShop
//
//  Created by Aksilont on 26.03.2021.
//  Copyright (c) 2021 Aksilont. All rights reserved.
//

import Foundation

class BasketConfigurator {
    static func setup(viewController: BasketViewController, requestFactory: RequestFactory) {
        let interactor              = BasketInteractor(with: requestFactory)
        let presenter               = BasketPresenter()
        let router                  = BasketRouter()
        viewController.interactor   = interactor
        viewController.router       = router
        interactor.presenter        = presenter
        presenter.viewController    = viewController
        router.viewController       = viewController
        router.dataStore            = interactor
    }
}
