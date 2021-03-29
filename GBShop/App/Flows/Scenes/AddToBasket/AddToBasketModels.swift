//
//  AddToBasketModels.swift
//  GBShop
//
//  Created by Aksilont on 29.03.2021.
//  Copyright (c) 2021 Aksilont. All rights reserved.
//

import UIKit

enum AddToBasketModels {
    
    enum AddToBasket {
        struct Request {
            let productId: Int
            let quantity: Int
        }
        struct Response {
            let result: Int
        }
        struct ViewModel {
            let message: String?
        }
    }
    
}
