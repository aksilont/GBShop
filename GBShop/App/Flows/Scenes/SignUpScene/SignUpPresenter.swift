//
//  SignUpPresenter.swift
//  GBShop
//
//  Created by Aksilont on 10.03.2021.
//  Copyright (c) 2021 Aksilont. All rights reserved.
//

import UIKit

protocol SignUpPresentationLogic {
    func presentData(_ response: SignUpModels.SignUpUser.Response)
}

class SignUpPresenter: SignUpPresentationLogic {
    
    // MARK: - Public
    
    weak var viewController: SignUpDisplayLogic?
    
    // MARK: - SignUpPresentationLogic
    
    func presentData(_ response: SignUpModels.SignUpUser.Response) {
        if response.result == 1 {
            UserDefaults.standard.setValue(true, forKey: "isLogin")
            let viewModel = SignUpModels.SignUpUser.ViewModel(success: true, messsage: response.userMessage)
            viewController?.displayData(viewModel)
        } else {
            viewController?.displayError("Error")
        }
        
    }
    
}
