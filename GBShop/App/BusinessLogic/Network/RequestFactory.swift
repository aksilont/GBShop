//
//  RequestFactory.swift
//  GBShop
//
//  Created by Aksilont on 15.02.2021.
//

import Foundation
import Alamofire

class RequestFactory {
    let baseUrl: URL
    
    init(baseUrl: URL) {
        self.baseUrl = baseUrl
    }
    
    func makeErrorParser() -> AbstractErrorParser {
        return ErrorParser()
    }
    
    lazy var commonSession: Session = {
        let configuration = URLSessionConfiguration.default
        configuration.httpShouldSetCookies = false
        configuration.headers = .default
        let manager = Session(configuration: configuration)
        return manager
    }()
    
    let sessionQueue = DispatchQueue.global(qos: .utility)
    
    func makeAuthRequestFactory() -> AuthRequestFactory {
        let errorParser = makeErrorParser()
        return Auth(errorParser: errorParser, sessionManager: commonSession, queue: sessionQueue, baseUrl: baseUrl)
    }
    
    func makeSignUpRequestFactory() -> SignUpRequestFactory {
        let errorParser = makeErrorParser()
        return SignUp(errorParser: errorParser, sessionManager: commonSession, queue: sessionQueue, baseUrl: baseUrl)
    }
    
    func makeLogoutFactory() -> LogoutRequestFactory {
        let errorParser = makeErrorParser()
        return Logout(errorParser: errorParser, sessionManager: commonSession, queue: sessionQueue, baseUrl: baseUrl)
    }
    
    func makeChangeUserDataFactory() -> ChangeUserDataRequestFactory {
        let errorParser = makeErrorParser()
        return ChangeUserData(errorParser: errorParser,
                              sessionManager: commonSession,
                              queue: sessionQueue,
                              baseUrl: baseUrl)
    }
    
    func makeCatalogDataFactory() -> CatalogDataRequestFactory {
        let errorParser = makeErrorParser()
        return CatalogData(errorParser: errorParser,
                           sessionManager: commonSession,
                           queue: sessionQueue,
                           baseUrl: baseUrl)
    }
    
    func makeGoodsByIdFactory() -> GoodsByIdRequestFactory {
        let errorParser = makeErrorParser()
        return GoodsById(errorParser: errorParser,
                         sessionManager: commonSession,
                         queue: sessionQueue,
                         baseUrl: baseUrl)
    }
    
    func makeGetReviewsFactory() -> GetReviewRequestFactory {
        let errorParser = makeErrorParser()
        return ReviewManager(errorParser: errorParser,
                             sessionManager: commonSession,
                             queue: sessionQueue,
                             baseUrl: baseUrl)
    }
}
