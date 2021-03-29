//
//  PayBasketWorker.swift
//  GBShop
//
//  Created by Aksilont on 28.03.2021.
//  Copyright (c) 2021 Aksilont. All rights reserved.
//

import Foundation

class PayBasketWorker {
    
    // MARK: - Private
    
    private let requestFactory: RequestFactory
    
    // MARK: - Init
    
    init(with requestFactory: RequestFactory) {
        self.requestFactory = requestFactory
    }
    
    // MARK: - Services
    
    func payBasket(userId: Int, completion: @escaping(PayBasketResult) -> Void) {
        let payBasketFactory = requestFactory.makePayBasketFactory()
        payBasketFactory.payBasket(userId: userId) { (response) in
            switch response.result {
            case .success(let model):
                completion(model)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
