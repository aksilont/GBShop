//
//  GoodsByIdModels.swift
//  GBShop
//
//  Created by Aksilont on 23.03.2021.
//  Copyright (c) 2021 Aksilont. All rights reserved.
//

import UIKit

enum GoodsByIdModels {
    
    enum GoodsById {
        struct Request {
        }
        struct Response {
            let result: Int
            let id: Int
            let price: Int
            let description: String
            let name: String
        }
        struct ViewModel {
            let id: Int
            let price: Int
            let description: String
            let name: String
            let message: String
        }
    }
    
}
