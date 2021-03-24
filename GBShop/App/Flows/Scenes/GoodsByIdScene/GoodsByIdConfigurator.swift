//
//  GoodsByIdConfigurator.swift
//  GBShop
//
//  Created by Aksilont on 23.03.2021.
//  Copyright © 2021 Aksilont. All rights reserved.
//

import Foundation

class GoodsByIdConfigurator {
    static func setup(viewController: GoodsByIdViewController, requestFactory: RequestFactory) {
        let interactor              = GoodsByIdInteractor(with: requestFactory)
        let presenter               = GoodsByIdPresenter()
        let router                  = GoodsByIdRouter()
        viewController.interactor   = interactor
        viewController.router       = router
        interactor.presenter        = presenter
        presenter.viewController    = viewController
        router.viewController       = viewController
        router.dataStore            = interactor
    }
}
