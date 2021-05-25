//
//  SignUpInteractor.swift
//  GBShop
//
//  Created by Aksilont on 10.03.2021.
//  Copyright (c) 2021 Aksilont. All rights reserved.
//

import UIKit

protocol SignUpBusinessLogic {
    func signUp(request: SignUpModels.SignUpUser.Request)
}

class SignUpInteractor: SignUpBusinessLogic {
    
    // MARK: - Private
    
    private let requestFactory: RequestFactory
    private let worker: SignUpWorker
    
    // MARK: - Public
    
    var presenter: SignUpPresentationLogic?
    
    // MARK: - Init
    
    init(with requestFactory: RequestFactory) {
        self.requestFactory = requestFactory
        self.worker = SignUpWorker(with: requestFactory)
    }
    
    // MARK: - SignUpBusinessLogic
    
    func signUp(request: SignUpModels.SignUpUser.Request) {
        worker.signUpUser(
            userName: request.userName,
            password: request.password,
            email: request.email,
            gender: request.gender,
            creditCard: request.creditCard,
            bio: request.bio,
            completion: { (model) in
                let response = SignUpModels.SignUpUser.Response(result: model.result, userMessage: model.userMessage)
                AnalyticsManager.shared.trackSignUp("signUp(request: SignUpModels.SignUpUser.Request)")
                self.presenter?.presentData(response)
            }
        )
    }
}
