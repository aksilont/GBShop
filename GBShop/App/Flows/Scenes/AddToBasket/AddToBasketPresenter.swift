//
//  AddToBasketPresenter.swift
//  GBShop
//
//  Created by Aksilont on 29.03.2021.
//  Copyright (c) 2021 Aksilont. All rights reserved.
//

import UIKit

protocol AddToBasketPresentationLogic {
    func presentAddToBasket(response: AddToBasketModels.AddToBasket.Response)
}

class AddToBasketPresenter: AddToBasketPresentationLogic {
    
    // MARK: - Public
    
    weak var viewController: AddToBasketDisplayLogic?
    
    // MARK: - AddToBasketPresentationLogic
    
    func presentAddToBasket(response: AddToBasketModels.AddToBasket.Response) {
        if response.result == 1 {
            let viewModel = AddToBasketModels.AddToBasket.ViewModel(message: "Product has added to the basket")
            viewController?.displayAddToBasket(viewModel: viewModel)
        } else {
            viewController?.displayError(message: "ERROR to add to basket")
        }
        
    }
}
