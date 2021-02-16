//
//  AuthRequestFactory.swift
//  GBShop
//
//  Created by Aksilont on 15.02.2021.
//

import Foundation
import Alamofire

protocol AuthRequestFactory {
    func login(userName: String, password: String, completionHandler: @escaping(AFDataResponse<LoginResult>) -> Void)
}
