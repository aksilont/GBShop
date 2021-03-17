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
        let viewModel = ChangeUserDataModels.ChangeUserData.ViewModel(result: response.result)
        viewController?.displayData(viewModel: viewModel)
    }
}
