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
    var basket: [BasketItem] { get set }
    var isPayedBasket: Bool { get set }
}

class BasketInteractor: BasketBusinessLogic, BasketDataStore {
    
    // MARK: - Public
    
    let requestFactory: RequestFactory
    var presenter: BasketPresentationLogic?
    var worker: BasketWorker?
    
    var basket: [BasketItem] = []
    var isPayedBasket: Bool = false
    
    // MARK: - Init
    
    init(with requestFactory: RequestFactory) {
        self.requestFactory = requestFactory
        worker = BasketWorker(with: requestFactory)
    }
    
    // MARK: - BasketBusinessLogic
    
    func getBasket(request: BasketModels.Basket.Request) {
        if isPayedBasket {
            let response = BasketModels.Basket.Response(userId: request.userId,
                                                        basket: [])
            self.presenter?.presentBasket(response: response)
        } else {
            worker?.getBasket(userId: request.userId, completion: { modelResult in
                self.basket = modelResult.basket
                let response = BasketModels.Basket.Response(userId: modelResult.userId,
                                                            basket: modelResult.basket)
                self.presenter?.presentBasket(response: response)
            })
        }
    }
}
