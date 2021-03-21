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
            let viewModel = SignUpModels.SignUpUser.ViewModel(success: true, userMessage: response.userMessage)
            viewController?.displayData(viewModel)
        } else {
            viewController?.displayError("Error")
        }
        
    }
    
}
