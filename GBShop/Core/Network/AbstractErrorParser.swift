//
//  AbstractErrorParser.swift
//  GBShop
//
//  Created by Aksilont on 14.02.2021.
//

import Foundation

protocol AbstractErrorParser {
    func parse(_ result: Error) -> Error
    func parse(response: HTTPURLResponse?, data: Data?, error: Error?) -> Error?
}

