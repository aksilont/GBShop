//
//  PayBasketInteractor.swift
//  GBShop
//
//  Created by Aksilont on 28.03.2021.
//  Copyright (c) 2021 Aksilont. All rights reserved.
//

import Foundation

protocol PayBasketBusinessLogic {
    func payBasket(request: PayBasketModels.PayBasket.Request)
}

protocol PayBasketDataStore {
}

class PayBasketInteractor: PayBasketBusinessLogic, PayBasketDataStore {
    
    // MARK: - Public
    
    let requestFactory: RequestFactory
    var presenter: PayBasketPresentationLogic?
    var worker: PayBasketWorker?
    
    // MARK: - Init
    
    init(with requestFactory: RequestFactory) {
        self.requestFactory = requestFactory
    }
    
    // MARK: - PayBasketBusinessLogic
    
    func payBasket(request: PayBasketModels.PayBasket.Request) {
        worker = PayBasketWorker(with: requestFactory)
        worker?.payBasket(userId: request.userId, completion: { (response) in
            let response = PayBasketModels.PayBasket.Response(userId: request.userId,
                                                              result: response.result,
                                                              message: response.userMessage)
            self.presenter?.presentPayBasket(response: response)
        })
    }
}
