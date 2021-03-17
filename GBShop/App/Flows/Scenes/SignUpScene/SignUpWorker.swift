//
//  SignUpWorker.swift
//  GBShop
//
//  Created by Aksilont on 10.03.2021.
//  Copyright (c) 2021 Aksilont. All rights reserved.
//

import UIKit

class SignUpWorker {
    let requestFactory = RequestFactory(baseUrl: URL(string: "https://dry-earth-72663.herokuapp.com/")!)
    
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
