//
//  GetReviewRequestFactory.swift
//  GBShop
//
//  Created by Aksilont on 28.02.2021.
//

import Foundation
import Alamofire

protocol GetReviewRequestFactory {
    func getReviews(pageNumber: Int, completionHandler: @escaping(AFDataResponse<GetReviewsResult>) -> Void)
}
