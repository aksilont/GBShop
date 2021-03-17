//
//  AuthPresenter.swift
//  GBShop
//
//  Created by Aksilont on 10.03.2021.
//

import Foundation

protocol AuthPresentationLogic {
    func presentUser(_ response: AuthModels.LoginUser.Response)
    func presentLogoutUser( _ response: AuthModels.LogoutUser.Response)
}

final class AuthPresenter: AuthPresentationLogic {
    
    // MARK: - Public
    
    weak var viewController: AuthDisplayLogic?
    
    // MARK: - AuthPresentationLogic
    
    func presentUser(_ response: AuthModels.LoginUser.Response) {
        let viewModel = AuthModels.LoginUser.ViewModel(result: response.result, user: response.user)
        viewController?.displayUser(viewModel)
    }
    
    func presentLogoutUser( _ response: AuthModels.LogoutUser.Response) {
        let viewModel = AuthModels.LogoutUser.ViewModel(result: response.result)
        viewController?.displayLogoutUser(viewModel)
    }
}
