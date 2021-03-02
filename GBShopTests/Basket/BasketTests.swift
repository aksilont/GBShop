//
//  BasketTests.swift
//  GBShopTests
//
//  Created by Aksilont on 02.03.2021.
//

import XCTest
import Alamofire
@testable import GBShop

class BasketTests: XCTestCase {

    var baseUrl: URL!
    var failUrl: URL!
    var session: Session!
    
    override func setUpWithError() throws {
        baseUrl = try XCTUnwrap(URL(string: "https://dry-earth-72663.herokuapp.com/"))
        failUrl = try XCTUnwrap(URL(string: "https://failURL"))
        
        let configureation = URLSessionConfiguration.default
        configureation.httpShouldSetCookies = false
        configureation.headers = .default
        
        session = Session(configuration: configureation)
    }

    override func tearDownWithError() throws {
        baseUrl = nil
        failUrl = nil
        session = nil
    }
    
    // MARK: - Tests Init
    
    func testInitBasketManager() {
        let basketManager = BasketManager(errorParser: ErrorParser(), sessionManager: session, baseUrl: baseUrl)
        XCTAssertNotNil(basketManager, "Init Basket Manager")
    }
    
    // MARK: - Tests Add to basket
    
    func testAddToBasket() {
        let basketManager = BasketManager(errorParser: ErrorParser(), sessionManager: session, baseUrl: baseUrl)
        
        let expect = expectation(description: "Add to basket")
        basketManager.addToBasket(productId: 123, quantity: 1) { response in
            switch response.result {
            case .success(let modelRequest):
                XCTAssertEqual(modelRequest.result, 1)
                expect.fulfill()
            case .failure(let error):
                XCTFail(error.localizedDescription)
            }
        }
        
        waitForExpectations(timeout: 10.0)
    }

    func testAddToBasketFail() {
        let basketManager = BasketManager(errorParser: ErrorParser(), sessionManager: session, baseUrl: failUrl)
        let expect = expectation(description: "Add to basket test to FAIL")
        
        basketManager.addToBasket(productId: 123, quantity: 1) { response in
            switch response.result {
            case .success(let modelResult):
                XCTFail("Should have a error \(modelResult)")
            case .failure:
                expect.fulfill()
            }
        }
        waitForExpectations(timeout: 10.0)
    }
    
    // MARK: - Test Delete from basket
    
    func testDeleteFromBasket() {
        let basketManager = BasketManager(errorParser: ErrorParser(), sessionManager: session, baseUrl: baseUrl)
        
        let expect = expectation(description: "Delete from basket")
        basketManager.deleteFromBasket(productId: 123) { response in
            switch response.result {
            case .success(let modelRequest):
                XCTAssertEqual(modelRequest.result, 1)
                expect.fulfill()
            case .failure(let error):
                XCTFail(error.localizedDescription)
            }
        }
        
        waitForExpectations(timeout: 10.0)
    }
    
    func testDeleteFromBasketFail() {
        let basketManager = BasketManager(errorParser: ErrorParser(), sessionManager: session, baseUrl: failUrl)
        let expect = expectation(description: "Delete from basket test to FAIL")
        
        basketManager.deleteFromBasket(productId: 123) { response in
            switch response.result {
            case .success(let modelResult):
                XCTFail("Should have a error \(modelResult)")
            case .failure:
                expect.fulfill()
            }
        }
        waitForExpectations(timeout: 10.0)
    }
}
