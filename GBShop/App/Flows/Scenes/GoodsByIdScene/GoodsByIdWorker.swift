//
//  GoodsByIdWorker.swift
//  GBShop
//
//  Created by Aksilont on 23.03.2021.
//  Copyright (c) 2021 Aksilont. All rights reserved.
//

import Foundation

class GoodsByIdWorker {
    
    // MARK: - Private
    
    private let requestFactory: RequestFactory
    
    // MARK: - Init
    
    init(with requestFactory: RequestFactory) {
        self.requestFactory = requestFactory
    }
    
    // MARK: - Services
    
    func getGoodsById(productId: Int, completion: @escaping(GoodsByIdResult) -> Void) {
        let goodsByIdFactory = requestFactory.makeGoodsByIdFactory()
        goodsByIdFactory.getGoodsById(id: "\(productId)") { response in
            switch response.result {
            case .success(let model):
                completion(model)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
