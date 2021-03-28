//
//  Review.swift
//  GBShop
//
//  Created by Aksilont on 28.02.2021.
//

import Foundation

struct Review: Codable {
    let id: Int
    let text: String
    
    enum CodingKeys: String, CodingKey {
        case id = "id_comment"
        case text
    }
}
