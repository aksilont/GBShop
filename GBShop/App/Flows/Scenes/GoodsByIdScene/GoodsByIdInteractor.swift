//
//  GoodsByIdInteractor.swift
//  GBShop
//
//  Created by Aksilont on 23.03.2021.
//  Copyright (c) 2021 Aksilont. All rights reserved.
//

import Foundation

protocol GoodsByIdBusinessLogic {
    func getGoodsById(request: GoodsByIdModels.GoodsById.Request)
}

protocol GoodsByIdDataStore {
    var productId: Int? { get set }
}

class GoodsByIdInteractor: GoodsByIdBusinessLogic, GoodsByIdDataStore {
    
    // MARK: - Private
    
    private let requestFactory: RequestFactory
    private let worker: GoodsByIdWorker
    
    // MARK: - Public
    
    var presenter: GoodsByIdPresentationLogic?
    
    var productId: Int?
    
    // MARK: - Init
    
    init(with requestFactory: RequestFactory) {
        self.requestFactory = requestFactory
        self.worker = GoodsByIdWorker(with: requestFactory)
    }
    
    // MARK: - GoodsByIdBusinessLogic
    
    func getGoodsById(request: GoodsByIdModels.GoodsById.Request) {
        guard let productId = productId else { return }
        worker.getGoodsById(productId: productId) { (modelResult) in
            let response = GoodsByIdModels.GoodsById.Response(result: modelResult.result,
                                                              id: productId,
                                                              price: modelResult.price,
                                                              description: modelResult.description,
                                                              name: modelResult.name)
            self.presenter?.presentGoodsById(response: response)
        }
    }
}
