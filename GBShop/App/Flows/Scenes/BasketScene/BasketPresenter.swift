//
//  BasketPresenter.swift
//  GBShop
//
//  Created by Aksilont on 26.03.2021.
//  Copyright (c) 2021 Aksilont. All rights reserved.
//

import UIKit

protocol BasketPresentationLogic {
    func presentBasket(response: BasketModels.Basket.Response)
}

class BasketPresenter: BasketPresentationLogic {
    
    // MARK: - Public
    
    weak var viewController: BasketDisplayLogic?
    
    // MARK: - BasketPresentationLogic
    
    func presentBasket(response: BasketModels.Basket.Response) {
        let viewModel = BasketModels.Basket.ViewModel(basket: response.basket,
                                                      message: "Success to get basket with userId: \(response.userId)")
        viewController?.displayBasket(viewModel: viewModel)
    }
}
