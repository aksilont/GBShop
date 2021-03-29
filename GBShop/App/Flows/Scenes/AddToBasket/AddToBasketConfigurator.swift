//
//  AddToBasketConfigurator.swift
//  GBShop
//
//  Created by Aksilont on 29.03.2021.
//  Copyright (c) 2021 Aksilont. All rights reserved.
//

import Foundation

class AddToBasketConfigurator {
    static func setup(viewController: AddToBasketViewController, requestFactory: RequestFactory) {
        let interactor              = AddToBasketInteractor(with: requestFactory)
        let presenter               = AddToBasketPresenter()
        let router                  = AddToBasketRouter()
        viewController.interactor   = interactor
        viewController.router       = router
        interactor.presenter        = presenter
        presenter.viewController    = viewController
        router.viewController       = viewController
        router.dataStore            = interactor
    }
}
