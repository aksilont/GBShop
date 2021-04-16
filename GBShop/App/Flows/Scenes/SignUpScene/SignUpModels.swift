//
//  SignUpModels.swift
//  GBShop
//
//  Created by Aksilont on 10.03.2021.
//  Copyright (c) 2021 Aksilont. All rights reserved.
//

import UIKit

enum SignUpModels {
    
    enum SignUpUser {
        struct Request {
            let id: Int
            let userName: String
            let password: String
            let email: String
            let gender: String
            let creditCard: String
            let bio: String
        }
        struct Response {
            let result: Int
            let userMessage: String
        }
        struct ViewModel {
            let success: Bool
            let messsage: String?
        }
    }
    
}
