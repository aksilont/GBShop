//
//  BasketManager.swift
//  GBShop
//
//  Created by Aksilont on 02.03.2021.
//

import Foundation
import Alamofire

class BasketManager: AbstractRequestFactory {
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

// MARK: - Add to basket

extension BasketManager: AddToBasketRequestFactory {
    struct AddToBasketRequest: RequestRouter {
        var baseUrl: URL
        var method: HTTPMethod = .post
        var path: String = "addToBasket"
        
        var productId: Int
        var quantity: Int
        
        var parameters: Parameters? {
            return [
                "id_product": productId,
                "quantity": quantity
            ]
        }
    }
    
    func addToBasket(productId: Int,
                     quantity: Int,
                     completionHandler: @escaping (AFDataResponse<AddToBasketResult>) -> Void
    ) {
        let requestModel = AddToBasketRequest(baseUrl: baseUrl, productId: productId, quantity: quantity)
        self.request(request: requestModel, completionHander: completionHandler)
    }
}

// MARK: - Delete from basket

extension BasketManager: DeleteFromBasketRequestFactory {
    struct DeleteFromBasketRequest: RequestRouter {
        var baseUrl: URL
        var method: HTTPMethod = .post
        var path: String = "deleteFromBasket"
        
        var productId: Int
        
        var parameters: Parameters? {
            return [
                "id_product": productId
            ]
        }
        
    }
    
    func deleteFromBasket(productId: Int,
                          completionHandler: @escaping (AFDataResponse<DeleteFromBasketResult>) -> Void
    ) {
        let requestModel = DeleteFromBasketRequest(baseUrl: baseUrl, productId: productId)
        self.request(request: requestModel, completionHander: completionHandler)
    }
}

// MARK: - Pay basket

extension BasketManager: PayBasketRequestFactory {
    
    struct PayBasketRequest: RequestRouter {
        var baseUrl: URL
        var method: HTTPMethod = .post
        var path: String = "payBasket"
        
        var userId: Int
        
        var parameters: Parameters? {
            return [
                "id_user": userId
            ]
        }
    }
    
    func payBasket(userId: Int, completionHandler: @escaping (AFDataResponse<PayBasketResult>) -> Void) {
        let requestModel = PayBasketRequest(baseUrl: baseUrl, userId: userId)
        self.request(request: requestModel, completionHander: completionHandler)
    }
}

// MARK: - Get basket

extension BasketManager: GetBasketRequestFactory {
    
    struct GetBasketRequest: RequestRouter {
        var baseUrl: URL
        var method: HTTPMethod = .post
        var path: String = "getBasket"
        
        var userId: Int
        
        var parameters: Parameters? {
            return [
                "id_user": userId
            ]
        }
    }
    
    func getBasket(userId: Int, completionHandler: @escaping (AFDataResponse<GetBasketResult>) -> Void) {
        let requestModel = GetBasketRequest(baseUrl: baseUrl, userId: userId)
        self.request(request: requestModel, completionHander: completionHandler)
    }
}
