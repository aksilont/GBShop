//
//  ChangeUserData.swift
//  GBShop
//
//  Created by Aksilont on 17.02.2021.
//

import Foundation
import Alamofire

class ChangeUserData: AbstractRequestFactory {
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

extension ChangeUserData {
    struct ChangeUserDataRequest: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .post
        let path: String = "changeUserData"
        
        let id: String
        let userName: String
        let password: String
        let email: String
        let gender: String
        let creditCard: String
        let bio: String
        
        var parameters: Parameters? {
            return [
                "id_user": id,
                "username": userName,
                "password": password,
                "email": email,
                "gender": gender,
                "credit_card": creditCard,
                "bio": bio
            ]
        }
    }
}

extension ChangeUserData: ChangeUserDataRequestFactory {
    func changeUserData(
        id: String,
        userName: String,
        password: String,
        email: String,
        gender: String,
        creditCard: String,
        bio: String,
        completionHandler: @escaping(AFDataResponse<ChangeUserDataResult>) -> Void
    ) {
        let requestModel = ChangeUserDataRequest(
            baseUrl: baseUrl,
            id: id,
            userName: userName,
            password: password,
            email: email,
            gender: gender,
            creditCard: creditCard,
            bio: bio
        )
        self.request(request: requestModel, completionHander: completionHandler)
    }
}
