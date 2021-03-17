//
//  ChangeUserDataInteractor.swift
//  GBShop
//
//  Created by Aksilont on 14.03.2021.
//  Copyright (c) 2021 Aksilont. All rights reserved.
//

import Foundation

protocol ChangeUserDataBusinessLogic {
    func changeUserData(request: ChangeUserDataModels.ChangeUserData.Request)
}

protocol ChangeUserDataDataStore {
}

class ChangeUserDataInteractor: ChangeUserDataBusinessLogic, ChangeUserDataDataStore {
    
    // MARK: - Private
    
    private var worker: ChangeUserDataWorker?
    
    // MARK: - Public
    
    var presenter: ChangeUserDataPresentationLogic?
    
    // MARK: - ChangeUserDataBusinessLogic
    
    func changeUserData(request: ChangeUserDataModels.ChangeUserData.Request) {
        worker = ChangeUserDataWorker()
        worker?.changeUserData(
            userName: request.userName,
            password: request.password,
            email: request.email,
            gender: request.gender,
            creditCard: request.creditCard,
            bio: request.bio,
            completion: { model in
                let response = ChangeUserDataModels.ChangeUserData.Response(result: model.result)
                self.presenter?.presentData(response: response)
            }
        )
        
    }
}
