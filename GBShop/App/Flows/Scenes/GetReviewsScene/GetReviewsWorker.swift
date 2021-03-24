//
//  GetReviewsWorker.swift
//  GBShop
//
//  Created by Aksilont on 22.03.2021.
//  Copyright (c) 2021 Aksilont. All rights reserved.
//

import Foundation

class GetReviewsWorker {
    
    // MARK: - Private
    
    private let requestFactory: RequestFactory
    
    // MARK: - Init
    
    init(with requestFactory: RequestFactory) {
        self.requestFactory = requestFactory
    }
    
    // MARK: - Services
    
    func getReviews(productId: Int, pageNumber: Int, completion: @escaping(GetReviewsResult) -> Void) {
        let getReviewsFactory = requestFactory.makeGetReviewsFactory()
        getReviewsFactory.getReviews(pageNumber: pageNumber) { response in
            switch response.result {
            case .success(let model):
                completion(model)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
