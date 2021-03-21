//
//  HomeModels.swift
//  GBShop
//
//  Created by Aksilont on 11.03.2021.
//  Copyright (c) 2021 Aksilont. All rights reserved.
//

import UIKit

enum HomeModels {
    
    enum CatalogData {
        struct Request {
            let pageNumber: String
            let categoryId: String
        }
        struct Response {
            let pageNumber: Int
            let products: [Product]
        }
        struct ViewModel {
            let success: Bool
            let pageNumber: Int
            let products: [Product]
            let message: String?
        }
    }
    
}
