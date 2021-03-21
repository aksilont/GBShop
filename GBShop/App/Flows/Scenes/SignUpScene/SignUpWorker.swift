//
//  SignUpWorker.swift
//  GBShop
//
//  Created by Aksilont on 10.03.2021.
//  Copyright (c) 2021 Aksilont. All rights reserved.
//

import UIKit

class SignUpWorker {
    
    // MARK: - Private
    
    private let requestFactory: RequestFactory
    
    // MARK: - Init
    
    init(with requestFactory: RequestFactory) {
        self.requestFactory = requestFactory
    }
    
    // MARK: - Services
    
    func signUpUser(userName: String,
                    password: String,
                    email: String,
                    gender: String,
                    creditCard: String,
                    bio: String,
                    completion: @escaping(SignUpResult) -> Void) {
        
        let signUpFactory = requestFactory.makeSignUpRequestFactory()
        
        signUpFactory.signUp(
            id: 123,
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
