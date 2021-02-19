//
//  ChangeUserDataRequestFactory.swift
//  GBShop
//
//  Created by Aksilont on 17.02.2021.
//

import Foundation
import Alamofire

protocol ChangeUserDataRequestFactory {
    func changeUserData(
        id: String,
        userName: String,
        password: String,
        email: String,
        gender: String,
        creditCard: String,
        bio: String,
        completionHandler: @escaping(AFDataResponse<ChangeUserDataResult>) -> Void
    )
}
