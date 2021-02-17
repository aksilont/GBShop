//
//  Logout.swift
//  GBShop
//
//  Created by Aksilont on 17.02.2021.
//

import Foundation
import Alamofire

class Logout: AbstractRequestFactory {
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

extension Logout {
    struct LogoutRequest: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .get
        let path: String = "logout.json"
        
        let id: String
        
        var parameters: Parameters? {
            return [
                "id_user": id
            ]
        }
    }
}

extension Logout: LogoutRequestFactory {
    func logout(id: String, completionHandler: @escaping (AFDataResponse<LogoutResult>) -> Void) {
        let requestModel = LogoutRequest(baseUrl: baseUrl, id: id)
        self.request(request: requestModel, completionHander: completionHandler)
    }
}
