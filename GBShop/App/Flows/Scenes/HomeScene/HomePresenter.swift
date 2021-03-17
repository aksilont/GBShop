//
//  HomePresenter.swift
//  GBShop
//
//  Created by Aksilont on 11.03.2021.
//  Copyright (c) 2021 Aksilont. All rights reserved.
//

import UIKit

protocol HomePresentationLogic {
    func presentSomething(response: HomeModels.Something.Response)
}

class HomePresenter: HomePresentationLogic {
    
    // MARK: - Public
    
    weak var viewController: HomeDisplayLogic?
    
    // MARK: - HomePresentationLogic
    
    func presentSomething(response: HomeModels.Something.Response) {
        let viewModel = HomeModels.Something.ViewModel()
        viewController?.displaySomething(viewModel: viewModel)
    }
}
