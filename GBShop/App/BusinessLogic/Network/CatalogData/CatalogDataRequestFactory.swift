//
//  CatalogDataRequestFactory.swift
//  GBShop
//
//  Created by Aksilont on 21.02.2021.
//

import Foundation
import Alamofire

protocol CatalogDataRequestFactory {
    func getData(
        pageNumber: String,
        categoryId: String,
        completionHandler: @escaping(AFDataResponse<[Product]>) -> Void
    )
}
