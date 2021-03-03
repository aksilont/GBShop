//
//  PayBasketResult.swift
//  GBShop
//
//  Created by Aksilont on 03.03.2021.
//

import Foundation

struct PayBasketResult: Codable {
    let result: Int
    let userMessage: String
    
    enum CodingKeys: String, CodingKey {
        case result
        case userMessage = "user_message"
    }
}
