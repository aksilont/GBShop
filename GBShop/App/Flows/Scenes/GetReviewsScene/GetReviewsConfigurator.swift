//
//  GetReviewsConfigure.swift
//  GBShop
//
//  Created by Aksilont on 22.03.2021.
//  Copyright © 2021 Aksilont. All rights reserved.
//

import Foundation

class GetReviewsConfigurator {
    static func setup(viewController: GetReviewsViewController, requestFactory: RequestFactory) {
        let interactor              = GetReviewsInteractor(with: requestFactory)
        let presenter               = GetReviewsPresenter()
        let router                  = GetReviewsRouter()
        viewController.interactor   = interactor
        viewController.router       = router
        interactor.presenter        = presenter
        presenter.viewController    = viewController
        router.viewController       = viewController
        router.dataStore            = interactor
    }
}
