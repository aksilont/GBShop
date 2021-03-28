//
//  BasketInteractor.swift
//  GBShop
//
//  Created by Aksilont on 26.03.2021.
//  Copyright (c) 2021 Aksilont. All rights reserved.
//

import Foundation

protocol BasketBusinessLogic {
    func getBasket(request: BasketModels.Basket.Request)
}

protocol BasketDataStore {
}

class BasketInteractor: BasketBusinessLogic, BasketDataStore {
    
    // MARK: - Public
    
    let requestFactory: RequestFactory
    var presenter: BasketPresentationLogic?
    var worker: BasketWorker?
    
    var basket: [BasketItem] = []
    
    // MARK: - Init
    
    init(with requestFactory: RequestFactory) {
        self.requestFactory = requestFactory
        worker = BasketWorker(with: requestFactory)
    }
    
    // MARK: - BasketBusinessLogic
    
    func getBasket(request: BasketModels.Basket.Request) {
        worker?.getBasket(userId: request.userId, completion: { modelResult in
            self.basket = modelResult.basket
            let response = BasketModels.Basket.Response(userId: modelResult.userId,
                                                        basket: modelResult.basket)
            self.presenter?.presentBasket(response: response)
        })
    }
}
