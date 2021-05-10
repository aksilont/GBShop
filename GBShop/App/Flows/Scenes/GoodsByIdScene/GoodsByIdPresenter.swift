//
//  GoodsByIdPresenter.swift
//  GBShop
//
//  Created by Aksilont on 23.03.2021.
//  Copyright (c) 2021 Aksilont. All rights reserved.
//

import UIKit

protocol GoodsByIdPresentationLogic {
    func presentGoodsById(response: GoodsByIdModels.GoodsById.Response)
}

class GoodsByIdPresenter: GoodsByIdPresentationLogic {
    
    // MARK: - Public
    
    weak var viewController: GoodsByIdDisplayLogic?
    
    // MARK: - GoodsByIdPresentationLogic
    
    func presentGoodsById(response: GoodsByIdModels.GoodsById.Response) {
        if response.result == 1 {
            let viewModel = GoodsByIdModels.GoodsById.ViewModel(id: response.id,
                                                                price: response.price,
                                                                description: response.description,
                                                                name: response.name,
                                                                message: "Succes to get Goods by Id \(response.id)")
            viewController?.displayGoodsById(viewModel)
        } else {
            viewController?.displayError("ERROR to get Goods by Id")
        }
    }
}
