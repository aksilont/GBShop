//
//  AuthInteractor.swift
//  GBShop
//
//  Created by Aksilont on 10.03.2021.
//

import Foundation

protocol AuthBisnessLogic {
    func loginUser(_ request: AuthModels.LoginUser.Request)
    func logoutUser(_ request: AuthModels.LogoutUser.Request)
}

protocol AuthDataStore {
}

final class AuthInteractor: AuthBisnessLogic, AuthDataStore {
    
    // MARK: - Private
    
    private let requestFactory: RequestFactory
    private let worker: AuthWorker
    
    // MARK: - Public
    
    var presenter: AuthPresentationLogic?
    
    // MARK: - Init
    
    init(with requestFactory: RequestFactory) {
        self.requestFactory = requestFactory
        self.worker = AuthWorker(with: requestFactory)
    }
    
    // MARK: - AuthBisnessLogic
    
    func loginUser(_ request: AuthModels.LoginUser.Request) {
        worker.loginUser(userName: request.userName, password: request.password) { (model) in
            let response = AuthModels.LoginUser.Response(result: model.result, user: model.user)
            AnalyticsManager.shared.trackSignIn("displayUser(_ viewModel: AuthModels.LoginUser.ViewModel)")
            self.presenter?.presentUser(response)
        }
    }
    
    func logoutUser(_ request: AuthModels.LogoutUser.Request) {
        worker.logoutUser(userId: "\(request.userId)", completion: { modelResponse in
            let response = AuthModels.LogoutUser.Response(result: modelResponse.result)
            AnalyticsManager.shared.trackLogout("logoutUser(_ request: AuthModels.LogoutUser.Request)")
            self.presenter?.presentLogoutUser(response)
        })
    }
}
