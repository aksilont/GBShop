//
//  AddToBasketWorker.swift
//  GBShop
//
//  Created by Aksilont on 29.03.2021.
//  Copyright (c) 2021 Aksilont. All rights reserved.
//

import Foundation

class AddToBasketWorker {
    
    // MARK: - Private
    
    private let requestFactory: RequestFactory
    
    // MARK: - Init
    
    init(with requestFactory: RequestFactory) {
        self.requestFactory = requestFactory
    }
    
    // MARK: - Services
    
    func addToBasket(productId: Int, quantity: Int, completion: @escaping(AddToBasketResult) -> Void) {
        let addToBasketFactory = requestFactory.makeAddToBasketFactory()
        addToBasketFactory.addToBasket(productId: productId, quantity: quantity) { response in
            switch response.result {
            case .success(let model):
                completion(model)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
