//
//  ChangeUserDataConfigure.swift
//  GBShop
//
//  Created by Aksilont on 22.03.2021.
//  Copyright © 2021 Aksilont. All rights reserved.
//

import Foundation

class ChangeUserDataConfigure {
    static func setup(viewController: ChangeUserDataViewController, requestFactory: RequestFactory) {
        let interactor              = ChangeUserDataInteractor(with: requestFactory)
        let presenter               = ChangeUserDataPresenter()
        let router                  = ChangeUserDataRouter()
        viewController.interactor   = interactor
        viewController.router       = router
        interactor.presenter        = presenter
        presenter.viewController    = viewController
        router.viewController       = viewController
        router.dataStore            = interactor
    }
}
