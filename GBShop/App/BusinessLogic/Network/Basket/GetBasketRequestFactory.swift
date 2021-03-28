//
//  GetBasketRequestFactory.swift
//  GBShop
//
//  Created by Aksilont on 28.03.2021.
//  Copyright © 2021 Aksilont. All rights reserved.
//

import Foundation
import Alamofire

protocol GetBasketRequestFactory {
    func getBasket(userId: Int, completionHandler: @escaping(AFDataResponse<GetBasketResult>) -> Void)
}
