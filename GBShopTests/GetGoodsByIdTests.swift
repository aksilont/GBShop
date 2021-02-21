//
//  GetGoodsByIdTests.swift
//  GBShopTests
//
//  Created by Aksilont on 21.02.2021.
//

import XCTest
import Alamofire
@testable import GBShop

class GetGoodsByIdTests: XCTestCase {

    func testInitGoodsById() throws {
        let baseUrl = try XCTUnwrap(URL(string: "https://raw.githubusercontent.com/GeekBrainsTutorial/online-store-api/master/responses/"))
        
        let configureation = URLSessionConfiguration.default
        configureation.httpShouldSetCookies = false
        configureation.headers = .default
        
        let session = Session(configuration: configureation)
        
        let goodsById = GoodsById(errorParser: ErrorParser(), sessionManager: session, baseUrl: baseUrl)
        
        XCTAssertNotNil(catalogData, "Init GoodsById")
    }

}
