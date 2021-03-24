//
//  GetReviewsModels.swift
//  GBShop
//
//  Created by Aksilont on 22.03.2021.
//  Copyright (c) 2021 Aksilont. All rights reserved.
//

import UIKit

enum GetReviewsModels {
    
    enum GetReviews {
        struct Request {
            let pageNumber: Int
        }
        struct Response {
            let pageNumber: Int
            let productId: Int
            let reviews: [Review]
        }
        struct ViewModel {
            let success: Bool
            let pageNumber: Int
            let reviews: [Review]
            let message: String?
        }
    }
    
}
