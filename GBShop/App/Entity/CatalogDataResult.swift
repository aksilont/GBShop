//
//  CatalogDataResult.swift
//  GBShop
//
//  Created by Aksilont on 24.02.2021.
//

import Foundation

struct CatalogDataResult: Codable {
    let pageNumber: Int
    let products: [Product]
    
    enum CodingKeys: String, CodingKey {
        case pageNumber = "page_number"
        case products
    }
}
