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
    
    private var worker: SignUpWorker?
    
    // MARK: - Public
    
    var presenter: SignUpPresentationLogic?
    
    // MARK: - SignUpBusinessLogic
    
    func signUp(request: SignUpModels.SignUpUser.Request) {
        worker = SignUpWorker()
        worker?.signUpUser(
            userName: request.userName,
            password: request.password,
            email: request.email,
            gender: request.gender,
            creditCard: request.creditCard,
            bio: request.bio,
            completion: { (model) in
                let response = SignUpModels.SignUpUser.Response(result: model.result, userMessage: model.userMessage)
                self.presenter?.presentData(response)
            }
        )
    }
}
