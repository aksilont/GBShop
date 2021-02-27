//
//  GoodsByIdResult.swift
//  GBShop
//
//  Created by Aksilont on 21.02.2021.
//

import Foundation

struct GoodsByIdResult: Codable {
    let result: Int
    let name: String
    let price: Int
    let description: String
    
    enum CodingKeys: String, CodingKey {
        case result
        case name = "product_name"
        case price = "product_price"
        case description = "product_description"
    }
}
