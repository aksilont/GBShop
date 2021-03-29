//
//  PayBasketPresenter.swift
//  GBShop
//
//  Created by Aksilont on 28.03.2021.
//  Copyright (c) 2021 Aksilont. All rights reserved.
//

import UIKit

protocol PayBasketPresentationLogic {
    func presentPayBasket(response: PayBasketModels.PayBasket.Response)
}

class PayBasketPresenter: PayBasketPresentationLogic {
    
    // MARK: - Public
    
    weak var viewController: PayBasketDisplayLogic?
    
    // MARK: - PayBasketPresentationLogic
    
    func presentPayBasket(response: PayBasketModels.PayBasket.Response) {
        if response.result == 1 {
            let viewModel = PayBasketModels.PayBasket.ViewModel(
                userId: response.userId,
                message: response.message
            )
            viewController?.displayPayBasket(viewModel)
        } else {
            viewController?.displayError("ERROR to pay basket with user ID \(response.userId)")
        }
    }
}
