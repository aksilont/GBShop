//
//  SignUpRequestFactory.swift
//  GBShop
//
//  Created by Aksilont on 16.02.2021.
//

import Foundation
import Alamofire

protocol SignUpRequestFactory {
    func signUp(
        id: Int,
        userName: String,
        password: String,
        email: String,
        gender: String,
        creditCard: String,
        bio: String,
        completionHandler: @escaping(AFDataResponse<SignUpResult>) -> Void
    )
}
