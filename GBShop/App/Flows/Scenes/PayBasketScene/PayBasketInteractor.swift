//
//  PayBasketInteractor.swift
//  GBShop
//
//  Created by Aksilont on 28.03.2021.
//  Copyright (c) 2021 Aksilont. All rights reserved.
//

import Foundation

protocol PayBasketBusinessLogic {
    func doSomething(request: PayBasketModels.PayBasket.Request)
}

protocol PayBasketDataStore {
}

class PayBasketInteractor: PayBasketBusinessLogic, PayBasketDataStore {
    
    // MARK: - Public
    
    var presenter: PayBasketPresentationLogic?
    var worker: PayBasketWorker?
    
    // MARK: - PayBasketBusinessLogic
    
    func doSomething(request: PayBasketModels.PayBasket.Request) {
        worker = PayBasketWorker()
        worker?.doSomeWork()
        
        let response = PayBasketModels.PayBasket.Response()
        presenter?.presentSomething(response: response)
    }
}
