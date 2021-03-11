//
//  ErrorParser.swift
//  GBShop
//
//  Created by Aksilont on 14.02.2021.
//

import UIKit

class ErrorParser: AbstractErrorParser {
    func parse(_ result: Error) -> Error {
        return result
    }
    
    func parse(response: HTTPURLResponse?, data: Data?, error: Error?) -> Error? {
        return nil
    }
}
