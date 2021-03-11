//
//  GetReviewsResult.swift
//  GBShop
//
//  Created by Aksilont on 28.02.2021.
//

import Foundation

struct GetReviewsResult: Codable {
    let pageNumber: Int
    let reviews: [Review]
    
    enum CodingKeys: String, CodingKey {
        case pageNumber = "page_number"
        case reviews
    }
}
