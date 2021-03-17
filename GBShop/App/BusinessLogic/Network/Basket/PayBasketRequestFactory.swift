//
//  PayBasketRequestFactory.swift
//  GBShop
//
//  Created by Aksilont on 03.03.2021.
//

import Foundation
import Alamofire

protocol PayBasketRequestFactory {
    func payBasket(userId: Int, completionHandler: @escaping(AFDataResponse<PayBasketResult>) -> Void)
}
