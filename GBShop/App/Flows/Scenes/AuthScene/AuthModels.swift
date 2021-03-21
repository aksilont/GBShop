//
//  AuthModels.swift
//  GBShop
//
//  Created by Aksilont on 10.03.2021.
//

import Foundation

enum AuthModels {
    
    enum LoginUser {
        struct Request {
            let userName: String
            let password: String
        }
        struct Response {
            var result: Int
            var user: User
        }
        struct ViewModel {
            let success: Bool
            let user: User
        }
    }
    
    enum LogoutUser {
        struct Request {
            let userId: Int
        }
        struct Response {
            var result: Int
        }
        struct ViewModel {
            let success: Bool
            let message: String?
        }
    }
    
}
