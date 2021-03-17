//
//  ChangeUserDataModels.swift
//  GBShop
//
//  Created by Aksilont on 14.03.2021.
//  Copyright (c) 2021 Aksilont. All rights reserved.
//

import UIKit

enum ChangeUserDataModels {
    
    enum ChangeUserData {
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
        }
        struct ViewModel {
            let result: Int
        }
    }
    
}
