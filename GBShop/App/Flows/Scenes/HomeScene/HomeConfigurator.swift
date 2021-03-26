//
//  HomeConfigurator.swift
//  GBShop
//
//  Created by Aksilont on 22.03.2021.
//  Copyright © 2021 Aksilont. All rights reserved.
//

import Foundation

class HomeConfigurator {
    static func setup(viewController: HomeViewController, requestFactory: RequestFactory) {
        let interactor              = HomeInteractor(with: requestFactory)
        let presenter               = HomePresenter()
        let router                  = HomeRouter()
        viewController.interactor   = interactor
        viewController.router       = router
        interactor.presenter        = presenter
        presenter.viewController    = viewController
        router.viewController       = viewController
        router.dataStore            = interactor
    }
}
