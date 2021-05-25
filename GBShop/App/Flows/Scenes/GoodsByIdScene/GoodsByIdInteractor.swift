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
    var productName: String? { get }
}

class GoodsByIdInteractor: GoodsByIdBusinessLogic, GoodsByIdDataStore {
    
    // MARK: - Private
    
    private let requestFactory: RequestFactory
    private let worker: GoodsByIdWorker
    
    // MARK: - Public
    
    var presenter: GoodsByIdPresentationLogic?
    
    var productId: Int?
    var productName: String?
    
    // MARK: - Init
    
    init(with requestFactory: RequestFactory) {
        self.requestFactory = requestFactory
        self.worker = GoodsByIdWorker(with: requestFactory)
    }
    
    // MARK: - GoodsByIdBusinessLogic
    
    func getGoodsById(request: GoodsByIdModels.GoodsById.Request) {
        guard let productId = productId else { return }
        worker.getGoodsById(productId: productId) { (modelResult) in
            self.productId = productId
            self.productName = modelResult.name
            let response = GoodsByIdModels.GoodsById.Response(result: modelResult.result,
                                                              id: productId,
                                                              price: modelResult.price,
                                                              description: modelResult.description,
                                                              name: modelResult.name)
            let value = Double(modelResult.price)
            AnalyticsManager.shared.trackViewItem(item: modelResult.name, value: value)
            self.presenter?.presentGoodsById(response: response)
        }
    }
}
