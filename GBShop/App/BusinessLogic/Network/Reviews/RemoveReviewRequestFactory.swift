//
//  RemoveReviewRequestFactory.swift
//  GBShop
//
//  Created by Aksilont on 28.02.2021.
//

import Foundation
import Alamofire

protocol RemoveReviewRequestFactory {
    func removeReview(commentId: Int, completionHandler: @escaping(AFDataResponse<RemoveReviewResult>) -> Void)
}
