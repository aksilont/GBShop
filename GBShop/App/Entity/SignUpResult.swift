//
//  SignUpResult.swift
//  GBShop
//
//  Created by Aksilont on 16.02.2021.
//

import Foundation

struct SignUpResult: Codable {
    let result: Int
    let userMessage: String
    
    enum CodingKeys: String, CodingKey {
        case result
        case userMessage = "user_message"
    }
}
