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
    func presentDeleteFromBasket(response: BasketModels.DeleteFromBasket.Response)
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
    
    func presentDeleteFromBasket(response: BasketModels.DeleteFromBasket.Response) {
        if response.result == 1 {
            let viewModel = BasketModels.DeleteFromBasket.ViewModel(success: true, message: "Success to delete")
            viewController?.displayDeleteFromBasket(viewModel: viewModel)
        } else {
            viewController?.displayError("Error")
        }
    }
}
