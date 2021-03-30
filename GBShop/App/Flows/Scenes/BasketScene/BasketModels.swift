//
//  BasketModels.swift
//  GBShop
//
//  Created by Aksilont on 26.03.2021.
//  Copyright (c) 2021 Aksilont. All rights reserved.
//

import UIKit

enum BasketModels {
    
    enum Basket {
        struct Request {
            let userId: Int
        }
        struct Response {
            let userId: Int
            let basket: [BasketItem]
        }
        struct ViewModel {
            let basket: [BasketItem]
            let message: String?
        }
    }
    
    enum DeleteFromBasket {
        struct Request {
            let productId: Int
        }
        struct Response {
            let result: Int
        }
        struct ViewModel {
            let success: Bool
            let message: String?
        }
    }
    
}
