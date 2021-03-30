//
//  BasketWorker.swift
//  GBShop
//
//  Created by Aksilont on 26.03.2021.
//  Copyright (c) 2021 Aksilont. All rights reserved.
//

import Foundation

class BasketWorker {
    
    // MARK: - Private
    
    private let requestFactory: RequestFactory
    
    // MARK: - Init
    
    init(with requestFactory: RequestFactory) {
        self.requestFactory = requestFactory
    }
    
    // MARK: - Services
    
    func getBasket(userId: Int, completion: @escaping(GetBasketResult) -> Void) {
        let getBasketFactory = requestFactory.makeGetBasketFactory()
        getBasketFactory.getBasket(userId: userId) { response in
            switch response.result {
            case .success(let model):
                completion(model)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func deleteFromBasket(productId: Int, completion: @escaping(DeleteFromBasketResult) -> Void) {
        let deleteFromBasketFactory = requestFactory.makeDeleteFromBasketFactory()
        deleteFromBasketFactory.deleteFromBasket(productId: productId) { (response) in
            switch response.result {
            case .success(let model):
                completion(model)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
