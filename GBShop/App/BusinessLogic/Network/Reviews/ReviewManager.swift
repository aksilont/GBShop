//
//  ReviewManager.swift
//  GBShop
//
//  Created by Aksilont on 28.02.2021.
//

import Foundation
import Alamofire

class ReviewManager: AbstractRequestFactory {
    var errorParser: AbstractErrorParser
    var sessionManager: Session
    var queue: DispatchQueue
    var baseUrl: URL
    
    init(errorParser: AbstractErrorParser,
         sessionManager: Session,
         queue: DispatchQueue = DispatchQueue.global(qos: .utility), baseUrl: URL
    ) {
        self.errorParser = errorParser
        self.sessionManager = sessionManager
        self.queue = queue
        self.baseUrl = baseUrl
    }
}

// MARK: - Add review

extension ReviewManager: AddReviewRequestFactory {
    
    struct AddReviewRequest: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .post
        let path: String = "addReview"
        
        let userId: Int
        let text: String
        
        var parameters: Parameters? {
            return [
                "id_user": userId,
                "text": text
            ]
        }
    }
    
    func addReview(userId: Int, text: String, completionHandler: @escaping (AFDataResponse<AddReviewResult>) -> Void) {
        let requestModel = AddReviewRequest(baseUrl: baseUrl, userId: userId, text: text)
        self.request(request: requestModel, completionHander: completionHandler)
    }
}

// MARK: - Approve Review

extension ReviewManager: ApproveReviewRequestFactory {
    
    struct ApproveReviewRequest: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .post
        let path: String = "approveReview"
        
        let commentId: Int
        
        var parameters: Parameters? {
            return [
                "id_comment": commentId
            ]
        }
    }
    
    func approveReview(commentId: Int, completionHandler: @escaping (AFDataResponse<ApproveReviewResult>) -> Void) {
        let requestModel = ApproveReviewRequest(baseUrl: baseUrl, commentId: commentId)
        self.request(request: requestModel, completionHander: completionHandler)
    }
}

// MARK: - Remove Review

extension ReviewManager: RemoveReviewRequestFactory {
    
    struct RemoveReviewRequest: RequestRouter {
        var baseUrl: URL
        var method: HTTPMethod = .post
        let path: String = "removeReview"
        
        let commentId: Int
        
        var parameters: Parameters? {
            return [
                "id_comment": commentId
            ]
        }
    }
    
    func removeReview(commentId: Int, completionHandler: @escaping (AFDataResponse<RemoveReviewResult>) -> Void) {
        let requestModel = RemoveReviewRequest(baseUrl: baseUrl, commentId: commentId)
        self.request(request: requestModel, completionHander: completionHandler)
    }
}

// MARK: - Get Reviews

extension ReviewManager: GetReviewRequestFactory {
    
    struct GetReviewsRequest: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .post
        let path: String = "getReviews"
        
        let pageNumber: Int
        
        var parameters: Parameters? {
            return [
                "page_number": pageNumber
            ]
        }
    }
    
    func getReviews(pageNumber: Int, completionHandler: @escaping (AFDataResponse<GetReviewsResult>) -> Void) {
        let requestModoel = GetReviewsRequest(baseUrl: baseUrl, pageNumber: pageNumber)
        self.request(request: requestModoel, completionHander: completionHandler)
    }
    
}
