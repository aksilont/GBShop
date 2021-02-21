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
        
        XCTAssertNotNil(goodsById, "Init GoodsById")
    }

    func testGetGoodsById() throws {
        let baseUrl = try XCTUnwrap(URL(string: "https://raw.githubusercontent.com/GeekBrainsTutorial/online-store-api/master/responses/"))
        
        let configureation = URLSessionConfiguration.default
        configureation.httpShouldSetCookies = false
        configureation.headers = .default
        
        let session = Session(configuration: configureation)
        
        let goodsById = GoodsById(errorParser: ErrorParser(), sessionManager: session, baseUrl: baseUrl)
        let goodsByIdExpectation = expectation(description: "Get goods by id")
        
        goodsById.getGoodsById(id: "111") { response in
            switch response.result {
            case .success(let modelResult):
                XCTAssertEqual(modelResult.result, 1)
                XCTAssertEqual(modelResult.name, "Ноутбук")
                XCTAssertEqual(modelResult.price, 45600)
                XCTAssertEqual(modelResult.description, "Мощный игровой ноутбук")
                goodsByIdExpectation.fulfill()
            case .failure(let error):
                XCTFail(error.localizedDescription)
            }
        }
        wait(for: [goodsByIdExpectation], timeout: 5.0)
    }
    
    func testFailedGetGoodsById() throws {
        let baseUrl = try XCTUnwrap(URL(string: "https://failUrl"))
        
        let configureation = URLSessionConfiguration.default
        configureation.httpShouldSetCookies = false
        configureation.headers = .default
        
        let session = Session(configuration: configureation)
        
        let goodsById = GoodsById(errorParser: ErrorParser(), sessionManager: session, baseUrl: baseUrl)
        let goodsByIdExpectation = expectation(description: "Get goods by id")
        
        goodsById.getGoodsById(id: "111") { response in
            switch response.result {
            case .success(let modelResult):
                XCTFail("Should have a error \(modelResult)")
            case .failure:
                goodsByIdExpectation.fulfill()
            }
        }
        wait(for: [goodsByIdExpectation], timeout: 5.0)
    }
    
}
