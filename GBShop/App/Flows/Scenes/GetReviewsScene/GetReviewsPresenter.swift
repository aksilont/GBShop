//
//  GetReviewsPresenter.swift
//  GBShop
//
//  Created by Aksilont on 22.03.2021.
//  Copyright (c) 2021 Aksilont. All rights reserved.
//

import UIKit

protocol GetReviewsPresentationLogic {
    func presentReviews(response: GetReviewsModels.GetReviews.Response)
}

class GetReviewsPresenter: GetReviewsPresentationLogic {
    
    // MARK: - Public
    
    weak var viewController: GetReviewsDisplayLogic?
    
    // MARK: - GetReviewsPresentationLogic
    
    func presentReviews(response: GetReviewsModels.GetReviews.Response) {
        if response.reviews.isEmpty {
            viewController?.displayError("ERROR to get reviews with Product ID \(response.productId)")
        } else {
            let viewModel = GetReviewsModels.GetReviews.ViewModel(
                success: true,
                pageNumber: response.pageNumber,
                reviews: response.reviews,
                message: "Success to get reviews with Product ID \(response.productId)"
            )
            viewController?.displayReviews(viewModel)
        }
    }
}
