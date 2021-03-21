//
//  HomePresenter.swift
//  GBShop
//
//  Created by Aksilont on 11.03.2021.
//  Copyright (c) 2021 Aksilont. All rights reserved.
//

import UIKit

protocol HomePresentationLogic {
    func presentCatalogData(response: HomeModels.CatalogData.Response)
}

class HomePresenter: HomePresentationLogic {
    
    // MARK: - Public
    
    weak var viewController: HomeDisplayLogic?
    
    // MARK: - HomePresentationLogic
    
    func presentCatalogData(response: HomeModels.CatalogData.Response) {
        if response.products.isEmpty {
            viewController?.displayError("Error")
        } else {
            let viewModel = HomeModels.CatalogData.ViewModel(success: true,
                                                             pageNumber: response.pageNumber,
                                                             products: response.products,
                                                             message: "Success to get catalog data")
            viewController?.displayCatalogData(viewModel)
        }
        
    }
}
