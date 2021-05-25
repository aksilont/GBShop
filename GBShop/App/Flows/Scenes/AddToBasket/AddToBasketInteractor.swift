//
//  AddToBasketInteractor.swift
//  GBShop
//
//  Created by Aksilont on 29.03.2021.
//  Copyright (c) 2021 Aksilont. All rights reserved.
//

import Foundation

protocol AddToBasketBusinessLogic {
    func addToBasket(request: AddToBasketModels.AddToBasket.Request)
}

protocol AddToBasketDataStore {
    var productId: Int? { get set }
    var productName: String? { get set }
}

class AddToBasketInteractor: AddToBasketBusinessLogic, AddToBasketDataStore {
    
    // MARK: - Private
    
    private let requestFactory: RequestFactory
    private var worker: AddToBasketWorker?
    
    // MARK: - Public
    
    var presenter: AddToBasketPresentationLogic?
    
    var productId: Int?
    var productName: String?
    
    // MARK: - Init
    
    init(with requestFactory: RequestFactory) {
        self.requestFactory = requestFactory
    }
    
    // MARK: - AddToBasketBusinessLogic
    
    func addToBasket(request: AddToBasketModels.AddToBasket.Request) {
        worker = AddToBasketWorker(with: requestFactory)
        worker?.addToBasket(productId: request.productId, quantity: request.quantity, completion: { modelResponse in
            let response = AddToBasketModels.AddToBasket.Response(result: modelResponse.result)
            AnalyticsManager.shared.trackAddToCart(item: "\(request.productId)", value: Double(request.quantity))
            self.presenter?.presentAddToBasket(response: response)
        })
    }
}
