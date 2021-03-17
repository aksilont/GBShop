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
        let viewModel = SignUpModels.SignUpUser.ViewModel(result: response.result, userMessage: response.userMessage)
        viewController?.displayData(viewModel)
    }
    
}
