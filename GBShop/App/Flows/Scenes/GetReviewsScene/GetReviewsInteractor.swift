//
//  GetReviewsInteractor.swift
//  GBShop
//
//  Created by Aksilont on 22.03.2021.
//  Copyright (c) 2021 Aksilont. All rights reserved.
//

import Foundation

protocol GetReviewsBusinessLogic {
    func getReviews(request: GetReviewsModels.GetReviews.Request)
}

protocol GetReviewsDataStore {
    var productId: Int? { get set }
    var reviews: [Review]? { get }
}

class GetReviewsInteractor: GetReviewsBusinessLogic, GetReviewsDataStore {
    
    // MARK: - Private
    
    private let requestFactory: RequestFactory
    private let worker: GetReviewsWorker
    
    // MARK: - Public
    
    var presenter: GetReviewsPresentationLogic?
    
    var productId: Int?
    var reviews: [Review]?
    
    // MARK: - Init
    
    init(with requestFactory: RequestFactory) {
        self.requestFactory = requestFactory
        self.worker = GetReviewsWorker(with: requestFactory)
    }
    
    // MARK: - GetReviewsBusinessLogic
    
    func getReviews(request: GetReviewsModels.GetReviews.Request) {
        guard let productId = self.productId else { return }
        worker.getReviews(productId: productId, pageNumber: request.pageNumber, completion: { modelResult in
            self.reviews = modelResult.reviews
            let response = GetReviewsModels.GetReviews.Response(pageNumber: modelResult.pageNumber,
                                                                productId: productId,
                                                                reviews: modelResult.reviews)
            
            self.presenter?.presentReviews(response: response)
        })
    }
}
