//
//  User.swift
//  GBShop
//
//  Created by Aksilont on 15.02.2021.
//

import Foundation

struct User: Codable {
    let id: Int
    let login: String
    let name: String
    let lastName: String
    
    enum CodingKeys: String, CodingKey {
        case id = "id_user"
        case login = "user_login"
        case name = "user_name"
        case lastName = "user_lastname"
    }
}
