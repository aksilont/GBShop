//
//  GetBasketResult.swift
//  GBShop
//
//  Created by Aksilont on 28.03.2021.
//  Copyright © 2021 Aksilont. All rights reserved.
//

import Foundation

struct GetBasketResult: Codable {
    let userId: Int
    let basket: [BasketItem]
    
    enum CodingKeys: String, CodingKey {
        case userId = "id_user"
        case basket
    }
}
