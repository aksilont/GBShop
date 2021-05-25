//
//  HomeInteractor.swift
//  GBShop
//
//  Created by Aksilont on 11.03.2021.
//  Copyright (c) 2021 Aksilont. All rights reserved.
//

import Foundation

protocol HomeBusinessLogic {
    func catalogData(request: HomeModels.CatalogData.Request)
}

protocol HomeDataStore {
    var products: [Product]? { get }
}

class HomeInteractor: HomeBusinessLogic, HomeDataStore {
    
    // MARK: - Private
    
    private let requestFactory: RequestFactory
    private let worker: HomeWorker
    
    // MARK: - Public
    
    var presenter: HomePresentationLogic?
    
    var products: [Product]?
    
    // MARK: - Init
    
    init(with requestFactory: RequestFactory) {
        self.requestFactory = requestFactory
        self.worker = HomeWorker(with: requestFactory)
    }
    // MARK: - HomeBusinessLogic
    
    func catalogData(request: HomeModels.CatalogData.Request) {
        worker.catalogData(pageNumber: request.pageNumber, categoryId: request.categoryId, completion: { modelResult in
            self.products = modelResult.products
            let response = HomeModels.CatalogData.Response(pageNumber: modelResult.pageNumber,
                                                           products: modelResult.products)
            AnalyticsManager.shared.trackCatalogData("catalogData(request: HomeModels.CatalogData.Request)")
            self.presenter?.presentCatalogData(response: response)
        })
    }
}
