//
//  DeleteFromBasketRequestFactory.swift
//  GBShop
//
//  Created by Aksilont on 02.03.2021.
//

import Foundation
import Alamofire

protocol DeleteFromBasketRequestFactory {
    func deleteFromBasket(productId: Int, completionHandler: @escaping(AFDataResponse<DeleteFromBasketResult>) -> Void)
}
