//
//  AddReviewRequestFactory.swift
//  GBShop
//
//  Created by Aksilont on 28.02.2021.
//

import Foundation
import Alamofire

protocol AddReviewRequestFactory {
    func addReview(userId: Int, text: String, completionHandler: @escaping(AFDataResponse<AddReviewResult>) -> Void)
}
