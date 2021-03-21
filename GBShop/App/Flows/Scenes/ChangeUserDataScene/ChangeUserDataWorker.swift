//
//  ChangeUserDataWorker.swift
//  GBShop
//
//  Created by Aksilont on 14.03.2021.
//  Copyright (c) 2021 Aksilont. All rights reserved.
//

import Foundation

class ChangeUserDataWorker {
    
    // MARK: - Private
    
    private let requestFactory: RequestFactory
    
    // MARK: - Init
    
    init(with requestFactory: RequestFactory) {
        self.requestFactory = requestFactory
    }
    
    // MARK: - Services
    
    func changeUserData(userName: String,
                        password: String,
                        email: String,
                        gender: String,
                        creditCard: String,
                        bio: String,
                        completion: @escaping(ChangeUserDataResult) -> Void) {
        
        let changeUserDataFactory = requestFactory.makeChangeUserDataFactory()
        
        changeUserDataFactory.changeUserData(
            id: "123",
            userName: userName,
            password: password,
            email: email,
            gender: gender,
            creditCard: creditCard,
            bio: bio,
            completionHandler: { response in
                switch response.result {
                case .success(let model):
                    completion(model)
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        )
    }
}
