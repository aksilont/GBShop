//
//  AuthConfigure.swift
//  GBShop
//
//  Created by Aksilont on 22.03.2021.
//  Copyright © 2021 Aksilont. All rights reserved.
//

import Foundation

class AuthConfigure {
    static func setup(viewController: AuthViewController, requestFactory: RequestFactory) {
        let interactor              = AuthInteractor(with: requestFactory)
        let presenter               = AuthPresenter()
        let router                  = AuthRouter()
        viewController.interactor   = interactor
        viewController.router       = router
        interactor.presenter        = presenter
        presenter.viewController    = viewController
        router.viewController       = viewController
    }
}
