//
//  ChangeUserDataPresenter.swift
//  GBShop
//
//  Created by Aksilont on 14.03.2021.
//  Copyright (c) 2021 Aksilont. All rights reserved.
//

import UIKit

protocol ChangeUserDataPresentationLogic {
    func presentData(response: ChangeUserDataModels.ChangeUserData.Response)
}

class ChangeUserDataPresenter: ChangeUserDataPresentationLogic {
    
    // MARK: - Public
    
    weak var viewController: ChangeUserDataDisplayLogic?
    
    // MARK: - ChangeUserDataPresentationLogic
    
    func presentData(response: ChangeUserDataModels.ChangeUserData.Response) {
        if response.result == 1 {
            let viewModel = ChangeUserDataModels.ChangeUserData.ViewModel(success: true,
                                                                          message: "Success to change user profile")
            viewController?.displayData(viewModel)
        } else {
            viewController?.displayError("Error")
        }
    }
}
