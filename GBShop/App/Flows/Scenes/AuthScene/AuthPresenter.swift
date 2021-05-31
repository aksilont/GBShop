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
        if response.result == 1 {
            let viewModel = AuthModels.LoginUser.ViewModel(success: true, user: response.user)
            viewController?.displayUser(viewModel)
        } else {
            AnalyticsManager.shared.trackSignInFail("presentUser(_ response: AuthModels.LoginUser.Response)")
            viewController?.displayError("Error to login")
        }
    }
    
    func presentLogoutUser( _ response: AuthModels.LogoutUser.Response) {
        if response.result == 1 {
            viewController?.displayLogoutUser("Logout success")
        } else {
            AnalyticsManager.shared.trackSignInFail("presentLogoutUser( _ response: AuthModels.LogoutUser.Response)")
            viewController?.displayError("Error to logout")
        }
    }
}
