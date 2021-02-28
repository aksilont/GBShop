//
//  ApproveReviewRequestFactory.swift
//  GBShop
//
//  Created by Aksilont on 28.02.2021.
//

import Foundation
import Alamofire

protocol ApproveReviewRequestFactory {
    func approveReview(commentId: Int, completionHandler: @escaping(AFDataResponse<ApproveReviewResult>) -> Void)
}
