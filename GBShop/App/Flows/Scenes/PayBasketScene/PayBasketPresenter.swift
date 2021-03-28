//
//  PayBasketPresenter.swift
//  GBShop
//
//  Created by Aksilont on 28.03.2021.
//  Copyright (c) 2021 Aksilont. All rights reserved.
//

import UIKit

protocol PayBasketPresentationLogic {
    func presentSomething(response: PayBasketModels.PayBasket.Response)
}

class PayBasketPresenter: PayBasketPresentationLogic {
    
    // MARK: - Public
    
    weak var viewController: PayBasketDisplayLogic?
    
    // MARK: - PayBasketPresentationLogic
    
    func presentSomething(response: PayBasketModels.PayBasket.Response) {
        let viewModel = PayBasketModels.PayBasket.ViewModel()
        viewController?.displaySomething(viewModel: viewModel)
    }
}
