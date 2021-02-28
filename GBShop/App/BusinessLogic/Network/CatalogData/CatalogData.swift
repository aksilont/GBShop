//
//  CatalogData.swift
//  GBShop
//
//  Created by Aksilont on 21.02.2021.
//

import Foundation
import Alamofire

class CatalogData: AbstractRequestFactory {
    var errorParser: AbstractErrorParser
    var sessionManager: Session
    var queue: DispatchQueue
    let baseUrl: URL
    
    init(errorParser: AbstractErrorParser,
         sessionManager: Session,
         queue: DispatchQueue = DispatchQueue.global(qos: .utility),
         baseUrl: URL
    ) {
        self.errorParser = errorParser
        self.sessionManager = sessionManager
        self.queue = queue
        self.baseUrl = baseUrl
    }
}

extension CatalogData: CatalogDataRequestFactory {
    
    struct CatalogDataRequest: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .post
        let path: String = "catalogData"
        
        let pageNumber: String
        let categoryId: String
        
        var parameters: Parameters? {
            return [
                "page_number": pageNumber,
                "id_category": categoryId
            ]
        }
    }
    
    func getData(pageNumber: String,
                 categoryId: String,
                 completionHandler: @escaping (AFDataResponse<CatalogDataResult>) -> Void
    ) {
        let requestModel = CatalogDataRequest(baseUrl: baseUrl, pageNumber: pageNumber, categoryId: categoryId)
        self.request(request: requestModel, completionHander: completionHandler)
    }
}
