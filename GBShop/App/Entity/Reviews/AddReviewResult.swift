//
//  AddReviewResult.swift
//  GBShop
//
//  Created by Aksilont on 28.02.2021.
//

import Foundation

struct AddReviewResult: Codable {
    let result: Int
    let userMessage: String
    
    enum CodingKeys: String, CodingKey {
        case result
        case userMessage = "user_message"
    }
}
