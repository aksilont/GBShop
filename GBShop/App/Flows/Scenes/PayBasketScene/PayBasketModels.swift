//
//  PayBasketModels.swift
//  GBShop
//
//  Created by Aksilont on 28.03.2021.
//  Copyright (c) 2021 Aksilont. All rights reserved.
//

import UIKit

enum PayBasketModels {
    
    enum PayBasket {
        struct Request {
            let userId: Int
        }
        struct Response {
            let userId: Int
            let result: Int
            let message: String?
        }
        struct ViewModel {
            let userId: Int
            let message: String?
        }
    }
    
}
