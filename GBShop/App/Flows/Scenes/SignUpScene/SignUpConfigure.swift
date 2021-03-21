//
//  SignUpConfigure.swift
//  GBShop
//
//  Created by Aksilont on 22.03.2021.
//  Copyright © 2021 Aksilont. All rights reserved.
//

import Foundation

class SignUpConfigure {
    static func setup(viewController: SignUpViewController, requestFactory: RequestFactory) {
        let interactor              = SignUpInteractor(with: requestFactory)
        let presenter               = SignUpPresenter()
        let router                  = SignUpRouter()
        viewController.interactor   = interactor
        viewController.router       = router
        interactor.presenter        = presenter
        presenter.viewController    = viewController
        router.viewController       = viewController
    }
}
