//
//  CatalogDataTests.swift
//  GBShopTests
//
//  Created by Aksilont on 21.02.2021.
//

import XCTest
import Alamofire
@testable import GBShop

class CatalogDataTests: XCTestCase {

    func testInitCatalogData() throws {
        let baseUrl = try XCTUnwrap(URL(string: "https://raw.githubusercontent.com/GeekBrainsTutorial/online-store-api/master/responses/"))
        
        let configureation = URLSessionConfiguration.default
        configureation.httpShouldSetCookies = false
        configureation.headers = .default
        
        let session = Session(configuration: configureation)
        
        let catalogData = CatalogData(errorParser: ErrorParser(), session: session, baseUrl: baseUrl)
        
        XCTAssertNil(catalogData)
    }
}
