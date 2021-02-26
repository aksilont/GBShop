//
//  GoodsById.swift
//  GBShop
//
//  Created by Aksilont on 21.02.2021.
//

import Foundation
import Alamofire

class GoodsById: AbstractRequestFactory {
    var errorParser: AbstractErrorParser
    var sessionManager: Session
    var queue: DispatchQueue
    let baseUrl: URL
    
    init(errorParser: AbstractErrorParser, sessionManager: Session, queue: DispatchQueue = DispatchQueue.global(qos: .utility), baseUrl: URL) {
        self.errorParser = errorParser
        self.sessionManager = sessionManager
        self.queue = queue
        self.baseUrl = baseUrl
    }
}

extension GoodsById: GoodsByIdRequestFactory {
    
    struct GoodsByIdRequest: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .get
        let path: String = "getGoodById.json"
        
        let id: String
        
        var parameters: Parameters? {
            return [
                "id_product": id
            ]
        }
    }
    
    func getGoodsById(id: String, completionHandler: @escaping (AFDataResponse<GoodsByIdResult>) -> Void) {
        let requestModel = GoodsByIdRequest(baseUrl: baseUrl, id: id)
        self.request(request: requestModel, completionHander: completionHandler)
    }
}
