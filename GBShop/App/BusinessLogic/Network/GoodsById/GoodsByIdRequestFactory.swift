//
//  GoodsByIdRequestFactory.swift
//  GBShop
//
//  Created by Aksilont on 21.02.2021.
//

import Foundation
import Alamofire

protocol GoodsByIdRequestFactory {
    func getGoodsById(id: String, completionHandler: @escaping(AFDataResponse<GoodsByIdResult>) -> Void)
}
