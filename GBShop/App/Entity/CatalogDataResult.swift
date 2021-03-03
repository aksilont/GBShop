//
//  CatalogDataResult.swift
//  GBShop
//
//  Created by Aksilont on 24.02.2021.
//

import Foundation

struct CatalogDataResult: Codable {
    let page_number: Int
    let products: [Product]
}
